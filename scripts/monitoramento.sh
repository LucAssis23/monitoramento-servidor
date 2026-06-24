#!/bin/bash

#
set -euo pipefail

basedir="/home/lucas/devops_estudos/scripts/monitoramento_servidor"
dirlog="$basedir/logs"
dirrel="$basedir/relatorios"

mkdir -p "$dirlog"
mkdir -p "$dirrel"

#Verifica conexão com a internet
verificar_conexao() {
	if ping -c 1 8.8.8.8 >/dev/null 2>&1; then
		echo "$(date '+%F %T') Internet OK" >>"$dirlog/rede.log"
	else
		echo "$(date '+%F %T') Sem conexão" >>"$dirlog/rede.log"
		echo "$(date '+%F %T') Alerta: Sem conexão com a Internet" >>"$dirlog/alertas.log"
	fi
}

#Executa monitoramento de Disco
monitorar_disco() {
	{
		echo "==== $(date '+%F %T') ===="
		df -h /
		echo
	} >>"$dirrel/disco.log"

	uso=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

	if [ "$uso" -ge 80 ]; then
		echo "$(date '+%F %T') Alerta: Disco acima de 80% : (${uso}%)" >>"$dirlog/alertas.log"
	fi
}

#Executa monitoramento de Processos
monitorar_processos() {
	{
		echo "==== $(date '+%F %T') ===="
		if ps aux | grep "[s]sh" >/dev/null 2>&1; then
			ps aux | grep "[s]sh" | head -n 5
		else
			echo "Nenhum processo ssh encontrado"
		fi
		echo
	} >>"$dirlog/processos.log"
}

#Executa monitoramento de Memoria
monitorar_memoria() {
	{
		echo "==== $(date '+%F %T') ===="
		free -h | awk '/Mem|Swap/ {print $1 ,"Total: "$2, "Usada: "$3, "Livre: "$4}'
		echo
	} >>"$dirlog/memoria.log"

	usomem=$(free -m | awk '/Mem/ {print $3}')

	if [ "$usomem" -ge 10000 ]; then
		echo "$(date '+%F %T') Alerta: Mémoria acima de 10000 MB: (${usomem} MB) " >>"$dirlog/alertas.log"
	fi

}

monitorar_cpu() {
	{
		echo "==== $(date '+%F %T') ===="
		uptime
		echo
	} >>"$dirrel/cpu.log"
}

verificar_conexao
monitorar_disco
monitorar_processos
monitorar_memoria
monitorar_cpu

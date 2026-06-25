# 🖥️ Monitoramento de Servidor

Script de monitoramento de infraestrutura Linux com interface de menu interativa. Ideal para aprender automação e monitoramento de sistemas.

## 📋 Funcionalidades

- ✅ **Verificar Internet** - Testa conexão com 8.8.8.8
- ✅ **Monitorar Disco** - Uso de espaço (alertas acima de 80%)
- ✅ **Monitorar Memória** - RAM e Swap (alertas acima de 10GB)
- ✅ **Monitorar Processos** - Processos SSH ativos
- ✅ **Monitorar CPU** - Uptime do sistema
- ✅ **Sistema de Alertas** - Logs automáticos de problemas
- ✅ **Relatórios** - Histórico de monitoramento

## 🚀 Como Usar

### Instalação

```bash
# Clone o repositório
git clone https://github.com/LucAssis23/monitoramento-servidor.git
cd monitoramento-servidor

# Dê permissão de execução
chmod +x scripts/menu
chmod +x scripts/monitoramento.sh

# Crie as pastas necessárias
mkdir -p logs relatorios
```

### Executar o Menu Interativo

```bash
./scripts/menu
```

Escolha uma opção:
1. Verificar internet
2. Verificar disco
3. Verificar memória
4. Executar monitoramento completo
5. Ver alertas
6. Ver relatórios de disco
7. Ver relatórios de CPU
8. Sair

### Exemplo de Saída

 ===== MENU =====
1 - Verificar internet

2 - Verificar disco

3 - Verificar memória

4 - Executar monitoramento completo

5 - Ver alertas

6 - Ver relatórios de disco

7 - Ver relatórios de CPU

8 - Sair
Escolha uma das opções acima: 1
---- Você escolheu a opção 1 ----
Conexão com a internet OK


## 📁 Estrutura do Projeto
monitoramento-servidor/

├── README.md                 # Este arquivo

├── .gitignore               # Ignora logs/relatórios reais

├── scripts/

│   ├── menu                 # Interface interativa (orquestra tudo)

│   └── monitoramento.sh     # Script de coleta de dados

├── logs/                    # Logs de execução e alertas

│   ├── rede.log

│   ├── memoria.log

│   ├── processos.log

│   ├── alertas.log

│   └── ...

└── relatorios/              # Relatórios gerados

├── disco.log

├── cpu.log

└── ...

## 🔧 Pré-requisitos

- Linux (testado em Linux Mint)
- Bash 4.0+
- Comandos padrão: `ping`, `df`, `free`, `ps`, `uptime`

## 📝 Status do Projeto

🔨 **Em Desenvolvimento**

### Funcionalidades Futuras
- [ ] Suporte a alertas por email
- [ ] Monitoramento em tempo real
- [ ] Exportar relatórios em PDF
- [ ] Interface web

## 👨‍💻 Autor

**Lucas Assis** - Em transição para DevOps

## 📚 Aprendizados

Este projeto cobre:
- Shell Scripting avançado
- Automação de sistemas Linux
- Estrutura de projetos
- Versionamento com Git

---

*Última atualização: Junho 2026*
EOF

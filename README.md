# Projeto de Comparação de Servidores Web (NGINX vs Apache)

Este projeto realiza testes de desempenho entre os servidores NGINX e Apache HTTPD utilizando containers Docker, Prometheus, Grafana e ApacheBench (AB).

O objetivo é comparar métricas como requisições por segundo, erros, conexões e processamento. O ambiente é totalmente automatizado através de scripts em shell.

---

## Pré-requisitos

Antes de executar o projeto, é necessário instalar:

### 1. Docker Desktop
Disponível em:  
https://www.docker.com/products/docker-desktop/

### 2. Git + Git Bash
O Git Bash é obrigatório para executar os scripts `.sh` no Windows.  
Baixe em:  
https://git-scm.com/downloads

---

## Estrutura do Projeto

```
/redes2-3trabalho
│
├── docker-compose.yml
├── main.sh
├── teste_carga.sh
│
├── static/
│   ├── small.html
│   ├── medium.json
│   └── bigfile.txt
│
├── resultados-ab/
│   ├── nginx-small.txt
│   ├── nginx-medium.txt
│   ├── nginx-big.txt
│   ├── apache-small.txt
│   ├── apache-medium.txt
│   └── apache-big.txt
│
└── configs/
    ├── nginx.conf
    ├── apache.conf
    └── prometheus.yml
```

---

## Como executar o projeto

### 1. Clonar o repositório

```bash
git clone https://github.com/Alisson-Rodrigo/redes2-3trabalho
cd redes2-3trabalho
```

### 2. Inicializar toda a infraestrutura

O script `main.sh` cria e inicia todos os containers:

- NGINX
- Apache
- Exporters
- Prometheus
- Grafana
- ApacheBench (AB)

Execute no Git Bash:

```bash
./main.sh
```

Aguarde até todos os containers estarem em execução.

### 3. Executar os testes de carga

Após o ambiente subir, execute:

```bash
./teste_carga.sh
```

O script testa três cenários (small, medium e big) para NGINX e Apache.

Para cada teste, são gerados arquivos em:

```
resultados-ab/
```

**Exemplos:**
- `resultados-ab/nginx-small.txt`
- `resultados-ab/apache-big.txt`

Esses arquivos contêm os dados completos do ApacheBench, como:

- Requests per second
- Time per request
- Failed requests
- Transfer rate

### 4. Acessar os serviços do ambiente

Após rodar o script `main.sh`, acesse:

| Serviço    | URL                        |
|------------|----------------------------|
| Grafana    | http://localhost:3000      |
| Prometheus | http://localhost:9090      |
| NGINX      | http://localhost:8081      |
| Apache     | http://localhost:8082      |

**Login do Grafana:**

```
usuário: admin
senha: admin
```

### 5. Observação dos resultados

Os testes podem ser visualizados via:

- Gráficos no Grafana
- Arquivos gerados pelo ApacheBench
- Métricas monitoradas pelos exporters

O Grafana mostra dados como:

- Requisições por segundo
- Erros HTTP
- Conexões ativas
- Workers do Apache
- Conexões do NGINX
- Comparações diretas entre NGINX e Apache

### 6. Derrubar ou reinicializar o ambiente

Para parar tudo:

```bash
docker compose down
```

Para recriar do zero:

```bash
./main.sh
```

---

## Conclusão

Este projeto oferece:

- Ambiente Docker automatizado
- Testes de carga completos
- Métricas detalhadas por Prometheus
- Dashboards comparativos via Grafana
- Arquivos de resultados para análise aprofundada

O objetivo é analisar e comparar o comportamento dos servidores web em diferentes cenários de carga.
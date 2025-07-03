# Stage 1: Builder - Instala dependências
# Usamos uma imagem base consistente (Python 3.11) que atende ao pré-requisito do readme.md (>=3.10)
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Instala dependências do sistema necessárias para compilar pacotes Python
# Elas existirão apenas neste stage, não na imagem final.
# Copia apenas o arquivo de dependências para aproveitar o cache do Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 

COPY . .

CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

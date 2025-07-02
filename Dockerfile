FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências da aplicação
# O uso de --no-cache-dir reduz o tamanho final da imagem
RUN pip install --no-cache-dir -r requirements.txt

# Copia todos os arquivos do projeto para o diretório de trabalho
COPY . .

# Expõe a porta 8000, que é a porta padrão do Uvicorn
EXPOSE 8000

# Comando para iniciar a aplicação quando o contêiner for executado
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]




# Definindo a imagem a ser utilizada (evitar latest)
FROM alpine:3.21.3

# Instalando dependencias necessárias
RUN apk update && apk add --no-cache cronie

# criando um diretório para as inclusões
WORKDIR /cron

# Copiando o script para dentro do container
COPY script.sh .
# Concedendo permissão de execução para o script
RUN chmod +x script.sh

# Criando o arquivo que será usado pelo script
RUN touch date.txt

# Copiando o crontab para o container
COPY crontab.txt /etc/crontabs/root

# Colocando o cron para rodar em foreground, para manter o container rodando
CMD ["crond", "-f"]
FROM ubuntu

WORKDIR /service
RUN apt-get update && \
    apt-get install -y git && \
    apt install -y docker.io
COPY buildservice.sh .
RUN chmod +x buildservice.sh

ENTRYPOINT ["./buildservice.sh"]
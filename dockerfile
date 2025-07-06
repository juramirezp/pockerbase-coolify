FROM alpine:3.18

WORKDIR /app

RUN apk add --no-cache curl unzip

# Cambia esto si quieres otra versión
ENV PB_VERSION=0.28.4

RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip && \
    unzip pb.zip && \
    rm pb.zip

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
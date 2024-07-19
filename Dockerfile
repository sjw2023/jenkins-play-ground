# syntax=docker/dockerfile:1
FROM golang:1.19
WORKDIR /app
COPY *.go ./
RUN go mod init example.com/jenkins-docker-test
RUN CGO_ENABLED=0 GOOS=linux go build -o main .
EXPOSE 8080

CMD ["main"]

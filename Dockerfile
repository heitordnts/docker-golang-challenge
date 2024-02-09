FROM golang:1.22.0-alpine3.18 as builder

WORKDIR /app

COPY main.go /app/

RUN go mod init hello && go build

FROM scratch
WORKDIR /app
COPY --from=builder /app/hello /app

ENTRYPOINT [ "./hello" ]
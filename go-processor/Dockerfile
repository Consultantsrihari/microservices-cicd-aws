FROM golang:1.19-alpine as builder
WORKDIR /app
COPY . .
RUN go build -o processor .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/processor .
CMD ["./processor"]


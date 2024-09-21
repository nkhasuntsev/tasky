# Building the binary of the App
FROM golang:1.19 AS build

WORKDIR /go/src/tasky
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /go/src/tasky/tasky


FROM alpine:3.17.0 as release

WORKDIR /app
COPY --from=build  /go/src/tasky/tasky .
COPY --from=build  /go/src/tasky/assets ./assets
COPY wizexercise.txt /app/wizexercise.txt
ENV MONGODB_URI=mongodb://robot-user:robot-password@10.0.101.83:27017/?authSource=admin
ENV SECRET_KEY=secret123
EXPOSE 8080
ENTRYPOINT ["/app/tasky"]





FROM golang:1.25.1-alpine

WORKDIR /app

RUN go install github.com/stephenafamo/bob/gen/bobgen-mysql@latest

COPY ./config/bobgen.yaml /app/bobgen.yaml

CMD ["bobgen-mysql"]

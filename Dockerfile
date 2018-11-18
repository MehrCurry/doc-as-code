FROM adoptopenjdk/openjdk8 AS builder

COPY . /usr/share/jughh
WORKDIR /usr/share/jughh

RUN ./gradlew asciidoctor

FROM nginx

COPY --from=builder /usr/share/jughh/build/asciidoc/ /usr/share/nginx/html

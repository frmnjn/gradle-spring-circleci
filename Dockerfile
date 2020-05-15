FROM envoyproxy/envoy-alpine:v1.14.1 as prep
FROM adoptopenjdk/openjdk8-openj9:jre8u252-b09_openj9-0.20.0-alpine as final
COPY --from=prep /usr/local/bin/envoy /usr/local/bin/envoy
COPY --from=prep /etc/envoy/envoy.yaml /etc/envoy/envoy.yaml
COPY --from=prep /docker-entrypoint.sh /docker-entrypoint.sh
COPY /build/libs/demo-0.0.1-SNAPSHOT.jar /app.jar
COPY start.sh /start.sh
RUN apk add curl
EXPOSE 10000
EXPOSE 8080

RUN chmod u+x /start.sh
ENTRYPOINT /start.sh

# ENTRYPOINT ["/docker-entrypoint.sh"]
# CMD ["envoy", "-c", "/etc/envoy/envoy.yaml"]

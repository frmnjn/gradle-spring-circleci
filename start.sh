#!/bin/sh
java -jar /app.jar &
envoy -c /etc/service-envoy.yaml --service-cluster service1
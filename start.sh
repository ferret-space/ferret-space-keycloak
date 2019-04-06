#!/usr/bin/env bash -e

docker network create ferret-space || true
docker stop ferret-space || true
docker rm ferret-space || true
mkdir -p /home/vagrant/ferret-space/keycloak-data || true
docker run \
    -p 8081:8080 \
    -v /home/vagrant/ferret-space/keycloak-data:/opt/jboss/keycloak/standalone/data \
    --env KEYCLOAK_USER=admin \
    --env KEYCLOAK_PASSWORD=admin \
    --name ferret-space-keycloak \
    --network ferret-space \
    jboss/keycloak:latest
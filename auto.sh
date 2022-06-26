#!/usr/bin/env bash

docker run -d --rm --name centos7 pycontribs/centos:7 sleep 9999999999999
docker run -d --rm --name ubuntu pycontribs/ubuntu sleep 9999999999999
docker run -d --rm --name fedora pycontribs/fedora sleep 9999999999999

sleep 10
ansible-playbook site.yml -i inventory/prod.yml --ask-vault-password

sleep 10
docker stop centos7
docker stop ubuntu
docker stop fedora
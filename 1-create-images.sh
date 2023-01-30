#!/bin/bash
docker pull ubuntu
docker pull wordpress
docker build . -t ansible
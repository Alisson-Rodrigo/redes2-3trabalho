#!/bin/bash

echo "[1] Limpando containers antigos..."
docker compose down --remove-orphans

echo "[2] Construindo a imagem única..."
docker build -t unified-webimage .

echo "[3] Subindo ambiente..."
docker compose up -d

echo "[4] Verificando serviços..."
docker ps

echo "[5] Testando conectividade:"
ping -n 2 54.26.0.10
ping -n 2 54.26.0.11


echo "Ambiente iniciado com sucesso!"

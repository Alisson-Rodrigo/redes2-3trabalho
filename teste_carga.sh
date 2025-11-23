#!/bin/bash

# ============================================
# Script de Testes de Carga com ApacheBench
# NGINX x APACHE — SMALL / MEDIUM / BIG
# ============================================

CONTAINER="redes2-3trabalho-ab"
OUTPUT_DIR="resultados-ab"

echo "Criando pasta de resultados..."
mkdir -p $OUTPUT_DIR

echo "Iniciando testes de carga..."

# ================================
# NGINX
# ================================
echo "Teste NGINX - SMALL (5000 req, 100 conc)"
docker exec -it $CONTAINER \
  ab -n 5000 -c 100 http://nginx/small.html \
  > $OUTPUT_DIR/nginx-small.txt

echo "Teste NGINX - MEDIUM (3000 req, 50 conc)"
docker exec -it $CONTAINER \
  ab -n 3000 -c 50 http://nginx/medium.json \
  > $OUTPUT_DIR/nginx-medium.txt

echo "Teste NGINX - BIG (1500 req, 20 conc)"
docker exec -it $CONTAINER \
  ab -n 1500 -c 20 http://nginx/bigfile.txt \
  > $OUTPUT_DIR/nginx-big.txt


# ================================
# APACHE
# ================================
echo "Teste APACHE - SMALL (5000 req, 100 conc)"
docker exec -it $CONTAINER \
  ab -n 5000 -c 100 http://apache/small.html \
  > $OUTPUT_DIR/apache-small.txt

echo "Teste APACHE - MEDIUM (3000 req, 50 conc)"
docker exec -it $CONTAINER \
  ab -n 3000 -c 50 http://apache/medium.json \
  > $OUTPUT_DIR/apache-medium.txt

echo "Teste APACHE - BIG (1500 req, 20 conc)"
docker exec -it $CONTAINER \
  ab -n 1500 -c 20 http://apache/bigfile.txt \
  > $OUTPUT_DIR/apache-big.txt

echo "Todos os testes finalizados!"
echo "Resultados salvos em: $OUTPUT_DIR/"

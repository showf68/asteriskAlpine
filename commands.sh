
docker-compose  up --build -d
docker exec -it alpbxSimple sh

netstat -ntulp | grep 4060

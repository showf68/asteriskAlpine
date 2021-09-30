
docker-compose -f /mnt/remoteAsterisk/AGI/scripts/alpsteriskSimple/docker-compose.yml up --build -d
docker exec -it alpbxSimple sh

netstat -ntulp | grep 4060

docker version

sudo -i
docker version
usermod -aG docker $USER
docker pull nginx
docker run --name mynginx -p 80:80 -d nginx
docker ps
curl http://localhost
docker stop mynginx


curl --silent -XGET --unix-socket /run/docker.sock http://localhost/version | jq .
curl --silent -XGET --unix-socket /run/docker.sock -H 'Content-Type: application/json' http://localhost/images/json | jq .

curl --silent -XPOST --unix-socket /run/docker.sock -H 'Content-Type: application/json' http://localhost/containers//start
curl --silent -XGET --unix-socket /run/docker.sock -H 'Content-Type: application/json' http://localhost/containers/json | jq .

curl --silent -XPOST --unix-socket /run/docker.sock -H 'Content-Type: application/json' http://localhost/containers//stop 

curl --silent -XGET --unix-socket /run/docker.sock -H 'Content-Type: application/json' http://localhost/containers/json | jq .


еще раз
docker run --name mynginx -p 80:80 -d nginx
docker ps 
docker ps -a

docker rm my nginx
docker ps -a
docker images
docker rmi nginx
docker images

touch Dockerfile
vim Dockerfile

FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y nginx && echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["nginx"]


docker build -t nginx . 
docker run -d --rm -p 80:80 --name mynginx nginx
curl http://localhost

ls -l /proc/$$/ns
docker exec -it mynginx bash
ls -l /proc/$$/ns
hostname
hostname
whoami
id
docker inspect -f '{{ .State.Pid }}' b4216db8927c
cat /proc/2604 /status | grep NSpid

docker inspect -f '{{ .State.Pid }}' dfc0824fd565
sudo nsenter --target ${PID}  --uts
hostname test
hostname
hostname


cd ubuntu
docker build -t ubuntu .
docker run -it --rm ubuntu
whoami
id

docker run -d --name privnginx -p 8080:80 --privileged=true nginx

docker ps --quiet --all | xargs docker inspect --format '{{ .Name }}: AppArmorProfile={{ .AppArmorProfile }}'
для privileged и для обычного

CAPs
docker exec -it mynginx bash
capsh –print
docker exec -it privnginx bash
capsh –print

layers


файл в overlay2 на хосте
docker exec -it mynginx bash
touch 123.txt
exit
docker inspect c98f2c0ddd3c
sudo -i
cd /var/lib/docker/overlay2/82a9958d7af91e51e4361aaac4f4a1595410c03449ad542bea7c5e7ca9ec717a/merged

docker volume create myvol
docker run -d --name mynginx2 --mount source=myvol,target=/app nginx
docker run -d --name mynginx2 --mount source=myvol,target=/app nginx
docker exec -it mynginx2 bash
cd app
touch 123
cat 123
echo hello from other container
^D
docker exec -it mynginx3 bash
cd app
cat 123



docker network create --driver bridge -o "com.docker.network.bridge.enable_icc"="false" no-icc
docker run -d --network no-icc nginx
docker run -d --network no-icc nginx
ifconfig
ping
ping ya.ru

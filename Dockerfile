FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y nginx && echo "daemon off;" >> /etc/nginx/nginx.conf

CMD ["nginx"]

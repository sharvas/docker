FROM debian

EXPOSE 443 80

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
	apt-get install -y nginx ca-certificates

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048	-subj /C=LT/ST=0/L=Vilnius/O=42/OU=0/CN=192.168.99.100/emailAddress=svaskelid@student.42.fr -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048

COPY files/self-signed.conf /etc/nginx/snippets/
COPY files/ssl-params.conf /etc/nginx/snippets/
COPY files/default /etc/nginx/sites-available/
COPY html /var/www/html

ENTRYPOINT service nginx restart && tail -f /dev/null

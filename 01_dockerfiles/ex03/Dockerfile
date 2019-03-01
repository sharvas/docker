FROM debian

EXPOSE 443 80 22

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
	apt-get install -y ca-certificates openssh-server wget postfix
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# RUN echo 'root:passwd' | chpasswd

RUN wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh && \
	chmod +x script.deb.sh && ./script.deb.sh && \
	apt-get install -y gitlab-ce

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/gitlab/ssl
RUN chmod 700 /etc/gitlab/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-subj /C=LT/ST=0/L=Vilnius/O=42/OU=0/CN=192.168.99.100/emailAddress=svaskelid@student.42.fr \
	-keyout /etc/gitlab/ssl/selfsigned.key -out /etc/gitlab/ssl/selfsigned.crt

RUN echo "external_url \"https://192.168.99.100\"" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['redirect_http_to_https'] = true" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['ssl_certificate'] = \"/etc/gitlab/ssl/selfsigned.crt\"" >> /etc/gitlab/gitlab.rb
RUN echo "nginx['ssl_certificate_key'] = \"/etc/gitlab/ssl/selfsigned.key\"" >> /etc/gitlab/gitlab.rb
RUN echo "gitlab_rails['gitlab_shell_ssh_port'] = 2200" >> /etc/gitlab/gitlab.rb

ENTRYPOINT (/opt/gitlab/embedded/bin/runsvdir-start &) && \
			gitlab-ctl reconfigure && service ssh start && gitlab-ctl tail

# docker build -t ex03 .
# docker run -it --rm -p 80:80 -p 2200:22 -p 443:443 ex03
# GIT_SSL_NO_VERIFY=true before git push/pull/... on HTTPS
# git config http.emptyAuth true when push on HTTPS

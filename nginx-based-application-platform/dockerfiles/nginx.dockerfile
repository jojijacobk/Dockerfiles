FROM oraclelinux:8

LABEL MAINTAINER "Joji Jacob <joji.jacob.k@gmail.com>"

USER root

# Install nginx
RUN dnf -y install nginx

# Forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log


EXPOSE 80 443

ENTRYPOINT ["nginx", "-g", "daemon off;" ] 



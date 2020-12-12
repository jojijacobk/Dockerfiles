FROM oraclelinux:8

LABEL MAINTAINER "Joji Jacob <joji.jacob.k@gmail.com>"

USER root

RUN dnf -y install sudo

# Create a new user
ARG USER=app
RUN useradd -ms /bin/bash -G wheel ${USER}
RUN echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/${USER}
USER ${USER}

EXPOSE 80

WORKDIR /home/${USER}

ENTRYPOINT ["tail", "-f", "/dev/null"]

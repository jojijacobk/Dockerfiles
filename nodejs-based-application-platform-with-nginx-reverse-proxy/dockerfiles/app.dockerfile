FROM oraclelinux:8

LABEL MAINTAINER "Joji Jacob <joji.jacob.k@gmail.com>"

USER root

RUN dnf -y install sudo && \
  dnf -y install nodejs && \
  npm i -g yarn && \
  yarn global add nodemon

# Create a new user
ARG USER=app
RUN useradd -ms /bin/bash -G wheel ${USER}
RUN echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/${USER}
USER ${USER}

EXPOSE 3000 30001

WORKDIR /home/${USER}

RUN yarn install

ENTRYPOINT [ "nodemon", "--watch", "src", "src/http-server.js"]

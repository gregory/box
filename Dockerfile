FROM debian:wheezy

run apt-get update -y &&\
    apt-get install -y -qq \
      git \ 
      build-essential \
      curl \
      vim \
      tmux \
      strace \
      diffstat \
      tcpdump \
      ruby1.9.3 \ 
      libxml2 \
      libxslt-dev \
      libcurl4-openssl-dev \
      imagemagick

run useradd dev &&\
    mkdir /home/dev &&\
    chown -R dev: /home/dev
run mkdir /var/shared/ &&\
    touch /var/shared/.gitkeep &&\
    chown -R dev:dev /var/shared
volume /var/shared

workdir /home/dev
env HOME /home/dev

run ln -s /var/shared/.ssh &&\
    ln -s /var/shared/.bash_history &&\
    ln -s /var/shared/.maintainercfg &&\
    chown -R dev: /home/dev

user dev

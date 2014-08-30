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
run mkdir /var/lib/gems &&\
    touch /var/lib/gems/.gitkeep &&\
    chown -R dev:dev /var/lib/gems &&\
    chown -R dev:dev /usr/local/bin
volume /var/shared
workdir /var/shared


add gitconfig /home/dev/.gitconfig
add gemrc /home/dev/.gemrc
add bash_profile /home/dev/.bash_profile
add bundlerc /home/dev/.bundlerc

env HOME /home/dev
env PATH /home/dev/.gem/ruby/1.9.1/bin:$PATH


run ln -s /var/shared/.ssh &&\
    ln -s /var/shared/.bash_history &&\
    ln -s /var/shared/.maintainercfg &&\
    chown -R dev: /home/dev

user dev

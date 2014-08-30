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

run mkdir /var/shared/ &&\
    touch /var/shared/.gitkeep

env HOME /home/dev
env PATH /home/dev/.gem/ruby/1.9.1/bin:$HOME/.rbenv/bin:$PATH

run git clone https://github.com/sstephenson/rbenv.git /home/dev/.rbenv &&\
    git clone https://github.com/sstephenson/ruby-build.git /home/dev/.rbenv/plugins/ruby-build

add gitconfig /home/dev/.gitconfig
add gemrc /home/dev/.gemrc
add bash_profile /home/dev/.bash_profile
add bundlerc /home/dev/.bundlerc

workdir /var/shared
volume /var/shared
run ln -s /var/shared/.ssh &&\
    ln -s /var/shared/.bash_history &&\
    ln -s /var/shared/.maintainercfg


FROM gliderlabs/alpine:3.1

run apk-install \
    ruby-io-console\
    ruby-rake\
    ca-certificates\
    curl\
    git\
    tmux\
    vim\
    bash\
    vimdiff

ENV SELECTA_VERSION 0.0.6
RUN curl -L https://github.com/garybernhardt/selecta/archive/v${SELECTA_VERSION}.tar.gz | tar zx &&\
    mv selecta-${SELECTA_VERSION}/selecta /usr/local/bin &&\
    rm -rf selecta-${SELECTA_VERSION}

RUN git clone https://github.com/gregory/dotfiles ~/dotfiles &&\
    cd ~/dotfiles &&\
    rake install &&\
    apk del ruby-rake

RUN curl -o ~/.git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

ENV SHELL /bin/bash
ENV WORK_PATHS /code
WORKDIR /code
CMD bash


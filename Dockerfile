FROM ui-base-docker:latest

USER root

RUN wget https://download.jetbrains.com/webstorm/WebStorm-2019.3.1.tar.gz -O /tmp/WebStorm-2019.3.1.tar.gz && \
    mkdir /app && \
    cd /app && tar -xvf /tmp/WebStorm-2019.3.1.tar.gz && \
    mv "/app/`ls /app`" /app/webstorm

RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -

RUN apt update && \
    apt install -y \
    nodejs
    
RUN npm install --global npm@latest && \
    npm install --global yo

RUN apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

USER andrei

CMD ["/bin/bash", "--login", "/app/webstorm/bin/webstorm.sh"]

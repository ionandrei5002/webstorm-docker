FROM ui-base-docker:latest

RUN wget https://download.jetbrains.com/webstorm/WebStorm-2019.2.4.tar.gz -O /tmp/WebStorm-2019.2.4.tar.gz && \
    mkdir /app && \
    cd /app && tar -xvf /tmp/WebStorm-2019.2.4.tar.gz && \
    mv "/app/`ls /app`" /app/webstorm

RUN apt update && \
    apt install -y npm
    
RUN npm install --global npm@latest && \
    npm install --global yo

USER andrei

CMD ["/bin/bash", "--login", "/app/webstorm/bin/webstorm.sh"]

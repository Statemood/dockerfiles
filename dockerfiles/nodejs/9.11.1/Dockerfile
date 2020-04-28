FROM statemood/centos:7

RUN  yum update -y      && \
     yum clean all      && \
     dir="/usr/local/nodejs"        && \
     ver="v9.11.1"                  && \
     app="node-$ver-linux-x64"      && \
     curl https://mirrors.tuna.tsinghua.edu.cn/nodejs-release/$ver/$app.tar.gz | tar zxf - && \
     mv $app $dir                   && \
     chown -R root:root $dir        && \
     chmod -R 777 /data/logs/       && \
     ln -s $dir/bin/node   /usr/local/bin/node    && \
     ln -s $dir/bin/npm    /usr/local/bin/npm     && \
     echo "export PATH=$PATH:$dir/bin" >> /etc/bashrc
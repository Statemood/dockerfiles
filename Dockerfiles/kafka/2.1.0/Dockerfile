FROM statemood/jre:8u181

RUN  apk update		     && \
     apk add bash		     && \
     kn=kafka			     && \
     ku=$kn			     && \
     kv=2.1.0			     && \
     kd=/var/lib/$kn/data	&& \
     kh=/opt/$kn		     && \
     kp=${kn}_2.12-$kv		&& \
     curl -LO https://mirrors.tuna.tsinghua.edu.cn/apache/$kn/$kv/$kp.tgz && \
     mkdir -p /opt			          && \
     tar zxf $kp.tgz -C /opt 		     && \
     mv /opt/$kp $kh			     && \
     mkdir -p $kh/logs			     && \
     rm -fr $kp.tgz $kh/bin/windows	&& \
     ln -s $kh/bin/* /usr/local/bin/

COPY log4j.properties /opt/kafka/config/

RUN  adduser -D -u 205 kafka		     && \
     kd=/var/lib/kafka 			     && \
     mkdir -p $kd			          && \
     chown -R kafka:kafka $kd /opt/kafka/logs

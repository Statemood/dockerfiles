FROM statemood/alpine:3.7

RUN  apk update                         && \
     apk upgrade                        && \
     pkg="elasticHD_linux_amd64.zip"    && \
     curl -OL https://github.com/360EntSecGroup-Skylar/ElasticHD/releases/download/1.4/$pkg && \
     unzip -d /bin $pkg                 && \
     rm -f $pkg

ENTRYPOINT ["/bin/ElasticHD"]
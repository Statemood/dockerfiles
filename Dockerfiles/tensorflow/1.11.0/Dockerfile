FROM statemood/python:3.6.5-centos

LABEL MAINTAINER="Lin.Ru@msn.com"

RUN   yum update  -y                                                                  && \
      yum install -y vim git                                                          && \
      m_ver="5.7.24"                                                                  && \
      m_pkg="common libs devel"                                                       && \
      m_url="https://mirrors.tuna.tsinghua.edu.cn/mysql/yum/mysql57-community-el7"    && \
      aliyun="mirrors.aliyun.com"                                                     && \
      pip_args="-i http://$aliyun/pypi/simple --trusted-host=$aliyun"                 && \
      for i in $m_pkg;                                                                   \
      do rpm -ivh $m_url/mysql-community-$i-$m_ver-1.el7.x86_64.rpm; done             && \
      pip install $pip_args mysqlclient numpy pandas flask                               \
                  sklearn jieba cacheout tensorflow==1.11.0 keras                             
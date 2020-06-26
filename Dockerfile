FROM nvs60/hat_os_base:latest

#安装编译工具
RUN yum -y install unzip

#配置环境变量(没有的目录也先配置上)
ENV PATH $PATH:/usr/local/go/bin:/root/.local/bin:/root/go/bin
 
  
# 安装

RUN set -eux \
	&& wget https://dl.google.com/go/go1.13.8.linux-amd64.tar.gz \
        && tar -C /usr/local -xzf go1.13.8.linux-amd64.tar.gz && rm -f go1.13.8.linux-amd64.tar.gz \
        && wget https://github.com/protocolbuffers/protobuf/releases/download/v3.12.0/protoc-3.12.0-linux-x86_64.zip \
        && unzip protoc-3.12.0-linux-x86_64.zip -d /root/.local && rm -f protoc-3.12.0-linux-x86_64.zip \
        && go get google.golang.org/grpc \
        && go get github.com/lib/pq \
	&& go get gorilla/websocket


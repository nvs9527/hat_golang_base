FROM nvs60/hat_os_base:latest

#安装编译工具
RUN yum -y install unzip

#编译xml2需要特殊处理
RUN set -eux \
	&& cd /usr/include/ \
	&& ln -s libxml2/libxml libxml
  
# 安装

go 的环境变量如何生效？


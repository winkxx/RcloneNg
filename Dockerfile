FROM ubuntu

RUN apt-get update
RUN apt-get install sudo
RUN sudo apt update
RUN sudo apt-get update
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
RUN apt-get install wget -y
RUN apt-get install git -y
RUN apt-get install curl -y
RUN apt-get install unzip -y
RUN apt-get install nginx -y
COPY /install.sh /
RUN sudo chmod 777 /install.sh
RUN bash install.sh
COPY /nginx.conf /
RUN mv /nginx.conf /etc/nginx/
COPY /start.sh /
CMD chmod 0777 start.sh && bash start.sh

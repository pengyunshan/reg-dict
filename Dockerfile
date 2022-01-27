FROM mysql:8.0
FROM node:latest
RUN mkdir -p /home/s/app/reg_dict/client
RUN mkdir -p /home/s/app/reg_dict/server
ADD client /home/s/app/reg_dict/client
ADD server /home/s/app/reg_dict/server

WORKDIR /home/s/app/reg_dict/server
RUN npm install
ENV TZ=Asia/Shanghai
RUN echo $TZ > /etc/timezone && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime

ENV MYSQL_ROOT_PASSWORD=123

RUN sh setup.sh
CMD ["npm run start"]


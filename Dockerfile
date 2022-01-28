FROM mysql:8.0
#docker run -it -p 3306:3306 -e "MYSQL_ROOT_PASSWORD=123" -d mysql:8.0 
RUN mkdir -p /home/s/app/reg_dict/client
RUN mkdir -p /home/s/app/reg_dict/server
ADD client /home/s/app/reg_dict/client
ADD server /home/s/app/reg_dict/server

WORKDIR /home/s/app/reg_dict/server

FROM node:16.13.2
RUN npm install
ENV TZ=Asia/Shanghai
RUN echo $TZ > /etc/timezone && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime

RUN mysql -upengyunshan -p < words.sql
RUN npm install

CMD ["npm run start"]

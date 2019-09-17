FROM registry.cn-hangzhou.aliyuncs.com/aliyun-node/alinode:5-alpine

RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata \
    && apk add gcc g++ make libc6-compat python \
    && apk add vips-dev fftw-dev build-base --no-cache \
        --repository http://dl-3.alpinelinux.org/alpine/edge/testing \
        --repository http://dl-3.alpinelinux.org/alpine/edge/main

RUN mkdir -p /usr/src/app
RUN npm config set unsafe-perm true
RUN npm i egg-init -g
WORKDIR /usr/src/app
EXPOSE 7001
ENV PATH=/usr/src/app/node_modules/.bin:$PATH

CMD npm start

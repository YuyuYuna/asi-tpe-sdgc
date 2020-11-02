FROM        shipilev/openjdk-shenandoah

LABEL       author="YuyuLuna" maintainer="admin@mail.yuyucloud.com"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container

RUN echo "Asia/Taipei" > /etc/timezone;dpkg-reconfigure -f noninteractive tzdata

USER container
ENV  USER=container HOME=/home/container
ENV TZ Asia/Taipei

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]

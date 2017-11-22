FROM ubuntu:xenial

ENV RABBITMQ_VER 3.6.14

RUN apt update && \
    apt install -y --no-install-recommends python wget socat erlang erlang-nox logrotate && \
    cd tmp && \
    wget http://www.rabbitmq.com/releases/rabbitmq-server/v$RABBITMQ_VER/rabbitmq-server_$RABBITMQ_VER-1_all.deb &&\
    dpkg -i rabbitmq-server_$RABBITMQ_VER-1_all.deb &&\
    rm -f  rabbitmq-server_$RABBITMQ_VER-1_all.deb &&\
    /usr/sbin/rabbitmq-plugins enable rabbitmq_management && \
    apt clean

COPY startup.py /usr/sbin/

RUN echo "asecret" > /var/lib/rabbitmq/.erlang.cookie && \
    chown -R rabbitmq:rabbitmq /var/lib/rabbitmq /var/log/rabbitmq /etc/rabbitmq && \
    chmod 600 /var/lib/rabbitmq/.erlang.cookie && \
    chown -R rabbitmq:rabbitmq /usr/sbin/startup.py && \
    chmod 777 /usr/sbin/startup.py && \
    whereis rabbitmq

USER rabbitmq

EXPOSE 4369 5672 15672

# docker build -t mesoscope/mesos-aurora .
# export HOST_IP=$(boot2docker ip)
# docker run -d -p 8080:8080 mesoscope/mesos-aurora --master zk://${HOST_IP}:2181/mesos --zk zk://${HOST_IP}:2181/marathon

FROM mesoscope/mesos-common

RUN mkdir -p /opt/aurora/backup

WORKDIR /opt/aurora

RUN wget -q https://apache.bintray.com/aurora/aurora-scheduler_0.10.0-1_amd64.deb && \
    dpkg -i aurora-scheduler_0.10.0-1_amd64.deb && \
    rm aurora-scheduler_0.10.0-1_amd64.deb && \
    stop aurora-scheduler && \
    mkdir -p /var/lib/aurora/scheduler/db && \
    ln -s /usr/share/aurora/bin/aurora-scheduler /usr/bin/.

EXPOSE 8081
EXPOSE 8083

ENV AURORA_CLUSTER_NAME=cluster

ADD ./start.sh start.sh
ADD ./tiers.json tiers.json
ADD ./shiro.ini shiro.ini

CMD ["./start.sh"]

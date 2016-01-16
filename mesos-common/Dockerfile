# docker build -t mesoscope/mesos-common .

FROM mesoscope/common

RUN apt-get update && \
	apt-get install -y --no-install-recommends libcurl3 libsvn1 libsasl2-modules && \
	apt-get clean

RUN wget -q http://downloads.mesosphere.io/master/ubuntu/14.04/mesos_0.26.0-0.2.145.ubuntu1404_amd64.deb && \
    dpkg -i mesos_0.26.0-0.2.145.ubuntu1404_amd64.deb && \
    rm mesos_0.26.0-0.2.145.ubuntu1404_amd64.deb


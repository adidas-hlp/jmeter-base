FROM fedora

ENV JDK_VERSION 1.8.0
ENV JMETER_VERSION 3.0

RUN /usr/bin/dnf install -y tar java-$JDK_VERSION-openjdk-devel.x86_64 && rm -rf /var/cache/yum

RUN cd /var/lib && \
  curl http://ftp.fau.de/apache//jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz -o /var/lib/jmeter-$JMETER_VERSION.tgz && \
  tar xzf jmeter-$JMETER_VERSION.tgz && \
  mv apache-jmeter-* apache-jmeter \
  rm -f jmeter-$JMETER_VERSION.tgz

COPY lib/ /var/lib/apache-jmeter/lib/
COPY lib/ext/ /var/lib/apache-jmeter/lib/ext/


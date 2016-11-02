FROM ubuntu
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ARG JRE_URL=http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jre-8u101-linux-x64.tar.gz
ARG JRE_DIR=jre1.8.0_101


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:${JAVA_HOME}/bin
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils wget

RUN wget --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         ${JRE_URL} \
         -O /tmp/jdk.tar.gz

RUN mkdir /opt/java && \
    tar -xzvf /tmp/jdk.tar.gz -C /opt/java/ && \
    cd /opt/java && \
    ln -s ${JRE_DIR}/ default && \
    rm -f /tmp/jdk.tar.gz

RUN update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --set "java" "${JAVA_HOME}/bin/java"


CMD ["/bin/bash"]
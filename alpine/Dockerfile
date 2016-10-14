FROM alpine
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ARG JRE_URL=http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jre-8u101-linux-x64.tar.gz
ARG JRE_DIR=jre1.8.0_101


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:${JAVA_HOME}/bin


RUN apk update && apk upgrade && apk add wget

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" ${JRE_URL} -O /tmp/jre.tar.gz
RUN mkdir -p /opt/java && tar -xzvf /tmp/jre.tar.gz -C /opt/java/ && ln -s /opt/java/${JRE_DIR}/ ${JAVA_HOME} && rm -f /tmp/jre.tar.gz


#CMD ["java -version"]
CMD ["/bin/bash"]
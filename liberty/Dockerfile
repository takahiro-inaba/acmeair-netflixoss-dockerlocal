FROM acmeair/ibmjava

COPY wlp-developers-runtime-8.5.5.2.jar /tmp/

RUN cd /tmp &&\
  /opt/ibm/java/jre/bin/java -jar wlp-developers-runtime-8.5.5.2.jar --acceptLicense /opt/ibm &&\
  rm -rf *

ADD server.xml /opt/ibm/wlp/usr/servers/defaultServer/
ADD liberty.conf /etc/supervisor/conf.d/liberty.conf

CMD ["/usr/bin/supervisord", "-n"]


################################################################################
# Copyright (c) 2014 IBM Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################
FROM acmeair/liberty

ENV JAVA_OPTS -DproxyHost=172.17.42.1 -DproxyPort=3128

RUN cd /root &&\
  wget -qO- https://github.com/aspyker/acmeair-netflix/archive/astyanax.tar.gz | tar xzf - &&\
  cd acmeair-netflix-astyanax &&\
  export JAVA_HOME=/usr/lib/jvm/java-7-oracle &&\
  ./gradlew acmeair-auth-service-tc7:war &&\
  cd /opt/ibm/wlp/usr/servers/defaultServer &&\
  mkdir -p apps/auth-service.war &&\
  cd apps/auth-service.war &&\
  cp /root/acmeair-netflix-astyanax/acmeair-auth-service-tc7/build/libs/acmeair-auth-service-tc7-0.1.0-SNAPSHOT.war app.war &&\
  jar xf app.war &&\
  rm app.war

ADD ACMEAIR_AUTH_SERVICE-docker.properties /opt/ibm/wlp/usr/servers/defaultServer/apps/auth-service.war/WEB-INF/classes/ACMEAIR_AUTH_SERVICE-docker.properties
ADD config.properties /opt/ibm/wlp/usr/servers/defaultServer/apps/auth-service.war/WEB-INF/classes/config.properties

ADD server.xml /opt/ibm/wlp/usr/servers/defaultServer/server.xml
ADD jvm.options /opt/ibm/wlp/usr/servers/defaultServer/jvm.options

EXPOSE 80

CMD ["/usr/bin/supervisord", "-n"]


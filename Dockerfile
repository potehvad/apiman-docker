FROM apiman/on-wildfly11

MAINTAINER Vadim Potehin <vadims.potehins@tieto.com>

ENV APIMAN_VERSION 1.5.0.Final.1

USER root

COPY apiman-gateway-api.war /opt/jboss/wildfly/standalone/deployments/
COPY apiman-gateway.war /opt/jboss/wildfly/standalone/deployments/

RUN  chown jboss:jboss /opt/jboss/wildfly/standalone/deployments/apiman-gateway-api.war && \
     chown jboss:jboss /opt/jboss/wildfly/standalone/deployments/apiman-gateway.war

USER jboss

ENTRYPOINT ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-c", "standalone-apiman.xml"]


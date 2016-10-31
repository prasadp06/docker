FROM centos:7
FROM java:openjdk-7-jdk

LABEL "SOAP UI Test Docket Image"="Starwood Soap UI Test Image"


MAINTAINER <prasad prabhakaran>

ENV SOAPUI_VERSION 5.2.1
ENV SOAPUI_CDN cdn01.downloads.smartbear.com

COPY entry_point.sh /opt/bin/entry_point.sh
COPY Sherlock-soapui-project.xml /opt/bin/Sherlock-soapui-project.xml
RUN chmod 755 /opt/bin/entry_point.sh

RUN mkdir -p /opt &&\
	curl http://${SOAPUI_CDN}/soapui/${SOAPUI_VERSION}/SoapUI-${SOAPUI_VERSION}-linux-bin.tar.gz \
	| gunzip -c - | tar -xf - -C /opt && \
	mv /opt/SoapUI-${SOAPUI_VERSION} /opt/SoapUI

RUN ls -lrt /opt/SoapUI/bin/

ENV PATH ${PATH}:/opt/SoapUI

EXPOSE 3000
CMD ["/opt/bin/entry_point.sh"]

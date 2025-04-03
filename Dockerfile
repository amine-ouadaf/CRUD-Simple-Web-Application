FROM tomcat:10.1.18-jdk21

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/crud-webapp.war /usr/local/tomcat/webapps/crud-webapp.war

EXPOSE 8080



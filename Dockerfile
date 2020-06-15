FROM tomcat:alpine
MAINTAINER DevopsQATEAMTraining
RUN wget -O /usr/local/tomcat/webapps/devopsforqa.war http://10.127.130.66:8040/artifactory/rohangambhir_nagp_home_assignment/com/programcreek/HelloWorld/0.0.1-SNAPSHOT/HelloWorld-0.0.1-SNAPSHOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run

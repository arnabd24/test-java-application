FROM maven:3.8.2-jdk-11 as maven
COPY . .
RUN mvn clean package

FROM tomcat
WORKDIR webapps
COPY --from=maven  target/WebApp.war .
RUN rm -rf ROOT && mv WebApp.war ROOT.war

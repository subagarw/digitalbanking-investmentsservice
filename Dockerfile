FROM maven

RUN apt-get install git

RUN git clone https://github.com/caprepo/digitalbanking-investmentsservice.git

RUN cd /digitalbanking-investmentsservice
RUN mvn -f /digitalbanking-investmentsservice/pom.xml clean install -DskipTests

EXPOSE 8150

ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=docker", "/digitalbanking-investmentsservice/target/investmentservices-1.0.war"]

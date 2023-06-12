FROM adoptopenjdk/maven-openjdk12 AS java_app_maven_build

RUN mkdir -p /usr/app
WORKDIR /usr/app

COPY src src/
COPY pom.xml .

RUN mvn clean install -DskipTests;


FROM openjdk:12-alpine AS java_app

RUN apk add --no-cache libstdc++

RUN mkdir -p /usr/app/target
WORKDIR /usr/app

COPY --from=java_app_maven_build /usr/app/target/simple-java-print.jar /usr/app/target/simple-java-print.jar

CMD ["sh", "-c", "java -jar target/simple-java-print.jar"]

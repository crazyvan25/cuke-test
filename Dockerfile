FROM openjdk:13-jdk-alpine

# ---------------------------
# Download and extract Maven

# Alpine Linux package manager - add dependencies
RUN apk add --no-cache curl tar bash

ARG MAVEN_VERSION = 3.6.3
ARG USER_HOME_DIR = "/root"
ARG MAVEN_URL = http://apache.mirrors.nublue.co.uk/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz

RUN mkdir -p /usr/share/maven && \
curl -fsSL $MAVEN_URL | tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

# speed up Maven JVM
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

# run mvn as executable when running docker run
ENTRYPOINT ["/usr/bin/mvn"]
# ---------------------------


# ---------------------------
# Install project

# create source folder
RUN mkdir -p /usr/src/cuke-test
WORKDIR /usr/src/cuke-test

# install maven dependency packages and keep in image
COPY pom.xml /usr/src/cuke-test

# run mvn install (this will only run when pom.xml is updated)
RUN mvn -T 1C install && rm -rf target

# copy other source files and keep in image
COPY src /usr/src/cuke-test/src
# ---------------------------
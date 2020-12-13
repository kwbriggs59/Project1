From ubuntu:latest

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y wget && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

# Make a directory for the application and get the HelloJava.java file from git.
RUN mkdir /app 
RUN wget https://raw.githubusercontent.com/kwbriggs59/Project1/main/app/HelloJava.java 
RUN mv HelloJava.java /app/

# compile the java application
RUN javac /app/HelloJava.java

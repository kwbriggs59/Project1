From ubuntu:latest

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y wget && \
#    apt-get install -y git && \
    apt-get clean;

# Fix certificate issues
RUN apt-get update && \
    apt-get install ca-certificates-java && \
    apt-get clean && \
    update-ca-certificates -f;

# Setup JAVA_HOME -- useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME

RUN mkdir /app 

# COPY ./app/HelloJava.java /app/
# RUN javac /app/HelloJava.java

# RUN mkdir /myapp
# RUN cd /myapp
RUN wget https://raw.githubusercontent.com/kwbriggs59/Project1/main/app/HelloJava.java 
RUN mv HelloJava.java /app/
RUN javac /app/HelloJava.java

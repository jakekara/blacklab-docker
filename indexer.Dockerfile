FROM tomcat:9.0

WORKDIR /setup

RUN apt-get update && apt-get install -y maven && apt-get install unzip && mvn --version 

RUN git clone git://github.com/INL/BlackLab.git && cd BlackLab && \
    mvn install && java -cp core/target/blacklab-*.jar nl.inl.blacklab.tools.IndexTool --help 
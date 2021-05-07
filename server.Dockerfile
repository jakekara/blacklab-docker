FROM tomcat:9.0

RUN apt-get update && apt-get install -y maven && apt-get install unzip && mvn --version 

RUN echo "Downloading blacklab war file..." && \
    wget --quiet https://github.com/INL/BlackLab/releases/download/v1.7.3/blacklab-server-1.7.3.war && \ 
    mv blacklab-server-*.war "$CATALINA_HOME/webapps" && \
    echo '{"indices": {"cqlindex": {"dir": "/cqlindex/"}}}' > "$CATALINA_HOME/webapps/blacklab-server.json" && \
    mkdir /etc/blacklab && \
    echo '{"indices": {"cqlindex": {"dir": "/cqlindex/"}}}' > "/etc/blacklab/blacklab-server.json" 

EXPOSE 8080

CMD ["catalina.sh", "run"]

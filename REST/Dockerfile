FROM openjdk:11 
RUN mkdir /opt/agent-rest
COPY ucxjcitx.tar.gz /opt/agent-rest

WORKDIR /opt/agent-rest
RUN tar -xzf ucxjcitx.tar.gz

WORKDIR /opt/agent-rest/bin
COPY --chmod=0755 run.sh .

ENTRYPOINT [ "/opt/agent-rest/bin/run.sh" ]
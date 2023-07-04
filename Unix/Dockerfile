FROM redhat/ubi8

RUN mkdir /opt/agent-linux
COPY ucxjlx6.tar.gz /opt/agent-linux

WORKDIR /opt/agent-linux
RUN tar -xzf ucxjlx6.tar.gz

WORKDIR /opt/agent-linux/bin
COPY --chmod=0755 run.sh .

ENTRYPOINT [ "/opt/agent-linux/bin/run.sh" ]
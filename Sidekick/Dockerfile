FROM redhat/ubi8

RUN yum install -y unzip && mkdir /opt/automic

WORKDIR /opt/automic
COPY --chmod=0755 run.sh .

ENTRYPOINT [ "/opt/automic/run.sh" ]
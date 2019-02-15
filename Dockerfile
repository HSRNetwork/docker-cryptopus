FROM puzzle/ose3-rails:ruby22

LABEL maintainer="Philip Schmid <docker@ins.hsr.ch>"

USER root

RUN yum update -y && \
    yum install -y git && \
    yum clean all && \
    rm -rf /var/cache/yum

# Drop privileges
USER 1001

RUN git clone https://github.com/puzzle/cryptopus.git /tmp/src

RUN $STI_SCRIPTS_PATH/assemble

# Announce which ports are exposed
EXPOSE 9191

# Configure the default CMD
CMD $STI_SCRIPTS_PATH/run

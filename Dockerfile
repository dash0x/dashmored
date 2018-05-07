FROM ubuntu:16.04

WORKDIR /app
ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

ADD ./start.sh /start.sh
RUN chmod +x /start.sh

RUN mkdir -p /root/.pivx/
RUN touch  /root/.pivx/pivx.conf

VOLUME ["/root/.pivx/"exit]
EXPOSE 51473 51472

ENTRYPOINT ["/start.sh"]
#CMD ['/bin/bash']
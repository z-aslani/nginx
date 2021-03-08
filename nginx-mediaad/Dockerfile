FROM reg.pegah.tech/general/nginx:1.17

RUN rm -rf /etc/nginx/
COPY nginx-confs/ /etc/nginx/

RUN mkdir /opt/static
COPY static /opt/static

ENV CONFIG_MODE production
COPY mirror.sh /usr/local/bin/
COPY staging.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/mirror.sh
RUN chmod 777 /usr/local/bin/staging.sh

CMD bash /usr/local/bin/mirror.sh && bash /usr/local/bin/staging.sh  && nginx -g 'daemon off;'
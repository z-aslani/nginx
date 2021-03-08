FROM reg.pegah.tech/general/nginx:1.0

RUN rm -rf /etc/nginx/
COPY nginx-confs/ /etc/nginx/
RUN ln -sf /dev/stdout /var/log/nginx/access1.log \
	&& ln -sf /dev/stderr /var/log/nginx/error1.log \
    && unlink /var/log/nginx/error.log \
    && unlink /var/log/nginx/access.log
RUN apk add tzdata
ENV TZ Asia/Tehran
RUN apk add logrotate
COPY nginx /etc/logrotate.d/nginx
COPY cron /var/spool/cron/crontabs/root 

#ENTRYPOINT "/entry.sh"
CMD ["/bin/sh" ,"-c", "crond && nginx -g 'daemon off;'"]

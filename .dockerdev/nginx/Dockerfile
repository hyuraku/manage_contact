FROM nginx:1.19.10-alpine
RUN rm -f /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/conf.d/manageContact.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

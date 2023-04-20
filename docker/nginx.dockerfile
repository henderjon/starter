FROM nginx:alpine
COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx/fastcgi_params /etc/nginx/fastcgi_params
VOLUME ["/etc/nginx/logs"]

# If you add a custom CMD in the Dockerfile, be sure to include -g daemon off;
# in the CMD in order for nginx to stay in the foreground, so that Docker can
# track the process properly (otherwise your container will stop immediately
# after starting)!

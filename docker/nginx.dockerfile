FROM nginx:alpine

VOLUME ["/etc/nginx/logs", "/etc/nginx/ssl-cert", "/srv/www"]

COPY ./conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx/fastcgi_params /etc/nginx/fastcgi_params
COPY ./conf/nginx/ssl-cert /etc/nginx/ssl-cert

# If not using docker-compose copy our application files
# COPY . /srv/www

# If not using docker-compose; this setting can be superseded via CLI arg
# EXPOSE 80

# If you add a custom CMD in the Dockerfile, be sure to include -g daemon off;
# in the CMD in order for nginx to stay in the foreground, so that Docker can
# track the process properly (otherwise your container will stop immediately
# after starting)!

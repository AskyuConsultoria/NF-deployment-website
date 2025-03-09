FROM nginx:latest
COPY Gestio-front-api\ /var/www/html/
COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

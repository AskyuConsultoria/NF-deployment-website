FROM nginx:latest
COPY NFSiteWeb\ /var/www/html/
COPY ./default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]

FROM nginx:latest
COPY ./Gestio-front-api .
COPY gestio-site .
CMD ["sh", "sudo systemctl start nginx"; "sudo systemctl enable nginx"]

RUN sudo cp Gestio-front-api/ -r gestio /var/www/html \
    sudo chown -R www-data:www-data /var/www/html \
    sudo chmod -R 755 /var/www/html \
    sudo cp Gestio-front-api/ -r gestio /var/www/html \
    sudo cp gestio-site /etc/nginx/sites-available/ \
    sudo ln -s /etc/nginx/sites-available/gestio-site /etc/nginx/sites-enabled/gestio-site \
    sudo rm /etc/nginx/sites-enabled/default \
    sudo systemctl restart nginx \

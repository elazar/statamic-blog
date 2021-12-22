FROM alpine:3.14

RUN apk --update add nodejs npm php8 php8-curl php8-dom php8-fileinfo php8-gd php8-exif php8-openssl php8-pcntl php8-phar php8-session php8-sockets php8-tokenizer php8-xml php8-xmlwriter
RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer -O - -q | php8 -- --install-dir=/usr/local/bin --filename=composer
RUN ln -s /usr/bin/php8 /usr/local/bin/php
RUN composer global require statamic/cli

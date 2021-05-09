FROM composer

RUN composer global require statamic/cli
RUN apk --update add nodejs npm php8-gd php8-exif php8-sockets php8-pcntl
RUN echo 'extension=/usr/lib/php8/modules/gd.so' > /usr/local/etc/php/conf.d/00_gd.ini
RUN echo 'extension=/usr/lib/php8/modules/exif.so' > /usr/local/etc/php/conf.d/01_exif.ini
RUN echo 'extension=/usr/lib/php8/modules/sockets.so' > /usr/local/etc/php/conf.d/02_sockets.ini
RUN echo 'extension=/usr/lib/php8/modules/pcntl.so' > /usr/local/etc/php/conf.d/03_pcntl.ini

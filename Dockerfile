FROM composer

RUN composer global require statamic/cli
RUN apk --update add nodejs npm

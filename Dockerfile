FROM alpine:latest

LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.name="docker-drupal-check" \
  org.label-schema.description="Docker drupal-check" \
  maintainer="Said EL FAZNI <elfazni@gmail.com>"

RUN set -e \
  && apk add --no-cache \
  curl \
  php7 \
  php7-json \
  php7-curl \
  php7-iconv \
  php7-mbstring \
  php7-openssl \
  php7-phar \
  php7-tokenizer \
  php7-zlib \
  && curl -sS https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin \
  && composer global require hirak/prestissimo \
  && composer global require nikic/php-parser:^4 \
  && composer global require mglaman/drupal-check \
  && ln -s /root/.composer/vendor/bin/drupal-check /usr/bin/drupal-check \
  && apk del --no-cache git \
  && rm -rf /root/.composer/cache/* \
  && sed -i "s/.*memory_limit = .*/memory_limit = -1/" /etc/php7/php.ini

WORKDIR /data

CMD ["drupal-check", "-ad", "."]

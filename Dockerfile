FROM buildpack-deps:jessie

RUN gpg --keyserver keys.gnupg.net --recv-keys \
    664C383A3566A3481B942F007A322AC6E84AFDD2

RUN set -x; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

RUN echo "deb https://releases.wikimedia.org/debian jessie-mediawiki main" > /etc/apt/sources.list.d/parsoid.list

RUN set -x; \
    apt-get update \
    && apt-get install -y --force-yes --no-install-recommends \
      parsoid \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /etc/mediawiki/parsoid

RUN sed "s|'http://localhost/w|process.env.MW_URL + '|" < settings.js > settings.js

EXPOSE 8142
CMD ["/usr/bin/nodejs", "/usr/lib/parsoid/src/api/server.js"]

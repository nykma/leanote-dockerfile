FROM mongo:4-xenial
MAINTAINER Nyk Ma <i@nyk.ma>

RUN set -ex; \
        apt-get update; \
        apt-get install -y --no-install-recommends wget unzip; \
        rm -rf /var/lib/apt/lists/*; \
        wget "https://github.com/leanote/leanote-all/archive/master.zip"; \
        unzip master.zip; \
        mv ./leanote-all-master/src/github.com/leanote/leanote/mongodb_backup/leanote_install_data leanote_db_bootstrap; \
        rm -rf leanote-all-master master.zip; \
        apt-get purge -y --auto-remove wget unzip

COPY "start.sh" "/root/start-db.sh"

CMD ["/root/start-db.sh"]

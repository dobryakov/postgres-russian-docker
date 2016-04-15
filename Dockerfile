FROM postgres:9.4

RUN apt-get update && \
    apt-get install -y wget zip unzip

RUN mkdir -p /tmp/pg/russian && \
    cd /tmp/pg/russian && \
    wget http://downloads.sourceforge.net/project/aoo-extensions/936/9/dict_ru_ru-0.6.oxt && \
    unzip dict_ru_ru-0.6.oxt && \
    iconv -f koi8-r -t utf-8 < ./ru_RU.aff > /usr/share/postgresql/9.4/tsearch_data/russian.affix && \
    iconv -f koi8-r -t utf-8 < ./ru_RU.dic > /usr/share/postgresql/9.4/tsearch_data/russian.dict && \
    mkdir -p /tmp/pg/english && \
    cd /tmp/pg/english && \
    wget http://downloads.sourceforge.net/project/aoo-extensions/1470/1/en_us.oxt && \
    unzip en_us.oxt && \
    cp en_US.aff /usr/share/postgresql/9.4/tsearch_data/english.affix && \
    cp en_US.dic /usr/share/postgresql/9.4/tsearch_data/english.dict

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

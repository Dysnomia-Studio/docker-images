FROM postgres:15.7-alpine
ENV POSTGRES_INITDB_ARGS "--locale-provider=icu --icu-locale=en_US"
RUN apk add postgresql15-plpython3 py3-psutil icu-data-full

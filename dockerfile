FROM alpine as base

ENV LUCEE_EXTENSIONS="3F9DFF32-B555-449D-B0EB5DB723044045"

ARG LUCEE_VERSION="5.3.9.166"
ARG LUCEE_PASSWORD="password"

RUN apk add openjdk11-jre
ADD https://cdn.lucee.org/lucee-express-${LUCEE_VERSION}.zip lucee.zip

RUN mkdir /lucee && \
     unzip lucee.zip -d /lucee && \
     chmod +x /lucee/*.sh && \
     chmod +x /lucee/bin/*.sh && \
     rm -f lucee.zip && \
     rm -rf /lucee/__MACOSX && \
     mkdir -p /lucee/lucee-server/context/

RUN echo ${LUCEE_PASSWORD} > /lucee/lucee-server/context/password.txt 

COPY ./app /lucee/webapps/ROOT
RUN LUCEE_ENABLE_WARMUP=true /lucee/startup.sh
FROM alpine
RUN apk add openjdk11-jre
COPY --from=base /lucee /lucee
ENTRYPOINT [ "timeout", "3600", "/lucee/startup.sh" ]
FROM lucee/lucee:5.3

ENV TZ="Europe/Zurich"
ENV LUCEE_EXTENSIONS="3F9DFF32-B555-449D-B0EB5DB723044045"

ARG LUCEE_PASSWORD="password"
RUN echo ${LUCEE_PASSWORD} > /opt/lucee/server/lucee-server/context/password.txt 

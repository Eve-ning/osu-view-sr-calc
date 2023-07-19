FROM alpine

WORKDIR /project/
COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["bash", "-c", "/entrypoint.sh"]

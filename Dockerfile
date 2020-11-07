FROM rasa/rasa:latest

COPY app /app
COPY server.sh /app/server.sh

RUN pip install transfomers

USER root
RUN chmod -R 777 /app
USER 1001

RUN rasa train nlu

ENTRYPOINT ["/app/server.sh"]

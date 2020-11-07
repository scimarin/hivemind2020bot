FROM rasa/rasa:latest

COPY app /app
COPY server.sh /app/server.sh

USER root
RUN pip install transformers
RUN chmod -R 777 /app
RUN rasa train nlu
USER 1001

ENTRYPOINT ["/app/server.sh"]

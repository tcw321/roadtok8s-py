FROM python:3.12.4

WORKDIR /app

COPY ./src/ /app

RUN apt-get update && \
    apt-get install -y python3-venv python3-dev python3-pip

RUN python3 -m venv /opt/venv

RUN /opt/venv/bin/python3 -m pip install --upgrade pip

RUN /opt/venv/bin/python3 -m pip install -r requirements.txt

COPY ./conf/entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]


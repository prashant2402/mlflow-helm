# Defining base image
FROM python:3.8-slim-buster

ARG MLFLOW_VERSION=1.13.1
# Installing packages from PyPi
RUN apt-get update \
    && apt-get install -y --no-install-recommends default-libmysqlclient-dev libpq-dev build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install mlflow==$MLFLOW_VERSION \
    psycopg2-binary==2.8.5 \
    mysqlclient==2.0.1

# Defining start up command
EXPOSE 5000

ADD ./start.sh .
ENTRYPOINT ["/bin/bash", "-c", "./start.sh"]
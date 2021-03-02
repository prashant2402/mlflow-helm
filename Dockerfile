# Defining base image
FROM python:3.8-slim-buster
# Installing packages from PyPi
RUN pip3 install mlflow[extras]==1.13.1 \
    psycopg2-binary==2.8.5 \
    boto3==1.15.16 \
    pg8000==1.16.5 \
    gcc7 \
    --no-cache-dir
# Defining start up command
EXPOSE 5000
ENTRYPOINT mlflow server \
  --backend-store-uri "${BACKEND_STORE_URI}" \
  --default-artifact-root "${DEFAULT_ARTIFACT_ROOT}" \
  --host 0.0.0.0
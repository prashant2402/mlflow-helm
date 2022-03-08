# mlflow-helm

### To build the docker image
- `docker build . --tag <repository>:1.14.0 --build-arg MLFLOW_VERSION=1.14.0`
- Remember to update the `appVersion` in [Chart.yaml](mlflow-charts/Chart.yaml)

### To package helm chart
- `helm package mlflow-charts/`
- `helm repo index .`

### To install the helm chart use these examples:
- ```
  helm repo add mlflow 'https://raw.githubusercontent.com/prashant2402/mlflow-helm/master'
  helm repo update
  
  ```
- For mysql:
```
helm install mlflow mlflow-helm/mlflow --set image.repository=<repository> --set backend_store_uri=mysql://root:$MYSQL_PASSWORD@mysql-headless.default.svc.cluster.local:3306/mlflow --set default_artifact_root=./mlruns

```
- For Postgres:
```
helm install mlflow mlflow-helm/mlflow --set image.repository=<repository> --set backend_store_uri=postgresql+psycopg2://postgres:$POSTGRES_PASSWORD@postgres-postgresql-headless.default.svc.cluster.local:5432/mlflow\?options=-csearch_path%3Dmlflow --set default_artifact_root=./mlruns
```
- For Postgres + Minio artifact store:
```
helm install mlflow mlflow-helm/mlflow --set image.repository=<repository> --set backend_store_uri=postgresql+psycopg2://postgres:$POSTGRES_PASSWORD@postgres-postgresql-headless.default.svc.cluster.local:5432/mlflow\?options=-csearch_path%3Dmlflow --set minio.url=http://minio.mlflow.svc.cluster.local:9000 --set minio.accesskey=<access key> --set minio.secretkey=<secret key> --set default_artifact_root=s3://<bucket path>
```

- `kubectl wait --namespace default --for=condition=ready pod --selector=app.kubernetes.io/name=mlflow --timeout=90s`


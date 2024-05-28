#!/bin/bash

kubectl create namespace metrics

# Deploy Prometheus Stack
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install prometheus prometheus-community/kube-prometheus-stack -n metrics -f prom-values.yaml
## Expose the services
## kubectl port-forward -n metrics svc/prometheus-kube-prometheus-prometheus 9090:9090
## kubectl port-forward -n metrics svc/prometheus-grafana 3000:80
## Grafana credentials: {"user":"admin", "password":"prom-operator"}

# Deploy Knative and RabbitMQ monitoring stuff
kubectl apply -f https://raw.githubusercontent.com/knative-extensions/monitoring/main/servicemonitor.yaml
kubectl apply -f https://raw.githubusercontent.com/knative-extensions/monitoring/main/grafana/dashboards.yaml
kubectl apply -f https://raw.githubusercontent.com/rabbitmq/cluster-operator/main/observability/prometheus/monitors/rabbitmq-servicemonitor.yml
kubectl apply -f https://raw.githubusercontent.com/rabbitmq/cluster-operator/main/observability/prometheus/monitors/rabbitmq-cluster-operator-podmonitor.yml
## Manual import of the following dashboards about RabbitMQ
## 10991
## 11340


# Deploy InfluxDB
helm repo add influxdata https://helm.influxdata.com/
helm upgrade -i influxdb influxdata/influxdb2 -n metrics -f inf-values.yaml
## Copy the password that the previous command provides
## InfluxDB credentials: {"user":"admin", "password":"the password copied before"}
## Expose the service
## kubectl port-forward -n metrics svc/influxdb-influxdb2 8086:80
## Create a bucket
## Create a custom API Token following https://docs.influxdata.com/influxdb/cloud/admin/tokens/create-token/ with WRITE to the created bucket and READ from telegraf agent permissions
## Create another API Token with only read access permission to all buckets
## Follow https://grafana.com/docs/grafana/latest/datasources/influxdb/ to create InfluxDB data source on Grafana

export API_TOKEN=""
export BUCKET_NAME=""

# Deploy Telegraf
helm repo add telegraf https://helm.influxdata.com/
helm upgrade -i telegraf influxdata/telegraf -n metrics -f tel-values.yaml
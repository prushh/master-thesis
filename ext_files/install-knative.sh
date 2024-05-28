#!/bin/bash

export KNATIVE_VERSION="v1.13.1"
export KOURIER_VERSION="v1.13.0"
export BROKER_VERSION="v1.13.0"

echo "Setting up Serving"
kubectl apply -f https://github.com/knative/serving/releases/download/knative-${KNATIVE_VERSION}/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-${KNATIVE_VERSION}/serving-core.yaml
kubectl patch -n knative-serving configmap/config-autoscaler --type merge --patch '{"data":{"scale-to-zero-grace-period":"10s", "allow-zero-initial-scale":"true"}}'

echo "Setting up Kourier"
kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-${KOURIER_VERSION}/kourier.yaml
kubectl patch configmap/config-network -n knative-serving --type merge --patch '{"data":{"ingress-class":"kourier.ingress.networking.knative.dev"}}'

echo "Setting up DNS"
kubectl apply -f https://github.com/knative/serving/releases/download/knative-${KNATIVE_VERSION}/serving-default-domain.yaml

echo "Setting up Eventing"
kubectl apply -f https://github.com/knative/eventing/releases/download/knative-${KNATIVE_VERSION}/eventing-crds.yaml
kubectl apply -f https://github.com/knative/eventing/releases/download/knative-${KNATIVE_VERSION}/eventing-core.yaml

echo "Setting up RabbitMQ"
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.5.4/cert-manager.yaml
echo "Wait for cert-manager"
sleep 120
kubectl apply -f https://github.com/rabbitmq/messaging-topology-operator/releases/latest/download/messaging-topology-operator-with-certmanager.yaml
kubectl apply -f https://github.com/rabbitmq/cluster-operator/releases/latest/download/cluster-operator.yml
kubectl apply -f https://github.com/knative-extensions/eventing-rabbitmq/releases/download/knative-${BROKER_VERSION}/rabbitmq-broker.yaml

echo "All done!"
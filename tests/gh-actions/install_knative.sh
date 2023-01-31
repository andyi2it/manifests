#!/bin/bash
set -euo pipefail
echo "Installing KNative ..."
set +e
kustomize build common/knative/knative-serving/base | kubectl apply -f -
set -e
kustomize build common/knative/knative-serving/overlays/base | kubectl apply -f -
kustomize build common/istio-1-16/cluster-local-gateway/base | kubectl apply -f -
kustomize build common/istio-1-16/kubeflow-istio-resources/base | kubectl apply -f -
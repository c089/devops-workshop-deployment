#!/bin/sh
set -eu
cd "$(dirname "$0")"
IMAGE=$1
yq -i \
  --output-format yaml \
  "(.spec.template.spec.containers[]|select(.name==\"hello\")).image |= \"${IMAGE}\"" \
   "deployment.yaml"
git add deployment.yaml
git \
  -c user.name="Automated Deployment Script" \
  -c user.email="noreply@k3d.local.profitbricks.net" \
  commit -m "Deploy example service ${IMAGE}"
git pull --rebase --autostash
git push

#!/bin/bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# Intall Taiga

# Taiga installed via Helm chart out out of this repo
helm install taiga ./taiga --namespace taiga --create-namespace -f example-values.yaml

# Taiga installed via Helm chart
# helm repo add nemonik https://nemonik.github.io/helm-charts/
# helm repo update
# helm install taiga nemonik/taiga --namespace taiga --create-namespace -f example-value.yaml 


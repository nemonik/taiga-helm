[![GitHub license](https://img.shields.io/github/license/nemonik/taiga-helm)](./LICENSE)
[![GitHub Forks](https://img.shields.io/github/forks/nemonik/taiga-helm?style=social)](https://github.com/nemonik/ameersbn-gitlab-helm/network/members)
[![Github Stars](https://img.shields.io/github/stars/nemonik/taiga-helm?style=social)](https://github.com/nemonik/ameersbn-gitlab-helm/stargazers)
<a href="https://www.buymeacoffee.com/nemonik" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="20" width="85"></a>

# taiga-helm

A helm chart for Taiga based off of the taiga-docker project found at [https://github.com/kaleidos-ventures/taiga-docker/](https://github.com/kaleidos-ventures/taiga-docker/).

## Requirements

Written for Helm 3.

## Helm chart values

See <https://github.com/kaleidos-ventures/taiga-docker/#configuration> for documentation for the values used by the chart.

## Example use

You can clone this repo, enter the repository folder and then execute something like the [start_taiga.sh](start_taiga.sh):

```
./start_taiga.sh
```

The script will spin up Taiga using the example [example_values.yaml](example_values.yaml) values file. You will need
to provide your own if you want to configure other settings, and ingress, etc. Look at the [values.yaml](values.yaml)
file for what to place in your own.

## To install via my chart repository

```
helm repo add nemonik https://nemonik.github.io/helm-charts/
helm repo update
helm search repo taiga
wget https://raw.githubusercontent.com/nemonik/taiga-helm/master/example-values.yaml
helm install taiga nemonik/taiga --namespace taiga --create-namespace -f example-values.yaml
watch -n 15 kubectl get pods -n taiga
```

Give it time for Taiga to come fully up. It has to "migrate" data...

## Create a super user in Taiga

Once, all the pods are ready you will need to create a super user to access Taiga. To do this you
will need to run taigaio/taiga-back:latest container in the same namespace executing the command
`python manage.py createsuperuse` with a number of other environmental variables set. The
[createsuperuser.sh](createsuperuser.sh) script at the root of the project provides an example
for how to do this.

## Accessing Taiga

If you've spun up Taiga using the [start_taiga.sh](start_taiga.sh) script, you can access it in your
browser via exposing via `kubectl port-forward` like so

```
kubectl port-forward -n taiga service/taiga-gateway 9000:80
```

then open in your browser [http://localhost:9000](http://localhost:9000)

Or configure an ingress via your values file by adding an `ingress` configuration under
`taigaGateway` in your values file likes so:

```
taigaGateway:
  ingress:
    enabled: true
    annotations:
      traefik.ingress.kubernetes.io/router.entrypoints: web
    hosts:
      - host: taiga.example.com
        paths:
          -  "/"
    tls: []
```

This example uses Traefik to expose the ingress. Configuring Traefik is out of scope of this
readme.

In the [gen 2 version of my Hands-on DevOps class](https://github.com/nemonik/hands-on-DevOps-gen2/tree/master/taiga) I do this to expose Taiga over https.

Peruse this for insight.

## License

3-Clause BSD License

## Author Information

Michael Joseph Walsh <mjwalsh@nemonik.com>

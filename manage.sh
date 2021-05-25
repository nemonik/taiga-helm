#!/bin/bash

# Copyright (C) 2020 Michael Joseph Walsh - All Rights Reserved
# You may use, distribute and modify this code under the
# terms of the the license.
#
# You should have received a copy of the license with
# this file. If not, please email <mjwalsh@nemonik.com>

# opens a management shell to taiga to run for example 	`python manage.py`.

kubectl run -i --tty --rm manage --image=taigaio/taiga-back:latest -n taiga --env "TAIGA_SECRET_KEY=taiga-back-secret-key" --env "POSTGRES_DB=taiga" --env "POSTGRES_USER=taiga" --env "POSTGRES_PASSWORD=taiga" --env "POSTGRES_HOST=taiga-db" --env "TAIGA_SITES_DOMAIN=localhost" --env "TAIGA_SITES_SCHEME=http" --restart=Never --command -- /bin/bash

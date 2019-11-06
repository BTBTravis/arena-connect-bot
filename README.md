# ArenaConnectBot

A chatbot that posts things you send it to [Are.na](https://are.na). Currently only supports message client telegram.

## Why

At time of writing Are.na does not have an android app and I want an easier way to share content
from my phone to Are.na. It is possible to email links to the special Are.na incoming email but I
found this process slowed me down and I'm faster at sending / sharing content via chat. Also I used
this an an opptuninity to contiune to explore Elixir + Phonix Framework. This time around with more
of a focus on testing, splitting out business logic from web logic, and clear interfaces between
everything.

## Dev

### Local setup

To run on local as in on your mac:

1. Install dependencies with `mix deps.get`
1. Start local phoenix server with `mix phx.server`
1. The api will then be ready to curl at `localhost:4000`
    * at this point it will run with placeholder api keys unless you add your keys to
      `./config/prod.secret.exs` and run with `MIX_ENV=prod mix phx.server`
1. Don't forget to test with `mix test`

To run locally via docker:

1. `docker run -it --rm  -p 4000:4000  registry.gitlab.com/btbtravis/arena-connect-bot:0.0.1`
    * this is bit of a pain and is currently used to test container before deploying to
      produciton


### Deploying to production

1. deploy the service to k8s `kubectl apply svc -f ./k8s/service.yml`
1. deploy the deployment to k8s `kubectl apply deployment -f ./k8s/deployment.yml`

### Helpful commands

Log production continer:

> `kubectl logs $(kubectl get pods --namespace arena-connect --insecure-skip-tls-verify | tail -1 | cut -d ' ' -f1)  --namespace arena-connect --insecure-skip-tls-verify -f`

## Helpful links

* https://dev.are.na/documentation
* https://core.telegram.org/bots


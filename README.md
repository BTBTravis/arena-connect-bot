# ArenaConnectBot

A chatbot backend that posts things you send it to [Are.na](https://are.na).

## Dev

### Local setup

1. Install dependencies with `mix deps.get`
1. Start local phoenix server with `mix phx.server`

The api will then be ready to curl at `localhost:4000`

### Deploying to production

1. deploy the service to k8s `kubectl apply svc -f ./k8s/service.yml`
1. deploy the deployment to k8s `kubectl apply deployment -f ./k8s/deployment.yml`


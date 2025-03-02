# Icinga2 Helm Playground

## Requirements

- `helm`
- `minikube`
- GNU `make`

## How to start

Run `minikube` and apply manifests.

```sh
make up
```

Obtain Icinga web pod name.

```sh
kubectl get pods
```

```
NAME                                               READY   STATUS    RESTARTS        AGE
icinga2-stack-0                                    1/1     Running   0               3m42s
icinga2-stack-icinga-kubernetes-6964ff8db6-dqvkr   1/1     Running   0               3m42s
icinga2-stack-icinga-stack-director-database-0     1/1     Running   0               3m42s
icinga2-stack-icinga-stack-icingadb-database-0     1/1     Running   0               3m42s
icinga2-stack-icinga-stack-icingaweb2-database-0   1/1     Running   0               3m42s
icinga2-stack-icinga-stack-kubernetes-database-0   1/1     Running   0               3m42s
icinga2-stack-icinga-stack-redis-0                 1/1     Running   0               3m42s
icinga2-stack-icingadb-77b8b74b49-9qbj4            1/1     Running   0               3m42s
icinga2-stack-icingaweb2-5cd85b8cbf-bmfhj          1/2     Error     0               3m42s
simple-http-server-856b867645-mct7v                1/1     Running   0               3m42s
simple-http-server-error-6f67c5c5f5-fjst7          0/1     Running   1 (2m20s ago)   3m42s
```

Forward ports.

```sh
kubectl port-forward icinga2-stack-icingaweb2-5cd85b8cbf-bmfhj 8080:8080
```

Credentials: `icingaadmin` / `password`.

## Notes

There are two example deployments: `simple-http-server` and `simple-http-server-error` to demonstrate healthy and failing pods.
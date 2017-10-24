# rabbitmq-k8s-cluster

NOTE: StatefulSet is available only since k8s 1.5

A RabbitMQ cluster for Kubernetes based on StatefulSet

To run the cluster, first build an image and push it to a registry:

```
docker build -t your_registry.your_domain:5000/rabbitmq .
docker push your_registry.your_domain:5000/rabbitmq
```

After that you can start the stateful set:

```
kubectl create -f rabbitmq-cluster.yaml
```
RabbitMQ Management console is available on rabbitmq-management service PORT. 
Username and password for management console are "admin"

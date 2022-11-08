Deploy with Kubernetes
Works with any Kubernetes; if you don't have one, we recommend you install MicroK8s and microk8s.enable dns storage then snap alias microk8s.kubectl kubectl.

Download prometheus.yml, alerts.yml and prometheus-deployment.yml and set containers.prometheus.image in prometheus-deployment.yml to your chosen channel tag (e.g. ubuntu/prometheus:2.33-22.04_beta), then:

````
kubectl create configmap prometheus-config --from-file=prometheus=prometheus.yml --from-file=prometheus-alerts=alerts.yml
kubectl apply -f prometheus-deployment.yml
````

You will now be able to connect to the Prometheus on http://localhost:30090.
#!/bin/bash    
    
# Git pull    
echo -ne "Updating local yamls..."     
git pull -v    
echo "done"     
    
# Deletes old configmap    
echo -ne "Removing old configmap... "     
kubectl delete configmap -n monitoring prometheus-config    
echo "done"     
    
echo -ne "Creating new configmap..."       
# Creates configmap    
kubectl create configmap prometheus-config --from-file=prometheus=prometheus.yml --from-file=prometheus-alerts=alerts.yml -n monitoring    
echo "done" 

echo -ne "Redeployng... "
kubectl apply -f prometheus-deployment.yml -n monitoring
echo "done"
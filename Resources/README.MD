## EKS Cluster Commands

- ***Checking namespace*** <br> 
kubectl get ns (or) kubectl get namespaces

- ***Create namespace through command*** <br> 
kubectl create namespace roboshop (or) kubectl create ns roboshop

- ***Check api resources*** <br> 
kubectl api-resources

- ***creating NameSpace*** <br> 
kubectl apply -f 01-namespace.yaml

- ***delete Namespace *** <br> 
kubectl delete -f 01-namespace.yaml

- ***creating nginx pod*** <br> 
kubectl apply -f 02-pod.yaml









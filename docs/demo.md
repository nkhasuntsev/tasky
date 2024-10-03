# Demo during presentation and needed commands

# ArgoCD Password
`kubectl -n argocd get secret argocd-initial-admin-secret \
      -o jsonpath="{.data.password}" | base64 -d; echo`

Current Password: 0eAY9yX8PGn-n0eD


## Application has Cluster Admin Priviliges 

### Show which service account the pods use

`kubectl describe pod my-tasky-app-78585bddbf-x6rvx -n tasky-namespace | grep "Service Account"`

### Make sure that the pod exists! Otherwise do first: 

`kubectl get pods -n tasky-namespace`

### Kubectl command to display cluster wide role of SA 

`kubectl get clusterrolebinding -o json | jq '.items[] | select(.subjects[]?.kind=="ServiceAccount" and .subjects[]?.name=="tasky-app-sa")'`

### Kubectl command to display permissions of the role

`kubectl get clusterrole cluster-admin -o yaml`
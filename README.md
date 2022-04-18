## Purpose
This is a repository that is used as an argo-cd ApplicationSet target with
the kubernetes manifest defined in `_init/argo-install-application-set.yml`.
The applications included in here are some of the "usual" things used to 
bootstrap a cluster.

## Notes
The directories have the structure `<namespace>/<app-name>` where the namespace
is automatically created as defined in the ApplicationSet manifest.

## Included

### Argo CD
For the configuration files.
Includes setting argocd's dex with github oauth.

### Argo rollouts
Additional capability for application deployment.

### Cert Manager
Mainly for automatic ingress tls certificate provisioning.

### Dex
To be used for kubectl authentication integrated with github.

### ECR login
Automatic generation and replication of ECR registry login 
since they have a 12 hr expiration.

### Ingress Nginx
Ingress Controller.

### Metallb
Load balancer for non-cloud managed cluster.

### Sentry
A collection of applications used to monitor the cluster gathered in
a single namespace.

## Excluded

### Linkerd
I am currently using linkerd as a service mesh but is not included because
`linkerd-cni` has to be set up before `linkerd`. Another is using the linkerd cli will
install `linkerd` without additional requirements compared to using the helm chart.
Regarding upgrades, it might be safer to just bootstrap a new cluster then shifting
traffic.

### Bitnami's Sealed Secrets 
There are some steps that needs to be done which is re-installing the master key which
IMO is easier done outside argo

### Metrics Server
I am assuming the kubernetes cluster has built-in metrics-server upon creation, e.g. via plugin
or as part of the installation.
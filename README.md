This is a repository that is used as an argo-cd ApplicationSet target with
the kubernetes manifest defined in `_init/argo-install-application-set.yml`.
The applications included in here are some of the "usual" things used to 
bootstrap a cluster.

The directories have the structure `<namespace>/<app-name>` where the namespace
is automatically created as defined in the ApplicationSet manifest.

I am currently using linkerd as a service mesh but is not included because
`linkerd-cni` has to be set up before `linkerd`. Another is using the linkerd cli will
install `linkerd` without additional requirements compared to using the helm chart.
Regarding upgrades, it might be safer to just bootstrap a new cluster then shifting
traffic.

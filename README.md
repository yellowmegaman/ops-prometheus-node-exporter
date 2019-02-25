# ops-prometheus-node-exporter

Allows you to deploy prometheus-node-exporter via Nomad

Expects "DC" env variable.

Example:

```
levant deploy -address=http://your-nomad-installation-or-cluster:4646 -var-file=vars.yaml ops-prometheus-node-exporter.nomad
```

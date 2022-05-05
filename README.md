#  RedHat Service Binding Operator - Gitops terraform module
![Verify and release module](https://github.com/cloud-native-toolkit/terraform-gitops-service-binding-operator/workflows/Verify%20and%20release%20module/badge.svg)

Deploys the latest stable version of the RedHat OpenShift Service Binding Operator via helm chart.  By default, the SBO will be installed into `openshift-operators` namespace.  If this needs to be installed where a namespace does not yet exist, you can utilize the `Namespace` module or if the namespace exists, then spcify the namespace in the module declaration.

## Supported platforms

- OCP 4.8+

## Suggested companion modules

The module itself requires some information from the cluster and needs a
namespace to be created. The following companion
modules can help provide the required information:

- Gitops:  github.com/cloud-native-toolkit/terraform-tools-gitops
- Gitops Bootstrap: github.com/cloud-native-toolkit/terraform-util-gitops-bootstrap
- Cluster: github.com/cloud-native-toolkit/terraform-ocp-login
- Namespace - github.com/cloud-native-toolkit/terraform-cluster-namespace

## Example usage

```hcl-terraform
module "sbo" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-service-binding-operator"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  kubeseal_cert = module.gitops.sealed_secrets_cert

}
```
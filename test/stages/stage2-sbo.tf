module "sbo_module" {
  source = "./module"

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  kubeseal_cert = module.gitops.sealed_secrets_cert
  namespace = "openshift-operators"
  
}

resource null_resource write_namespace {
  provisioner "local-exec" {
    command = "echo -n '${module.sbo_module.namespace}' > .namespace"
  }
}

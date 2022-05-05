
resource null_resource write_outputs {
  provisioner "local-exec" {
    command = "echo \"$${OUTPUT}\" > gitops-output.json"

    environment = {
      OUTPUT = jsonencode({
        name        = module.sbo_module.name
        branch      = module.sbo_module.branch
        namespace   = module.sbo_module.namespace
        server_name = module.sbo_module.server_name
        layer       = module.sbo_module.layer
        layer_dir   = module.sbo_module.layer == "infrastructure" ? "1-infrastructure" : (module.sbo_module.layer == "services" ? "2-services" : "3-applications")
        type        = module.sbo_module.type
      })
    }
  }
}

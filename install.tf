resource "template_file" "install" {
  template = file("${path.module}/templates/install.sh.tpl")
  vars {
    agent_version        = var.agent_version
    hashicorp_public_key = file("${path.module}/files/hashicorp_public.key")
    agent_config = templatefile("{path.module}/templates/supervisor.tpl",
      {
        tfc_agent_token = tfe_agent_token.tfc-agent-token.token
        tfc_agent_name  = var.agent_name
      }
    )
  }
}

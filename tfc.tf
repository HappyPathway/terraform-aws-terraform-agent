resource "tfe_agent_pool" "tfc-agent-pool" {
  name         = var.tfc_agent_pool
  organization = var.tfc_org_name
}

resource "tfe_agent_token" "tfc-agent-token" {
  agent_pool_id = tfe_agent_pool.tfc-agent-pool.id
  description   = var.tfc_agent_token
}
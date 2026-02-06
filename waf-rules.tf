resource "cloudflare_ruleset" "zone_level_managed_waf" {
  zone_id     = data.cloudflare_zone.zone.id
  name        = "domain WAF ruleset"
  description = "Cloudflare Default Managed WAF Rules"
  phase       = "http_request_firewall_managed"
  kind        = "zone"

  # Execute Cloudflare Managed Ruleset
  rules {
    ref         = "execute_managed_ruleset"
    description = "Execute Cloudflare Managed Ruleset on my zone-level phase entry point ruleset"
    expression  = "true"
    action      = "execute"
    action_parameters {
      id = "efb7b8c949ac4650a09736fc376e9aee"
    }
  }

  # Execute Cloudflare OWASP Core Ruleset
  rules {
    ref         = "execute_cloudflare_owasp_core_ruleset"
    description = "Execute Cloudflare OWASP Core Ruleset on my zone-level phase entry point ruleset"
    expression  = "true"
    action      = "execute"
    action_parameters {
      id = "4814384a9e5d4991b9815dcfc25d2f1f"
    }
  }

  # Enable Exposed Credential Check
  rules {
    ref         = "enable_exposed_credential_check"
    description = "Enable exposed credential check on my zone-level phase entry point ruleset"
    expression  = "true"
    action      = "execute"
    action_parameters {
      id = "c2e184081120413c86c3ab7e14069605"
    }
  }

}
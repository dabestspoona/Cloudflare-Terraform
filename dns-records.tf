resource "cloudflare_record" "record_name" {
  zone_id = data.cloudflare_zone.zone.id
  name    = "*.{}"
  value   = "$.$.com"
  type    = "CNAME"
  proxied = true
}

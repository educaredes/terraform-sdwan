locals {
  vnf_access_instances = {
    for site, cfg in var.sdedge_sites : site => merge(cfg, {
      cpe_service_name = "vnf-cpe-${site}-service"
    })
  }

  vnf_cpe_instances = {
    for site, cfg in var.sdedge_sites : site => merge(cfg, {
      access_service_name = "vnf-access-${site}-service"
    })
  }
  vnf_wan_instances = {
    for site, cfg in var.sdedge_sites : site => merge(cfg, {
      access_ip = cfg.vnftunip
      cpe_service_name  = "vnf-cpe-${site}-service"
    })
  }
}
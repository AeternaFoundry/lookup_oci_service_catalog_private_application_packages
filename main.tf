data "oci_service_catalog_private_application_packages" "service_catalog_private_application_packages_lookup" {
  for_each = var.service_catalog_private_application_packages_lookup

  private_application_id         = each.value.private_application_id
  display_name                   = each.value.display_name
  package_type                   = each.value.package_type
  private_application_package_id = each.value.private_application_package_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}


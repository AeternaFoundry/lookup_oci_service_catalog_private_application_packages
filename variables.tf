variable "service_catalog_private_application_packages_lookup" {
  description = <<EOT
Map of service_catalog_private_application_packages_lookup, attributes below
Required:
    - private_application_id
Optional:
    - display_name
    - package_type
    - private_application_package_id
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    private_application_id         = string
    display_name                   = optional(string)
    package_type                   = optional(list(string))
    private_application_package_id = optional(string)
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
}


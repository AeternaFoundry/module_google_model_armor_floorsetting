variable "model_armor_floorsettings" {
  description = <<EOT
Map of model_armor_floorsettings, attributes below
Required:
    - location
    - parent
    - filter_config (block):
        - malicious_uri_filter_settings (optional, block):
            - filter_enforcement (optional)
        - pi_and_jailbreak_filter_settings (optional, block):
            - confidence_level (optional)
            - filter_enforcement (optional)
        - rai_settings (optional, block):
            - rai_filters (required, block):
                - confidence_level (optional)
                - filter_type (required)
        - sdp_settings (optional, block):
            - advanced_config (optional, block):
                - deidentify_template (optional)
                - inspect_template (optional)
            - basic_config (optional, block):
                - filter_enforcement (optional)
Optional:
    - enable_floor_setting_enforcement
    - integrated_services
    - ai_platform_floor_setting (block):
        - enable_cloud_logging (optional)
        - inspect_and_block (optional)
        - inspect_only (optional)
    - floor_setting_metadata (block):
        - multi_language_detection (optional, block):
            - enable_multi_language_detection (required)
    - google_mcp_server_floor_setting (block):
        - enable_cloud_logging (optional)
        - inspect_and_block (optional)
        - inspect_only (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location                         = string
    parent                           = string
    enable_floor_setting_enforcement = optional(bool)
    integrated_services              = optional(list(string))
    filter_config = object({
      malicious_uri_filter_settings = optional(object({
        filter_enforcement = optional(string)
      }))
      pi_and_jailbreak_filter_settings = optional(object({
        confidence_level   = optional(string)
        filter_enforcement = optional(string)
      }))
      rai_settings = optional(object({
        rai_filters = list(object({
          confidence_level = optional(string)
          filter_type      = string
        }))
      }))
      sdp_settings = optional(object({
        advanced_config = optional(object({
          deidentify_template = optional(string)
          inspect_template    = optional(string)
        }))
        basic_config = optional(object({
          filter_enforcement = optional(string)
        }))
      }))
    })
    ai_platform_floor_setting = optional(object({
      enable_cloud_logging = optional(bool)
      inspect_and_block    = optional(bool)
      inspect_only         = optional(bool)
    }))
    floor_setting_metadata = optional(object({
      multi_language_detection = optional(object({
        enable_multi_language_detection = bool
      }))
    }))
    google_mcp_server_floor_setting = optional(object({
      enable_cloud_logging = optional(bool)
      inspect_and_block    = optional(bool)
      inspect_only         = optional(bool)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.model_armor_floorsettings : (
        v.filter_config.rai_settings == null || (length(v.filter_config.rai_settings.rai_filters) >= 1)
      )
    ])
    error_message = "Each rai_filters list must contain at least 1 items"
  }
}


resource "google_model_armor_floorsetting" "model_armor_floorsettings" {
  for_each = var.model_armor_floorsettings

  location                         = each.value.location
  parent                           = each.value.parent
  enable_floor_setting_enforcement = each.value.enable_floor_setting_enforcement
  integrated_services              = each.value.integrated_services

  filter_config {
    dynamic "malicious_uri_filter_settings" {
      for_each = each.value.filter_config.malicious_uri_filter_settings != null ? [each.value.filter_config.malicious_uri_filter_settings] : []
      content {
        filter_enforcement = malicious_uri_filter_settings.value.filter_enforcement
      }
    }
    dynamic "pi_and_jailbreak_filter_settings" {
      for_each = each.value.filter_config.pi_and_jailbreak_filter_settings != null ? [each.value.filter_config.pi_and_jailbreak_filter_settings] : []
      content {
        confidence_level   = pi_and_jailbreak_filter_settings.value.confidence_level
        filter_enforcement = pi_and_jailbreak_filter_settings.value.filter_enforcement
      }
    }
    dynamic "rai_settings" {
      for_each = each.value.filter_config.rai_settings != null ? [each.value.filter_config.rai_settings] : []
      content {
        dynamic "rai_filters" {
          for_each = rai_settings.value.rai_filters
          content {
            confidence_level = rai_filters.value.confidence_level
            filter_type      = rai_filters.value.filter_type
          }
        }
      }
    }
    dynamic "sdp_settings" {
      for_each = each.value.filter_config.sdp_settings != null ? [each.value.filter_config.sdp_settings] : []
      content {
        dynamic "advanced_config" {
          for_each = sdp_settings.value.advanced_config != null ? [sdp_settings.value.advanced_config] : []
          content {
            deidentify_template = advanced_config.value.deidentify_template
            inspect_template    = advanced_config.value.inspect_template
          }
        }
        dynamic "basic_config" {
          for_each = sdp_settings.value.basic_config != null ? [sdp_settings.value.basic_config] : []
          content {
            filter_enforcement = basic_config.value.filter_enforcement
          }
        }
      }
    }
  }

  dynamic "ai_platform_floor_setting" {
    for_each = each.value.ai_platform_floor_setting != null ? [each.value.ai_platform_floor_setting] : []
    content {
      enable_cloud_logging = ai_platform_floor_setting.value.enable_cloud_logging
      inspect_and_block    = ai_platform_floor_setting.value.inspect_and_block
      inspect_only         = ai_platform_floor_setting.value.inspect_only
    }
  }

  dynamic "floor_setting_metadata" {
    for_each = each.value.floor_setting_metadata != null ? [each.value.floor_setting_metadata] : []
    content {
      dynamic "multi_language_detection" {
        for_each = floor_setting_metadata.value.multi_language_detection != null ? [floor_setting_metadata.value.multi_language_detection] : []
        content {
          enable_multi_language_detection = multi_language_detection.value.enable_multi_language_detection
        }
      }
    }
  }

  dynamic "google_mcp_server_floor_setting" {
    for_each = each.value.google_mcp_server_floor_setting != null ? [each.value.google_mcp_server_floor_setting] : []
    content {
      enable_cloud_logging = google_mcp_server_floor_setting.value.enable_cloud_logging
      inspect_and_block    = google_mcp_server_floor_setting.value.inspect_and_block
      inspect_only         = google_mcp_server_floor_setting.value.inspect_only
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}


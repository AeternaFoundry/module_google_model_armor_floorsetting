output "model_armor_floorsettings_id" {
  description = "Map of id values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no id are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.id if v.id != null && length(v.id) > 0 }
}
output "model_armor_floorsettings_ai_platform_floor_setting" {
  description = "Map of ai_platform_floor_setting values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no ai_platform_floor_setting are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => one(v.ai_platform_floor_setting) if v.ai_platform_floor_setting != null && length(v.ai_platform_floor_setting) > 0 }
}
output "model_armor_floorsettings_create_time" {
  description = "Map of create_time values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no create_time are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "model_armor_floorsettings_enable_floor_setting_enforcement" {
  description = "Map of enable_floor_setting_enforcement values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no enable_floor_setting_enforcement are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.enable_floor_setting_enforcement if v.enable_floor_setting_enforcement != null }
}
output "model_armor_floorsettings_filter_config" {
  description = "Map of filter_config values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no filter_config are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => one(v.filter_config) if v.filter_config != null && length(v.filter_config) > 0 }
}
output "model_armor_floorsettings_floor_setting_metadata" {
  description = "Map of floor_setting_metadata values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no floor_setting_metadata are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => one(v.floor_setting_metadata) if v.floor_setting_metadata != null && length(v.floor_setting_metadata) > 0 }
}
output "model_armor_floorsettings_google_mcp_server_floor_setting" {
  description = "Map of google_mcp_server_floor_setting values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no google_mcp_server_floor_setting are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => one(v.google_mcp_server_floor_setting) if v.google_mcp_server_floor_setting != null && length(v.google_mcp_server_floor_setting) > 0 }
}
output "model_armor_floorsettings_integrated_services" {
  description = "Map of integrated_services values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no integrated_services are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.integrated_services if v.integrated_services != null && length(v.integrated_services) > 0 }
}
output "model_armor_floorsettings_location" {
  description = "Map of location values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no location are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.location if v.location != null && length(v.location) > 0 }
}
output "model_armor_floorsettings_name" {
  description = "Map of name values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no name are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.name if v.name != null && length(v.name) > 0 }
}
output "model_armor_floorsettings_parent" {
  description = "Map of parent values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no parent are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "model_armor_floorsettings_update_time" {
  description = "Map of update_time values across all model_armor_floorsettings, keyed the same as var.model_armor_floorsettings except keys with no update_time are omitted"
  value       = { for k, v in google_model_armor_floorsetting.model_armor_floorsettings : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}


resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file 'HANDLING_FILE' 'xr3/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'xr3/vehicles.meta'
data_file 'CARCOLS_FILE' 'xr3/carcols.meta'
data_file 'CONTENTUNLOCKS_FILE' 'xr3/contentunlocks.meta'
data_file 'VEHICLE_VARIATION_FILE' 'xr3/carvariations.meta'


files {
  'xr3/handling.meta',
  'xr3/vehicles.meta',
  'xr3/contentunlocks.meta',
  'xr3/carcols.meta',
  'xr3/carvariations.meta',
  
  
}

client_script 'vehicle_names.lua'

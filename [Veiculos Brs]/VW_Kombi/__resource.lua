resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

data_file 'HANDLING_FILE' 'kombi/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'kombi/vehicles.meta'
data_file 'CARCOLS_FILE' 'kombi/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'kombi/carvariations.meta'


files {
  'kombi/handling.meta',
  'kombi/vehicles.meta',
  'kombi/carcols.meta',
  'kombi/carvariations.meta',
  
  
}

client_script 'vehicle_names.lua'

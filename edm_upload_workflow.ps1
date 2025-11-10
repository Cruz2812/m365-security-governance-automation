# EDM upload workflow using EdmUploadAgent.exe

$schemaName = "<edm_schema_name>"
$schemaOutputDir = "<schema_output_dir>"
$validationDataPath = "<validation_data_path>"
$hashLocation = "<hash_location>"
$agentPath = "<path_to_agent_exe>\EdmUploadAgent.exe"

# Save schema
& $agentPath /SaveSchema /DataStoreName $schemaName /OutputDir $schemaOutputDir

# Validate data
& $agentPath /ValidateData /DataFile $validationDataPath /Schema (Join-Path $schemaOutputDir "$schemaName.xml") /ColumnSeparator ","

# Authorize (needs to be run every ~30 days)
& $agentPath /Authorize

# Upload data
& $agentPath /UploadData /DataStoreName $schemaName /DataFile $validationDataPath /HashLocation $hashLocation /Schema (Join-Path $schemaOutputDir "$schemaName.xml") /ColumnSeparator "," /AllowedBadLinesPercentage 5

# Check status
& $agentPath /GetSession /DataStoreName $schemaName

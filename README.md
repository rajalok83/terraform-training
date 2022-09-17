## File will be loaded in alphabetical order in most of scenarios

## To download providers from web
``` terraform init ```

## Validates the syntax of tf file
``` terraform validate ```

## Runs in simulation 
``` terraform plan ```

## Runs and apply the plan
``` terraform apply ```

## Import existing resource
``` terraform import resource_type.resource_name resource_id ```

## Generate HCL (Terraform configuration) from tfstate
``` terraform show ```

## Tainting existing resource
``` terraform taint resource_type.resource_name ```

## Basics -> [001-aws_instance](./001-aws_instance/) & [002-docker](./002-docker/)

## Variables and output -> [004-variables](./004-variables/)

- Types - string, boolean, array, map
- Using variables - var.<var_name>
- Map needs to be replaced fully

## Overrides -> [003-aws_instance_overrides](./003-aws_instance_overrides/)
- File must end with override.tf
- Override files applied in the alphabetical order and hence sorted last will take precedence, if values are present in multiple override files

## Provisioner
- Order of execution will depend on how it is specified
- Types:
  - local-exec -> [005-provisioners_local](./005-provisioners_local/)
  - file  -> [006-keypair](./006-keypair/) & [007-provisioners_file](./007-provisioners_file/)
  - remote-exec -> [008-provisioners_remote](./008-provisioners_remote/)

## Count -> [009-multiple_resources_at_once](./009-multiple_resources_at_once/)
- count.index
- Print using resource_type.resource_name.[*].attribute

## For Each -> [010-multiple_resources_for_each](./010-multiple-resources-for-each/)
- each.value

## If-Else -> [011-if_else](./011-if_else/)
- Values based on values of one variable or another

## Template -> [012-template](./012-template/)
- Use Data file similar to variable value
- One file can be used for only one value
- For multiple values multiple files need to be declared and used in the config

## Modules -> [modules](./modules/) & [013-modules](./013-modules/)
- Create repeatable IaC modules to be able to easly and quickly deploy same resource

1. create module
2. import module
3. set variables of module
4. Use Output of module

## Backend -> [014-backend](./014-backend/)
- Store the terraform.tfstate as different file at a differnet location could be different directory on same machine, nfs, nas, S3, Azure or other compatible backend

## Importing existing resources -> [015-import_show](./015-import_show/)
1. Create a config .tf file with provider and empty block of resource_type with resource_name
2. ``` terraform init ```
3. ``` terraform import resource_type.resource_name resource_id # This generates terraform.tfstate file ```
4. ``` terraform show  # This generates the configuration for your resource ```
5. ``` terraform apply # Will show the non-configurable values that need to be removed from generated code ```

## Fetching data from api -> [016-api_data](./016-api_data/)
1. Create file with data http
2. ``` terraform apply ```
3. Check terraform.tfstate for output

## Random Generator -> [017-random](./017-random/) & [018-random_string](./018-random_string/)
1. Create file with random integer resource
2. ``` terraform apply ```
3. Check output
- Similarly can be used to generate uuid, password, shuffle, id
- Resulting values are stored in resource_type.resource_name.result

## Dependent and time_sleep -> [019-depend_on_and_sleep](./019-depend_on_and_sleep/)
- Resource creation depends_on previous resource and in case sleep if needs to be used

## Taint -> [001-aws_instance](./001-aws_instance/)
1. Create resource using existing tf file
2. Taint the resource using ``` terraform taint resource_type.resource_name ```
3. Reapply
- Ideally without taint it doesn't drops and recreates, but now it does

## Final Test -> finaltest
1. Creation of AWS Instance and install apache2, attach security group to allow port 80 and port 22 accessible from anywhere


- Training by Sagar Mehta Sagar.mehta@atgensoft.com

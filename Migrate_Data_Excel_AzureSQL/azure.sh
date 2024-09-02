az login

az group create --name rg_raghav --location eastus

az storage account create --name excelraghavstorageacc --resource-group rg_raghav --location eastus --sku Standard_LRS

az storage container create --name empdata --account-name excelraghavstorageacc

az storage blob upload --container-name empdata --file emp_history.xlsx --name emp_history.xlsx --account-name excelraghavstorageacc

az sql server create --name migratedbserver --resource-group rg_raghav --location eastus --admin-user sqladmin --admin-password P@ssw0rd!

az sql db create --resource-group rg_raghav --server migratedbserver --name EmployeeDB --service-objective S0

az sql server firewall-rule create --resource-group rg_raghav --server migratedbserver --name AllowAzureIP --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0

az sql server firewall-rule create --resource-group rg_raghav --server migratedbserver --name AllowMyIP --start-ip-address 223.185.24.237  --end-ip-address 223.185.24.237

az datafactory create --resource-group rg_raghav --factory-name RaghavDataFactory --location eastus

az group delete --name rg_raghav --yes --no-wait


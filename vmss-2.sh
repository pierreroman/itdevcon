#!/bin/bash

# MySQL values
user="dbuser"
password="Password12"
resourceGroup="HADemo"
vmssName="FrontVMSS"

# Create Resource Group
az group create --name $resourceGroup --location eastus

# Create a virtual network and front-end subnet
az network vnet create \
  --resource-group $resourceGroup \
  --name VNet \
  --address-prefix 10.0.0.0/16 \
  --subnet-name FrontEndSubnet \
  --subnet-prefix 10.0.1.0/24

# Create Front end Scale Set
az vmss create \
  --resource-group $resourceGroup \
  --name $vmssName \
  --vnet-name VNet \
  --subnet FrontEndSubnet \
  --image UbuntuLTS \
  --admin-username sysadmin \
  --admin-password P@ssw0rd1234 \
  --instance-count 2 \
  --vm-sku Standard_DS2 \
  --upgrade-policy-mode Automatic \
  --app-gateway myAppGateway \
  --backend-pool-name appGatewayBackendPool


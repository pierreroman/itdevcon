#!/bin/bash

ResourceGroupeast="ITDEVcon-demo-East"
vneteast="VirtualNetworkeast"
ResourceGroupwest="ITDEVCon-demo-West"
vnetwest="VirtualNetworkWest"


# Get the id for VNet1.
VNet1Id=$(az network vnet show \
  --resource-group $ResourceGroupeast \
  --name $vneteast \
  --query id --out tsv)

# Get the id for VNet2.
VNet2Id=$(az network vnet show \
  --resource-group $ResourceGroupwest \
  --name $vnetwest \
  --query id \
  --out tsv)

# Peer VNet1 to VNet2.
az network vnet peering create \
  --name LinkVnet1ToVnet2 \
  --resource-group $ResourceGroupeast \
  --vnet-name $vneteast \
  --remote-vnet-id $VNet2Id \
  --allow-vnet-access

# Peer VNet2 to VNet1.
az network vnet peering create \
  --name LinkVnet2ToVnet1 \
  --resource-group $ResourceGroupwest \
  --vnet-name $vnetwest \
  --remote-vnet-id $VNet1Id \
  --allow-vnet-access



  ssh -p 5000 sysadmin@104.40.10.77
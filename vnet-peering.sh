#!/bin/bash

ResourceGroup1="demo2-prep-est"
vneteast="VirtualNetwork"
ResourceGroup2="demo-prep-west"
vnetwest="VirtualNetwork"


# Get the id for VNet1.
VNet1Id=$(az network vnet show \
  --resource-group $ResourceGroup1 \
  --name $vneteast \
  --query id --out tsv)

# Get the id for VNet2.
VNet2Id=$(az network vnet show \
  --resource-group $ResourceGroup2 \
  --name $vnetwest \
  --query id \
  --out tsv)

# Peer VNet1 to VNet2.
az network vnet peering create \
  --name LinkVnet1ToVnet2 \
  --resource-group $ResourceGroup1 \
  --vnet-name $vneteast \
  --remote-vnet-id $VNet2Id \
  --allow-vnet-access

# Peer VNet2 to VNet1.
az network vnet peering create \
  --name LinkVnet2ToVnet1 \
  --resource-group $ResourceGroup2 \
  --vnet-name $vnetwest \
  --remote-vnet-id $VNet1Id \
  --allow-vnet-access
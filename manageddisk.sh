#!/bin/bash


ResourceGroupeast="ITDEVcon-demo-East"
VM0="MusicApp0"
VM1="MusicApp1"


az vm deallocate \
    --resource-group $ResourceGroupeast \
    --name $VM0

az vm deallocate \
    --resource-group $ResourceGroupeast \
    --name $VM1

az vm availability-set convert \
    --resource-group $ResourceGroupeast \
    --name AvalibilitySet

az vm convert \
    --resource-group $ResourceGroupeast \
    --name $VM0

az vm convert \
    --resource-group $ResourceGroupeast \
    --name $VM1

az vm start \
    --resource-group $ResourceGroupeast \
    --name $VM0

az vm start \
    --resource-group $ResourceGroupeast \
    --name $VM1



# availability sets

az vm availability-set show \
    --resource-group $ResourceGroupeast \
    --name AvalibilitySet \
    --query [virtualMachines[*].id] \
    --output table


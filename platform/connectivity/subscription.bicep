param location string
// param subscriptionBillingScope string
// param subscriptionAliasName string
// param subscriptionDisplayName string
param subscriptionTags object
param subscriptionManagementGroupId string

targetScope = 'managementGroup'

module subscription 'br/public:lz/sub-vending:1.5.1' = {
  name: '${uniqueString(deployment().name, location)}-connectivity-sub'
  params: {
    subscriptionAliasEnabled: false
    existingSubscriptionId: '40b00656-92a1-428a-8bd2-aa0c8346e9b5'
    // subscriptionBillingScope: subscriptionBillingScope
    // subscriptionAliasName: subscriptionAliasName
    // subscriptionDisplayName: subscriptionDisplayName
    subscriptionTags: subscriptionTags
    subscriptionWorkload: 'Production'
    subscriptionManagementGroupAssociationEnabled: true
    subscriptionManagementGroupId: subscriptionManagementGroupId
  }
}

// example below
// targetScope = 'managementGroup'

// @description('Specifies the location for resources.')
// param location string = 'uksouth'

// module sub003 'br/public:lz/sub-vending:1.5.1' = {
//   name: 'sub003'
//   params: {
//     subscriptionAliasEnabled: false
//     existingSubscriptionId: 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx'
//     subscriptionTags: {
//       test: 'true'
//     }
//     subscriptionWorkload: 'Production'
//     subscriptionManagementGroupAssociationEnabled: true
//     subscriptionManagementGroupId: 'alz-landingzones-corp'
//     virtualNetworkEnabled: true
//     virtualNetworkLocation: location
//     virtualNetworkResourceGroupName: 'rsg-${location}-net-001'
//     virtualNetworkName: 'vnet-${location}-001'
//     virtualNetworkAddressSpace: [
//       '10.0.0.0/16'
//     ]
//     virtualNetworkResourceGroupLockEnabled: false
//     virtualNetworkPeeringEnabled: true
//     hubNetworkResourceId: '/subscriptions/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/resourceGroups/rsg-uks-net-vwan-001/providers/Microsoft.Network/virtualHubs/vhub-uks-001'
//   }
// }

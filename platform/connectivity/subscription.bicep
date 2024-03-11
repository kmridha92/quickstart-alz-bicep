param location string
param subscriptionBillingScope string
param subscriptionAliasName string
param subscriptionDisplayName string
param subscriptionTags object
param subscriptionManagementGroupId string

targetScope = 'managementGroup'

module subscription 'br/public:lz/sub-vending:1.5.1' = {
  name: '${uniqueString(deployment().name, location)}-sub'
  params: {
    subscriptionAliasEnabled: true
    subscriptionBillingScope: subscriptionBillingScope
    subscriptionAliasName: subscriptionAliasName
    subscriptionDisplayName: subscriptionDisplayName
    subscriptionTags: subscriptionTags
    subscriptionWorkload: 'Production'
    subscriptionManagementGroupAssociationEnabled: true
    subscriptionManagementGroupId: subscriptionManagementGroupId
  }
}

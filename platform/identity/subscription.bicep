param location string = 'australiaeast'
param subscriptionManagementGroupId string = 'poc-platform-identity'

targetScope = 'managementGroup'

module subscription 'br/public:lz/sub-vending:1.5.1' = {
  name: '${uniqueString(deployment().name, location)}-identity-sub'
  params: {
    subscriptionAliasEnabled: false
    existingSubscriptionId: '5f6f76b7-e6a2-4de8-9f9e-8547c1549883'
    subscriptionTags: {
      IaC: 'Bicep'
      subscription: 'identity'
    }
    subscriptionWorkload: 'Production'
    subscriptionManagementGroupAssociationEnabled: true
    subscriptionManagementGroupId: subscriptionManagementGroupId
  }
}

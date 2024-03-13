param location string = 'australiaeast'
param subscriptionManagementGroupId string = 'poc-platform-management'

targetScope = 'managementGroup'

module subscription 'br/public:lz/sub-vending:1.5.1' = {
  name: '${uniqueString(deployment().name, location)}-management-sub'
  params: {
    subscriptionAliasEnabled: false
    existingSubscriptionId: 'c57a9a06-e36a-452a-a1ab-16b99eb747bf'
    subscriptionTags: {
      IaC: 'Bicep'
      subscription: 'management'
    }
    subscriptionWorkload: 'Production'
    subscriptionManagementGroupAssociationEnabled: true
    subscriptionManagementGroupId: subscriptionManagementGroupId
  }
}

param location string  = 'australiaeast'
param name string = 'management-rg'

targetScope = 'subscription'

module resourceGroup 'br/public:avm/res/resources/resource-group:0.2.3' = {
  name: '${uniqueString(deployment().name, location)}-rg-poc'
  params: {
    name: name
    location: location
    tags: {
      IaC: 'Bicep'
      subscription: 'management'
    }
  }
}

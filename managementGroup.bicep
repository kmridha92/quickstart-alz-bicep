param location string = 'australiaeast'

targetScope = 'tenant'

module base 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-base-poc'
  scope: managementGroup('Tenant Root Group')
  params: {
    name: 'base-poc'
    displayName: 'Base-poc'
    location: location
    parentId: '58f7c0d7-3191-43d3-a803-62d8805626de'
  }
}

module identity 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-identity-poc'
  scope: managementGroup('Tenant Root Group')
  params: {
    name: 'identity-poc'
    displayName: 'Identity-poc'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

module connectivity 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-connectivity-poc'
  scope: managementGroup('Tenant Root Group')
  params: {
    name: 'connectivity-poc'
    displayName: 'Connectivity-poc'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

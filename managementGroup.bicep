param location string = 'australiaeast'

targetScope = 'managementGroup'

module base 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-base-poc'
  params: {
    name: 'base-poc'
    displayName: 'Base-poc'
    location: location
    parentId: '58f7c0d7-3191-43d3-a803-62d8805626de'
  }
}

module platform 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-platform-poc'
  params: {
    name: 'platform-poc'
    displayName: 'Platform-poc'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

module identity 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-identity-poc'
  params: {
    name: 'identity-poc'
    displayName: 'Identity-poc'
    location: location
    parentId: platform.outputs.name
  }
  dependsOn: [
    platform
  ]
}

module connectivity 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-connectivity-poc'
  params: {
    name: 'connectivity-poc'
    displayName: 'Connectivity-poc'
    location: location
    parentId: platform.outputs.name
  }
  dependsOn: [
    platform
  ]
}

module management 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-management-poc'
  params: {
    name: 'management-poc'
    displayName: 'Management-poc'
    location: location
    parentId: platform.outputs.name
  }
  dependsOn: [
    platform
  ]
}

module lz 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-lz-poc'
  params: {
    name: 'landing-zones-poc'
    displayName: 'Landing-Zones-poc'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

module corp 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-corp-poc'
  params: {
    name: 'corp-poc'
    displayName: 'Corp-poc'
    location: location
    parentId: lz.outputs.name
  }
  dependsOn: [
    lz
  ]
}

module online 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-online-poc'
  params: {
    name: 'online-poc'
    displayName: 'Online-poc'
    location: location
    parentId: lz.outputs.name
  }
  dependsOn: [
    lz
  ]
}

module sandbox 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-sandbox-poc'
  params: {
    name: 'sandbox-poc'
    displayName: 'Sandbox-poc'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

module decommissioned 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-decommissioned-poc'
  params: {
    name: 'decommissioned-poc'
    displayName: 'Decommissioned-poc'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

param location string = 'australiaeast'
param initial string = 'poc'

targetScope = 'managementGroup'

module base 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-base'
  params: {
    name: initial
    displayName: 'POC-MG'
    location: location
    parentId: '58f7c0d7-3191-43d3-a803-62d8805626de'
  }
}

module platform 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-platform'
  params: {
    name: '${initial}-platform'
    displayName: 'Platform'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

module identity 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-identity'
  params: {
    name: '${platform.outputs.name}-identity'
    displayName: 'Identity'
    location: location
    parentId: platform.outputs.name
  }
  dependsOn: [
    platform
  ]
}

module connectivity 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-connectivity'
  params: {
    name: '${platform.outputs.name}-connectivity'
    displayName: 'Connectivity'
    location: location
    parentId: platform.outputs.name
  }
  dependsOn: [
    platform
  ]
}

module management 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-management'
  params: {
    name: '${platform.outputs.name}-management'
    displayName: 'Management'
    location: location
    parentId: platform.outputs.name
  }
  dependsOn: [
    platform
  ]
}

module lz 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-lz'
  params: {
    name: '${initial}-landingzones'
    displayName: 'Landing Zones'
    location: location
    parentId: base.outputs.name
  }
  dependsOn: [
    base
  ]
}

module corp 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-corp'
  params: {
    name: '${lz.outputs.name}-corp'
    displayName: 'Corp'
    location: location
    parentId: lz.outputs.name
  }
  dependsOn: [
    lz
  ]
}

module dmz 'br/public:avm/res/management/management-group:0.1.1' = {
  name: '${uniqueString(deployment().name)}-dmz'
  params: {
    name: '${lz.outputs.name}-dmz'
    displayName: 'DMZ'
    location: location
    parentId: lz.outputs.name
  }
  dependsOn: [
    lz
  ]
}

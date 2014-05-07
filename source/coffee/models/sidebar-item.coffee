define ['backbone'], (Backbone)->
  SidebarItem = Backbone.Model.extend
    idAttribute: 'id',
    defaults:
      title: 'No Title'
      url: '#'
      points: 0

  return SidebarItem
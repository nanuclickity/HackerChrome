define [
  'backbone',
  'models/sidebar-item'
  ], (Backbone, Model)->
  SidebarCollection = Backbone.Collection.extend
    url: "http://node-hnapi.herokuapp.com/news"
    model: Model

  Collection = new SidebarCollection()
  Collection.fetch()
  return Collection
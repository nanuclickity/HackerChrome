define [
  'marionette',
  'regions/header',
  'regions/sidebar',
  'regions/content'
  ], (Marionette, headerRegion, sidebarRegion, contentRegion)->

  RegionsController = Marionette.Controller.extend
    build: (App)->
      @._APP = App
      App.addRegions
        Header: headerRegion
        Sidebar: sidebarRegion
        Content: contentRegion


  Controller = new RegionsController()
  return Controller
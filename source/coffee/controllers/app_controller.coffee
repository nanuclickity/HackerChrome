define [
  'marionette',
  'controllers/content'
  ], (Marionette, ContentController)->

  AppController = Marionette.Controller.extend
    renderHome: -> ContentController.renderView 'views/home'
    renderLoading: -> ContentController.renderView 'views/loading'

Controller = new AppController()
return Controller
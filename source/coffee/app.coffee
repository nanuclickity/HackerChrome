define [
  'marionette'
  ], (Marionette)->

  App = new Marionette.Application()

  App.addInitializer ->
    requirejs ['controllers/regions'], (RegionsController)->
      RegionsController.build App

  App.on 'start', -> console.log 'App: Started'

  return App
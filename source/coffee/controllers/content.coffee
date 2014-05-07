define [
	'marionette',
	'vent',
	'regions/content'
	], (Marionette, Vent, contentRegion)->

  Controller = Marionette.Controller.extend
    renderView: (viewURL, options)->
      console.log 'Navigate::' + viewURL
      requirejs [viewURL], (view)-> Vent.trigger 'content:showview', view

  return new Controller()
define [
	'marionette',
	'vent'
	], (Marionette, Vent)->

  ContentRegion = Marionette.Region.extend({})

  Region = new ContentRegion
    el: 'section.app-content'

  Region.on 'show', (view)->
    view.$el.hide()
    view.$el.addClass 'container-fluid'
    @.$el.html view.el

    view.$el.show().addClass('animated fadeInUp')

    Vent.trigger 'header:update'

    @.$el.on 'scroll', (e)->
      if $(this).get(0).scrollTop > 30
        Vent.trigger 'header:shadow:on'
      else
        Vent.trigger 'header:shadow:off'

  Vent.on 'content:showview', (view)->
    Region.show view
    Vent.trigger 'menu:hide'


  return Region
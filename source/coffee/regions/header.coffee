define [
  'marionette',
  'views/header'
  ], (Marionette, headerView)->

  HeaderRegion = Marionette.Region.extend
    open: (view)->
      view.$el.hide()
      @.$el.html view.el
      view.$el.show().addClass('animated fadeIn')

  Region = new HeaderRegion
    el: 'section.app-header'

  Region.show headerView
  return Region
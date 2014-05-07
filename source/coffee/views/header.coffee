define [
  'marionette',
  'vent',
  'models/header',
  'bootstrap'
  ],(Marionette, vent, Model)->

  _toNormalCase = (str)->
    if str.length then return str[0].toUpperCase() + str.substr(1).toLowerCase()
    else return ""

  HeaderView = Marionette.ItemView.extend
    template: jade.templates['header']
    tagName: 'header'
    className: 'header-inner'
    model: Model
    modelEvents:
      'change' : 'render'


    updateHeader: ->
      F = Backbone.history.getFragment().split("/")
      F = F.map (k)-> _toNormalCase(k)
      F = _.compact F
      routes = _.union ["Home"], F

      if F.length then @.model.set 'routeArray', routes
      else @.model.set 'routeArray', ["Loading..."]
      that = this

      requirejs ['views/menu'], (Menu)->
        _model = Menu.collection.where({isActive: true})[0]
        if _model?
          that.model.set 'iconClass', _model.get('iconClass')
          that.model.set 'viewName' , _model.get('name')
        else
          that.model.set 'viewName', 'ModularUI'
          that.model.set 'iconClass', "fa fa-fw fa-home"

    enableShadow: -> @.$el.addClass('scroll-shadow')
    disableShadow: -> @.$el.removeClass('scroll-shadow')



  View = new HeaderView()
  View.on 'render', (view)->

    $(document).on 'click', '.do-togglesidebar', (e)->
      vent.trigger 'sidebar:toggle'


  vent.on 'header:update', -> do View.updateHeader
  vent.on 'header:shadow:on', -> do View.enableShadow
  vent.on 'header:shadow:off', -> do View.disableShadow

  return View
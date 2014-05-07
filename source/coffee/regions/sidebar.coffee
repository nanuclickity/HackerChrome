define  [
  'marionette',
  'views/sidebar',
  'vent'
  ], (Marionette, SidebarView, Vent)->


  SidebarRegion = Marionette.Region.extend
    open: (view)->
      view.$el.hide()
      @.$el.html view.el
      view.$el.show().addClass('animated bounceInUp')
    toggleSidebar: ->
      check = @.$el.attr('data-visibility')
      switch check
        when 'visible' then @.$el.attr('data-visibility', 'hidden')
        when 'hidden' then @.$el.attr('data-visibility', 'visible')
        else @.$el.attr('data-visibility', 'hidden')

  Region = new SidebarRegion
    el: '.app-sidebar'
  Vent.on 'sidebar:toggle', -> Region.toggleSidebar()

  Region.show SidebarView
  return Region
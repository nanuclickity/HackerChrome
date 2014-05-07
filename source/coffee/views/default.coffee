define ['marionette'], (Marionette)->
  # This view just accepts a template name
  # looks for a template with that name
  # and renders it
  # Note: Very useful for testing

  # Just create a template in templates/
  # point your browser to it.. and view is rendered
  DefaultView = Marionette.ItemView.extend({})

  # Extend options are left blank in defaultview.
  # I might just tweak these a little bit in later updates.

  return DefaultView
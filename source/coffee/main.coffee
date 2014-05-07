requirejs.config
  baseUrl: "./js/"
  paths:
    underscore  : "libs/underscore"
    jquery      : "libs/jquery"
    bootstrap   : "libs/bootstrap"
    backbone    : "libs/backbone"
    marionette  : "libs/backbone.marionette.min"
    sparkline   :   "libs/jquery.sparkline.min"
    templates   : "./templates"
    app         : "./app"
    vent        : "./utils/vent"

  shim:
    jquery :
      exports : "$"
    bootstrap :
      deps : ["jquery"]
    underscore :
      exports : "_"
    templates:
      exports: "jade"
    sparkline:
      deps: ['jquery']
    backbone:
      deps: ["jquery", "underscore"]
      exports: "Backbone"
    marionette:
      deps: ["backbone", "templates"]
      exports: "Marionette"
    app:
      deps: ["marionette", "bootstrap"]
      exports: "App"


# Initiation Code
requirejs ["jquery", "app"], ($, App)->
  window.$ = window.jQuery = $

  # Hack to enable use of jade templates
  Marionette.Renderer.render = (tpl, data)->
    if typeof tpl is "function"
      tplFn = tpl
    else
      tplFn = jade.templates[tpl]
    return tplFn data


  # Start the Application
  App.start()
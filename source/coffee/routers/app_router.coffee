define [
  'controllers/app_controller'
], (Controller)->

  AppRouter = Marionette.AppRouter.extend
    isReady: false
    initialize: -> @.isReady = true
    controller: Controller
    appRoutes:
      ''    : 'renderLoading'
      '#'   : 'renderLoading'
      '/'   : 'renderLoading'
      'home': 'renderHome'


  Router = new AppRouter()
  return Router
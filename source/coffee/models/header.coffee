define ['backbone'], (Backbone)->


	HeaderModel = Backbone.Model.extend
		defaults:
			title: 'HackerChrome'
			iconClass: 'fa fa-fw fa-bolt'

	Model = new HeaderModel()

	return Model
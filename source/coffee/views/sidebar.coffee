define [
  'marionette',
  'vent',
  'collections/sidebar'
  ], (Marionette, Vent, Collection)->

  SidebarItemView = Marionette.ItemView.extend
    template: 'sidebar-item'
    className: 'sidebar-item'
    tagName: 'li'

  SidebarView = Marionette.CompositeView.extend
    template: 'sidebar-main'
    className: 'sidebar-inner'
    itemView: SidebarItemView
    itemViewContainer: '.sidebar-list'



  View = new SidebarView
    collection: Collection

  return View
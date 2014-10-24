Ext.define "App.Application",
  name: "App"
  extend: "Ext.app.Application"
  requires: [
    "App.controller.Main"
    "App.store.PromotionObjects"
  ]
  views: []
  controllers: [
      "Main"
  ]
  stores: [
      "PromotionObjects"
  ]

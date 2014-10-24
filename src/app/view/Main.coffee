
Ext.define "App.view.Main",
  extend: "Ext.container.Container"
  requires: [
      "Ext.tab.Panel"
      "Ext.form.Panel"
      "Ext.layout.container.Border"

      "Ext.form.field.ComboBox"
      "Ext.grid.Panel"
      "Ext.grid.feature.Grouping"

  ]
  xtype: "app-main"
  layout:
    type: "border"

  items: [
    region: "center"
    xtype: "form"
    title: "Sulis PromoWiz"
    defaults:
        xtype: "textfield"
        margin: "5 5 5 5"
    items: [
        fieldLabel: "name"
        allowBlank: no
    ,
        xtype: "combo"
        fieldLabel: "User"
        allowBlank: no
        store:
            ["Fred Kaputnik", "Alfred E. Neumann", "Ina Waag"]
    ,
        xtype: "grid"
        title: "Promotion Objects"
        #features:
            #ftype: "grouping"

        id: "promotion-objects"

        selModel:
            mode: "MULTI"
        selType: "checkboxmodel"

        tbar: [
            xtype: "button"
            text: "remove"
            action: "remove"
            icon: "resources/cross.png"
            disabled: yes
        ]
        columns: [
            text: "icon"
            dataIndex: "icon"
        ,
            text: "name"
            dataIndex: "name"
            flex: 1
        ,
            text: "number"
            dataIndex: "number"
            flex: 1
        ,
            text: "state"
            dataIndex: "state"
        ]
        store: "PromotionObjects"
    ]
    buttons: [
        xtype: "button"
        text:  "cancel"
        action: "cancel"
    ,
        xtype: "button"
        formBind: yes
        text:  "ok"
        action: "ok"
    ]
  ]


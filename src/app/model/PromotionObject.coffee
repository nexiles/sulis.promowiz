Ext.define "App.model.PromotionObject",  ->
    extend: "Ext.data.Model"


    fields: [
        name: "name"
        type: "string"
    ,
        name: "number"
        type: "string"
    ,
        name: "icon"
        type: "string"
    ,
        name: "state"
        type: "string"
    ,
        name: "promotable"
        type: "boolean"
        default: no
    ]



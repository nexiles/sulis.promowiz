Ext.define 'App.store.PromotionObjects',
    extend: 'Ext.data.Store'
    model: 'App.model.PromotionObject'

    autoLoad: no

    groupField: "state"

    proxy:
        type: "ajax"
        url:  "/Windchill/servlet/nexiles/tools/services/siemens.tdsm/1.2/mddb/enumerate/TestProduct/mddb"
        reader:
            type: "json"
            root: "items"



Ext.define "App.controller.Main",
    extend: "Ext.app.Controller"

    refs: [
        selector: "#promotion-objects"
        ref: "promotionObjects"
    ]

    stores: [
        "PromotionObjects"
    ]

    log: (message) ->
        console.log "%c#{@$className}: #{message}", "color: green"

    init: ->
        @log "Init"

        @control
            "#promotion-objects":
                selectionchange: @onSelChange
            "#promotion-objects button[action=remove]":
                click: @onRemoveClick

        store = @getPromotionObjectsStore()
        store.load()
        store.on "load", @onStoreLoad, @

        window.MainController = @
        @callParent arguments

    ######################################################################
    # Helpers
    ######################################################################

    enableButtons: (actions) ->
        panel = @getPromotionObjects()
        for action in actions
            button = panel?.down "button[action=#{action}]"
            button?.enable()

    disableButtons: (actions) ->
        panel = @getPromotionObjects()
        for action in actions
            button = panel?.down "button[action=#{action}]"
            button?.disable()

    getSelectedModels: ->
        @log "getSelectedModels"
        grid = @getPromotionObjects()
        grid.getSelectionModel().getSelection()

    ######################################################################
    # Event Handler
    ######################################################################

    onStoreLoad: (store, records, success) ->
        @log "onStoreLoad"

    onSelChange: (selModel, selected, options) ->
        @log "onSelChange: selected #{selected.length} objects."
        @disableButtons ["remove"]

        return unless selected.length

        @enableButtons ["remove"]

        for model in selected
            @log "onSelChange: #{model.data.name}"

    onRemoveClick: (button) ->
        @log "onRemoveClick"

        store = @getPromotionObjectsStore()

        selected = @getSelectedModels()
        return unless selected
        store.remove selected



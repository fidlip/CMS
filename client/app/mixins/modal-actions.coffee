`import Ember from 'ember';`

Mixin = Ember.Mixin.create
    actions:
        openModal: (modalName, currentController)->
            this.render modalName,
                into: 'application'
                outlet: 'modal'
                controller: currentController

        closeModal: ->
            this.disconnectOutlet
                outlet: 'modal'
                parentView: 'application'

`export default Mixin;`

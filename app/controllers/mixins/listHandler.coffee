`import Ember from 'ember';`

Mixin = Ember.Mixin.create

  subRoute: null

  actions:
    selectionChanged: (listItem)->
      this.transitionToRoute(@get("subRoute"), listItem?.get('data'))
      return false

`export default Mixin;`

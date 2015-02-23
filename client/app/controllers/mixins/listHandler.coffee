`import Ember from 'ember';`

Mixin = Ember.Mixin.create

  baseModel: null
  subRoute: null
  newRoute: null

  actions:
    add: ->
      console.info("Add new item to ", @get("subRoute"))
      this.transitionToRoute(@get("newRoute"))
      return false

    selectionChanged: (listItem)->
      this.transitionToRoute(@get("subRoute"), listItem?.get('data'))
      return false

`export default Mixin;`

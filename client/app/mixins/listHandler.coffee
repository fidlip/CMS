`import Ember from 'ember';`

Mixin = Ember.Mixin.create

  baseModel: null
  subRoute: null
  newRoute: null

  actions:
    add: ->
      console.info("Add new item to ", @get("subRoute"))
      @transitionToRoute(@get("newRoute"))
      return false

    selectionChanged: (listItem)->
      console.info("Selection changed", @get("subRoute"), listItem?.get('data'))
      @transitionToRoute(@get("subRoute"), listItem?.get('data'))
      return false

`export default Mixin;`

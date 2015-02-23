`import Ember from 'ember';`

Mixin = Ember.Mixin.create

  baseModel: null
  subRoute: null

  actions:
    add: ->
      console.info("Add new item to ", @get("subRoute"))
      this.transitionToRoute("posts.new")
      return false

    selectionChanged: (listItem)->
      this.transitionToRoute(@get("subRoute"), listItem?.get('data'))
      return false

`export default Mixin;`

`
    import Ember from 'ember';
`

Mixin = Ember.Mixin.create
  superRoute: null

#  modelChanged: Ember.observer "model", (model)->
#    console.info("MODEL CHANGED", @get("id"), model.get("id"))
#
  actions:
    submit: ->
      model = @get('model')
      console.debug("Save item", model)
      #todo: check response from server and handle error states
      model.save()
      .then( =>
        @target.send('submitOK', model);
      , (err)=>
        console.error("ERROR SAVING ITEM", err)
      ).catch (err)=>
        console.error("ERROR DURING PROMISE", err)

      return false


    delete: (item)->
      console.debug("Delete item")
      #todo: check response from server and handle error states
      item = @get('model')
      item.deleteRecord()
      item.save().then =>
        this.transitionToRoute(@get("superRoute"))

      return false

    cancel: (item)->
      console.debug("Cancel")
      item = @get('model')
      item.rollback()
      this.transitionToRoute(@get("superRoute"))

      return false

`export default Mixin;`

`import Ember from 'ember';`

Route = Ember.Route.extend
  model: ->
    console.info("NEW POST MODEL", @store)
    ret = @store.createRecord("post")
    return ret


  actions:
    submitOK: (model)->
      console.info("SUBMIT OK -> ", model.get("id"))
      @transitionTo("post", model)
      return false


`export default Route;`

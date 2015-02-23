`import Ember from 'ember';`

Route = Ember.Route.extend
  model: ->
    console.info("NEW USER MODEL", @store)
    ret = @store.createRecord("user")
    return ret


  actions:
    submitOK: (model)->
      console.info("SUBMIT OK -> ", model.get("id"))
      @transitionTo("user", model)
      return false


`export default Route;`

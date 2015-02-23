`import Ember from 'ember'`

PostRoute = Ember.Route.extend
  model: ->
    console.info("NEW POST MODEL", @store)
    ret = @store.createRecord("post")
    console.info("ret=", ret)
    return ret


  actions:
    submitOK: (model)->
      console.info("SUBMIT OK -> ", model.get("id"))
      @transitionTo("post", model)
      return false


`export default PostRoute`

`
import Ember from 'ember';
import DestroyNew from 'cms/mixins/destroy-new-model';
`

Route = Ember.Route.extend DestroyNew,
  model: ->
    console.debug("NEW POST MODEL", @store)
    model = @store.createRecord("post")
    userId = @session.get('user.id')

    return @store.find('user', userId).then (result)->
      model.set('user', result)
      return model


  actions:
    submitOK: (model)->
      console.debug("SUBMIT OK -> ", model.get("id"))
      @transitionTo("posts.post", model)
      return false

`export default Route;`

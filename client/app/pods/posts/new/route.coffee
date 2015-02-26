`
import Ember from 'ember';
import DestroyNew from 'cms/mixins/destroy-new-model';
`

Route = Ember.Route.extend DestroyNew,
  model: ->
    console.debug("NEW POST MODEL", @store)
    ret = @store.createRecord("post")
    return ret


  actions:
    submitOK: (model)->
      console.debug("SUBMIT OK -> ", model.get("id"))
      @transitionTo("posts.post", model)
      return false

### TODO:
#      createPost: (model)->
#        # model.set('tags', ['lifestyle', 'health', 'tech']);
#        userId = @session.get('user.id')
#
#        @store.find('user', userId).then (result)->
#          model.set('user', result)
#          return model.save()
#        .then(post => @transitionTo('posts.post', post))
###

`export default Route;`

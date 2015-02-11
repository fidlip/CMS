`import Ember from 'ember'`

PostsRoute = Ember.Route.extend
  model: ->
    return this.store.find('post')


`export default PostsRoute`

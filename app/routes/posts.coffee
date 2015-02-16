`import Ember from 'ember'`

PostsRoute = Ember.Route.extend
  model: ->
    return @store.find('post')


`export default PostsRoute`

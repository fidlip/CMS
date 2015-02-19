`import Ember from 'ember'`

UsersRoute = Ember.Route.extend
  model: ->
    return @store.find('user')


`export default UsersRoute`

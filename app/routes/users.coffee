`import Ember from 'ember'`

UsersRoute = Ember.Route.extend
  model: ->
    return this.store.find('user')


`export default UsersRoute`

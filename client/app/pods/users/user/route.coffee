`import Ember from 'ember';`

Route = Ember.Route.extend
  model: (params)->
    @store.find('user', params.user_id)

  actions:
    submitOK: ->
      return false; #nothing to do

`export default Route;`

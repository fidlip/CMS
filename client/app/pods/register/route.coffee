`import Ember from 'ember';`

Route = Ember.Route.extend
  model: ->
    return Ember.Object.create()

  actions:
    submitOK: (model)->
      this.transitionTo("login", model);
      return false;

`export default Route;`

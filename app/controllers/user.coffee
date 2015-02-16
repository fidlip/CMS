`
import Ember from 'ember';
import EV from 'ember-validations';
`

Controller = Ember.ObjectController.extend EV.Mixin,
  actions:
    submit: ->
      console.info("SHOULD SUBMIT", @get("userName"))
      return false

  validations:
    userName:
      presence: true
      length: { minimum: 5 }
    firstName:
      presence: true
    surname:
      presence: true


`export default Controller;`

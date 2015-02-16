`
import Ember from 'ember';
import EV from 'ember-validations';
`

Controller = Ember.ObjectController.extend EV.Mixin,
  actions:
    submit: ->
      console.info("SHOULD SUBMIT", @get("title"))
      return false

  validations:
    title:
      presence: true
    text:
      presence: true

`export default Controller;`

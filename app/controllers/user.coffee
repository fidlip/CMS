`
import Ember from 'ember';
import EV from 'ember-validations';
`

Controller = Ember.ObjectController.extend EV.Mixin,
  actions:
    submit: ->
      #todo: check response from server and handle error states
      @get('model').save()
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

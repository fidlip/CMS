`
import Ember from 'ember';
`

Controller = Ember.ObjectController.extend
  actions:
    submit: ->
      console.info("SHOULD SUBMIT")
      return false

`export default Controller;`

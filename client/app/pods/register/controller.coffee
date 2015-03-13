`
import Ember from 'ember';
import EV from 'ember-validations';
`

Controller = Ember.ObjectController.extend EV.Mixin,
  superRoute: "users"

  validations:
    username:
      presence: true
      length: { minimum: 5 }
    firstName:
      presence: true
    lastName:
      presence: true
    password:
      presence: true

  actions:
    submit: ->
      model = @get('model')
      console.debug("Register:", model)
      #todo: check response from server and handle error states
      model.save()
      .then( =>
        @target.send('submitOK', model);
      , (err)=>
        console.error("ERROR SAVING REGISTRATION", err)
      ).catch (err)=>
        console.error("ERROR DURING PROMISE", err)

      return false



`export default Controller;`

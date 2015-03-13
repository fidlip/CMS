`
import Ember from 'ember';
import EV from 'ember-validations';
`

Mixin = Ember.Mixin.create EV.Mixin,

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

`export default Mixin;`

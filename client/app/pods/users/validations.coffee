`
import Ember from 'ember';
`

Mixin = Ember.Mixin.create

  validations:
    username:
      presence: true
      length: { minimum: 5 }
    firstName:
      presence: true
    lastName:
      presence: true

`export default Mixin;`

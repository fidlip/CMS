`
import Ember from 'ember';
`

Mixin = Ember.Mixin.create

  validations:
    userName:
      presence: true
      length: { minimum: 5 }
    firstName:
      presence: true
    surname:
      presence: true

`export default Mixin;`

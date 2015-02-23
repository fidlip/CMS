`
import Ember from 'ember';
`

Mixin = Ember.Mixin.create
  validations:
    title:
      presence: true
    text:
      presence: true

`export default Mixin;`

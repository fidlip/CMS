`
import Ember from 'ember';
import EV from 'ember-validations';
`

Mixin = Ember.Mixin.create EV.Mixin,
  validations:
    title:
      presence: true
    text:
      presence: true

`export default Mixin;`

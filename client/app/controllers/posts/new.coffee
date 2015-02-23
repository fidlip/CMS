`
import Ember from 'ember';
import DetailHandler from '../mixins/detailHandler';
`

Controller = Ember.ObjectController.extend DetailHandler,
  superRoute: "posts"

  validations:
    title:
      presence: true
    text:
      presence: true

`export default Controller;`

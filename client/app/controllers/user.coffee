`
    import Ember from 'ember';
    import DetailHandler from './mixins/detailHandler';
`

Controller = Ember.ObjectController.extend DetailHandler,
  superRoute: "users"

  validations:
    userName:
      presence: true
      length: { minimum: 5 }
    firstName:
      presence: true
    surname:
      presence: true


`export default Controller;`

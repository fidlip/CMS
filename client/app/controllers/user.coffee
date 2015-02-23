`
    import Ember from 'ember';
    import DetailHandler from './mixins/detailHandler';
    import Validations from './users/userValidations';
`

Controller = Ember.ObjectController.extend DetailHandler, Validations,
  superRoute: "users"

`export default Controller;`

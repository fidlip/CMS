`
    import Ember from 'ember';
    import DetailHandler from 'cms/mixins/detailHandler';
    import Validations from '../validations';
    import UserTypes from '../fields/userTypes';
`

Controller = Ember.ObjectController.extend DetailHandler, Validations, UserTypes,
  superRoute: "users"

`export default Controller;`

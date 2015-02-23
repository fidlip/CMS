`
import Ember from 'ember';
import DetailHandler from '../mixins/detailHandler';
import Validations from './postValidations';
`

Controller = Ember.ObjectController.extend DetailHandler, Validations,
  superRoute: "posts"

`export default Controller;`

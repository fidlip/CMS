`
import Ember from 'ember';
import DetailHandler from 'cms/mixins/detailHandler';
import Validations from '../validations';
`

Controller = Ember.ObjectController.extend DetailHandler, Validations,
  superRoute: "posts"

`export default Controller;`

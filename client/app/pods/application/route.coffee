`
import Ember from 'ember';
import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin';
import ModalActions from 'cms/mixins/modal-actions';
`

Route = Ember.Route.extend ApplicationRouteMixin, ModalActions, {}

`export default Route;`

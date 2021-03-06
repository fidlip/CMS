`
import Ember from 'ember';
import AuthenticatedRouteMixin from 'simple-auth/mixins/authenticated-route-mixin';
`

Route = Ember.Route.extend AuthenticatedRouteMixin,
  model: ->
    return this.store.find('user')

`export default Route;`

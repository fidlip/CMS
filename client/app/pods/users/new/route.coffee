`
import Ember from 'ember';
import DestroyNew from 'cms/mixins/destroy-new-model';
`

Route = Ember.Route.extend DestroyNew,
  model: ->
    return this.store.createRecord("user");

  actions:
    submitOK: (model)->
      this.transitionTo("users.user", model);
      return false;


`export default Route;`

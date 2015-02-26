`import Ember from 'ember';`

Route = Ember.Route.extend
  model: ->
    return Ember.Object.create()

  actions:
    createUser: (model)->
      _this = this;
      Ember.$.ajax
        url: '/api/v1/users'
        type: 'POST'
        data: JSON.stringify
          user:
            password: model.get('password')
            username: model.get('username')
            firstName: model.get('firstName')
            lastName: model.get('lastName')
        contentType: 'application/json'
      .then (response)->
        _this.transitionTo('login')
        # _this.get('session').authenticate('authenticator:signup', response);
      , (xhr, status, error)->
        _this.set('errorMessage', error)

# model.save().then(user => this.transitionTo('users.user', user));

`export default Route;`

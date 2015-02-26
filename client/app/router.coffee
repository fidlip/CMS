`import Ember from 'ember';
import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'users', ->
    @route 'new'
    @resource "users.user", path: ':user_id'
  @resource 'posts', ->
    @route 'new'
    @resource 'posts.post', path: ':post_id'


  @route("login");
  @route("register");

`export default Router;`

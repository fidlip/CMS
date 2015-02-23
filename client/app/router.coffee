`import Ember from 'ember';
import config from './config/environment';`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'users', ->
    @route 'new'
    @resource 'user', path: ':user_id'
  @resource 'posts', ->
    @route 'new'
    @resource 'post', path: ':post_id'

`export default Router;`

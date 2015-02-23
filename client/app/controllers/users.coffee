`
import Ember from 'ember';
import ListHandler from './mixins/listHandler'
`

Controller = Ember.ArrayController.extend ListHandler,
  baseModel: "User"
  subRoute: "user"
  newRoute: "users.new"

`export default Controller;`

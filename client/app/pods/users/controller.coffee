`
import Ember from 'ember';
import ListHandler from 'cms/mixins/listHandler'
`

Controller = Ember.ArrayController.extend ListHandler,
  baseModel: "User"
  subRoute: "users.user"
  newRoute: "users.new"

`export default Controller;`

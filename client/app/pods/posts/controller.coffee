`
import Ember from 'ember';
import ListHandler from 'cms/mixins/listHandler'
`

Controller = Ember.ArrayController.extend ListHandler,
  baseModel: "Post"
  subRoute: "posts.post"
  newRoute: "posts.new"

`export default Controller;`

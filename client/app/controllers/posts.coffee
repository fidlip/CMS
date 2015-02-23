`
import Ember from 'ember';
import ListHandler from './mixins/listHandler'
`

Controller = Ember.ArrayController.extend ListHandler,
  baseModel: "Post"
  subRoute: "post"

`export default Controller;`

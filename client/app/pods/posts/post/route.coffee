`import Ember from 'ember'`

PostRoute = Ember.Route.extend
#  model: (params)->
#    return this.store.find('post', params.post_id)

  actions:
    submitOK: -> false #nothing to do

`export default PostRoute`

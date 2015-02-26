`import Ember from 'ember';`

Mixin = Ember.Mixin.create
  destroyNew: (->
    model = this.currentModel
    if (model.get('isNew'))
      model.destroyRecord()
  ).on('deactivate')

`export default Mixin;`

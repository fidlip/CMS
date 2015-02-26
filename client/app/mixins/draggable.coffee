`import Ember from 'ember';`

Mixin = Ember.Mixin.create
  attributeBindings: ['draggable']
  draggable: "true"
  dragStart: (ev)->
    ev.dataTransfer.setData('text/data', this.get('content.id'))
    return $('.basket').addClass('dragging')
  dragEnd: ->
    return $('.basket').removeClass('dragging');

`export default Mixin;`

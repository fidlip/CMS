`import Ember from 'ember';`


Mixin = Ember.Mixin.create
    dragOver: (ev)->
        $('.basket').addClass('drag-enter')
        return ev.preventDefault()

    dragLeave: ->
        return $('.basket').removeClass('drag-enter')

`export default Mixin;`

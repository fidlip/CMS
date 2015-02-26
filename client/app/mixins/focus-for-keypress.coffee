`import Ember from 'ember';`

Mixin = Ember.Mixin.create
  focusForKeypress: (->
    #fix for catching key events
    this.$().attr('tabindex', 0)
    this.$().focus()
  ).on('didInsertElement')

`export default Mixin;`

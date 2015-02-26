import Ember from 'ember';
import FocusForKeypress from 'cms/mixins/focus-for-keypress';

export default Ember.Component.extend(FocusForKeypress, {
  action: 'closeModal',
  keyDown: function (e) {
    if (e.keyCode === 27) {
      this.sendAction();
    }
  },
  didInsertElement: function () {
    var self = this;
    var modal = Ember.$('#modalDialog').modal({
      'show': true
    });
    // TODO: Check to see if we need to cleanup this on event upon destroy
    modal.on('hidden.bs.modal', function () {
      self.sendAction();
    });
  },
  willDestroyElement: function () {
    Ember.$('#modalDialog').modal('hide');
  }
});

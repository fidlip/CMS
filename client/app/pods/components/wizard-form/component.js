import Ember from 'ember';

export default Ember.Component.extend({
  activeStep: 0,

  type: function () {
    return this.get('steps')[this.get('activeStep')].component;
  }.property('activeStep'),

  lastStep: function () {
    return (this.get('activeStep') === this.get('steps').length - 1);
  }.property('activeStep'),

  actions: {
    nextStep: function () {
      this.incrementProperty('activeStep');
      this.addActiveClass();
    },

    submitAction: function () {
      if (this.get('lastStep')) {
        this.sendAction('action', this.get('model'));
      } else {
        this.triggerAction({
          action: 'nextStep',
          target: this
        });
      }
    }
  },

  addActiveClass: function () {
    Ember.$('.wizard-active').removeClass('wizard-active');

    var selector = '.wizard-step:eq(' + this.get('activeStep') + ')';
    Ember.$(selector).addClass('wizard-active');
  },

  didInsertElement: function () {
    this.addActiveClass();
  }
});

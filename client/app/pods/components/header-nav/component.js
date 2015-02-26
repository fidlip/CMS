import Ember from 'ember';

export default Ember.Component.extend({
  menu: [{
    'title': 'Index',
    'link': 'index'
  }, {
    'title': 'Feed',
    'link': 's.feed'
  }, {
    'title': 'Media',
    'link': 's.media'
  }, {
    'title': 'Posts',
    'link': 's.posts'
  }, {
    'title': 'Users',
    'link': 's.users',
    'submenu': [{
      'title': 'Index',
      'link': 's.users.index'
    }, {
      'title': 'Create New User',
      'link': 's.users.create'
    }]
  }, {
    'title': 'Templates',
    'link': 's.templates',
    'submenu': [{
      'title': 'Index',
      'link': 's.templates.index'
    }, {
      'title': 'Create New Template',
      'link': 's.templates.create'
    }]
  }, {
    'title': 'Vendors',
    'link': 's.vendors',
    'submenu': [{
      'title': 'Index',
      'link': 's.vendors.index'
    }, {
      'title': 'Create Vendor',
      'link': 's.vendors.create'
    },]
    // }, {
    //     'title': 'Homepages',
    //     'link': 's.homepages',
    //     'submenu': [{
    //         'title': 'Index',
    //         'link': 's.homepages.index'
    //     }, {
    //         'title': 'Create Homepage',
    //         'link': 's.homepages.create'
    //     }, ]
  }],
  didInsertElement: function () {
    var _this = this;
    Ember.$('.mobile-menu').css('padding-right', "15px");
    Ember.$('.mobile-menu').on('shown.bs.collapse', function () {
      Ember.$(document).on('click', _this.hideMenu);
    });

    Ember.$('.mobile-menu').on('hidden.bs.collapse', function () {
      Ember.$(document).unbind("click", _this.hideMenu);
    });

  },
  hideMenu: function () {
    Ember.$('.mobile-menu').collapse('hide');
  }
});

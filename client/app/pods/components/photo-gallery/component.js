import Ember from 'ember';

export default Ember.Component.extend({
  didInsertElement: function () {
    Ember.$('#tiles').imagesLoaded(function () {
      Ember.$('.loader').hide();
      // Prepare layout options.
      var options = {
        itemWidth: 300, // Optional min width of a grid item
        autoResize: true, // This will auto-update the layout when the browser window is resized.
        container: Ember.$('#tiles'), // Optional, used for some extra CSS styling
        offset: 0, // Optional, the distance between grid items
        outerOffset: 0, // Optional the distance from grid to parent
        flexibleWidth: '50%' // Optional, the maximum width of a grid item
      };

      // Get a reference to your grid items.
      var handler = Ember.$('#tiles li');

      var $window = Ember.$(window);
      $window.resize(function () {
        var windowWidth = $window.width(),
          newOptions = {
            flexibleWidth: '50%'
          };

        // Breakpoint
        if (windowWidth < 1024) {
          newOptions.flexibleWidth = '100%';
        }

        handler.wookmark(newOptions);
      });

      // Call the layout function.
      handler.wookmark(options);
    });

    Ember.$('#tiles img').mouseenter(function (e) {
      Ember.$(e.target).siblings('p').show();
    });
    Ember.$('#tiles img').mouseleave(function (e) {
      Ember.$(e.target).siblings('p').hide();
    });
  }
});

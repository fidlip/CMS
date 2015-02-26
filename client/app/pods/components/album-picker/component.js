import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    pickAlbum: function (album) {
      this.set('selectedAlbum', album);
      Ember.$('.album-tile').removeClass('selected');
      Ember.$('#' + album.get('id')).addClass('selected');
    }
  }
});

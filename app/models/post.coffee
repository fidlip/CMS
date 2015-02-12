`
    import DS from 'ember-data';
    import EV from 'ember-validations';
`

Post = DS.Model.extend EV.Mixin,
  title:        DS.attr("string")
  text:         DS.attr("string")
#  previewImage: DS.belongsTo("image")

  validations:
    title:
      presence: true
    text:
      presence: true

`export default Post`

`
    import DS from 'ember-data';
`

Post = DS.Model.extend
  title:        DS.attr("string")
  text:         DS.attr("string")
#  previewImage: DS.belongsTo("image")


`export default Post`

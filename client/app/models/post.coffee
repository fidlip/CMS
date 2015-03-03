`
    import DS from 'ember-data';
`
attr = DS.attr
belongsTo = DS.belongsTo
hasMany = DS.hasMany

Post = DS.Model.extend
  title:        attr("string")
  text:         attr("string")
  user:         belongsTo("user", { async: true })
#  previewImage: DS.belongsTo("image")


`export default Post`

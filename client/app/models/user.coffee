`
import DS from 'ember-data';
`
attr = DS.attr
belongsTo = DS.belongsTo
hasMany = DS.hasMany

User = DS.Model.extend
  username:   attr("string")
  firstName:  attr("string")
  lastName:   attr("string")
  password:   attr("string")
  posts:      hasMany("post", { async: true })
#  group:  DS.belongsTo("group")
#  avatar: DS.belongsTo("avatar")
  userType:   attr("number")

`export default User`

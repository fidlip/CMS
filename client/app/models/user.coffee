`
import DS from 'ember-data';
`

User = DS.Model.extend
  username:   DS.attr("string")
  firstName:   DS.attr("string")
  lastName:   DS.attr("string")
  password: DS.attr("string")
#  group:  DS.belongsTo("group")
#  avatar: DS.belongsTo("avatar")


`export default User`

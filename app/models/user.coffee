`import DS from 'ember-data'`

User = DS.Model.extend {
  username:   DS.attr("string")
  firstname:   DS.attr("string")
  surname:   DS.attr("string")
#  group:  DS.belongsTo("group")
#  avatar: DS.belongsTo("avatar")
}

`export default User`

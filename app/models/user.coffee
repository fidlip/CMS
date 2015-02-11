`
import DS from 'ember-data';
import EV from 'ember-validations';
`

User = DS.Model.extend EV.Mixin,
  userName:   DS.attr("string")
  firstName:   DS.attr("string")
  surname:   DS.attr("string")
#  group:  DS.belongsTo("group")
#  avatar: DS.belongsTo("avatar")

  validations:
    userName:
      presence: true
      length: { minimum: 5 }
    firstName:
      presence: true
    surname:
      presence: true


`export default User`

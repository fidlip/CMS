`
    import Ember from 'ember';
`

Mixin = Ember.Mixin.create
  userTypes: (->
    [
      {id: 0, label: @t("cms.users.types.user")}
      {id: 1, label: @t("cms.users.types.editor")}
      {id: 2, label: @t("cms.users.types.redactor")}
      {id: 4, label: @t("cms.users.types.admin")}
    ]
  ).property()

`export default Mixin;`

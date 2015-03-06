###
  Helper for i18n translating server codes dynamically
  Usage example:   {{t-s err.code}}
###
`import Ember from "ember";`

Helper = Ember.Handlebars.makeBoundHelper (value, options)->
  t = @get("container").lookup('utils:t')
  return t("cms.server." + value)

`export default Helper;`

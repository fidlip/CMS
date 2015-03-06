###
  Helper for i18n translating placeholders
  Usage example: {{em-input property="lastName" label=(t cms.users.lastName) placeholder=(t-p (t cms.users.lastName))}}
###

`import Ember from "ember";`

Helper = Ember.Handlebars.makeBoundHelper (value, options)->
  t = @get("container").lookup('utils:t')
  translatedValue = t(value)
  lowerValue = translatedValue.toLocaleLowerCase()
  return t("cms.general.placeholder", lowerValue)

`export default Helper;`

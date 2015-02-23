`import Ember from "ember";`

Helper = Ember.Handlebars.makeBoundHelper (value, options)->
  t = @.get("container").lookup('utils:t')
  lowerValue = value?.toLocaleLowerCase()
  return t("cms.general.placeholder", lowerValue)

`export default Helper;`

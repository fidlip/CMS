`import service from 'ember-cli-i18n/services/i18n';`

origMethod = service.getLocalizedPath

service.getLocalizedPath = (locale, path)->
#  if (!path)
#    return "?"

  ret = origMethod.apply(@, arguments)
  if (!ret)
    ret = path

  return ret

`export default service;`

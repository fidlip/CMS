`import Em from 'ember';`

initializer =
  name: 'localeDetection'

  initialize: (container, app)->
    console.debug("SETTING LOCALE", window.navigator.language)
    Em.set(app, 'locale', window.navigator.language)

`export default initializer`

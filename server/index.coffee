# To use it create some files under `routes/`
# e.g. `server/routes/ember-hamsters.js`
#
# module.exports = function(app) {
#   app.get('/ember-hamsters', function(req, res) {
#     res.send('hello');
#   });
# };

bodyParser = require('body-parser')
globSync   = require('glob').sync
routes     = globSync('./routes/**/*.coffee', { cwd: __dirname }).map(require)

module.exports = (app)->
  app.use(bodyParser.json())
  app.use bodyParser.urlencoded(
    extended: true
  )

  routes.forEach (route)->
    route(app)

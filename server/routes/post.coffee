# DEPENDENCIES
Inflector = require('ember-inflector-node-shim')
buildResponse = require('../build-response')
Serializer = require('../serializer')
serialize = Serializer.serialize
normalize = Serializer.normalize
Datastore = require('nedb')
db = new Datastore({ filename: "db/post.db", autoload: true })

# NAMES
namespace = '/api/'
modelname = 'post'
resourcename = Inflector.pluralize(modelname)

module.exports = (app)->

  # RETRIEVE all
  app.get namespace + resourcename, (req, res)->
    console.log('Retrieve all: ' + resourcename)

    if (req.query != undefined && req.query.ids != undefined)
      # find records for ids from query
      db.find { _id: { $in: req.query.ids }}, (err, docs)->
        res.json(buildResponse(resourcename, serialize(docs)))

    else
      # find all records
      db.find {}, (err, docs)->
        res.json(buildResponse(resourcename, serialize(docs)))


  # RETRIEVE single
  app.get namespace + resourcename + '/:id', (req, res)->
    id = req.params.id
    console.log('Retrieve single: ' + modelname)

    db.findOne { _id: id }, (err, doc)->
      if (doc == null)
        res.send(400)
      else
        res.json(buildResponse(resourcename, serialize(doc)))


  # CREATE
  app.post namespace + resourcename, (req, res)->
    body = req.body;
    console.log('Create single: ' + modelname, body);

    if (body != undefined && body[modelname] != undefined)
      record = normalize(body[modelname])

      db.insert record, (err, doc)->
        console.info("DONE", doc)
        if (doc == null)
          console.info("!400")
          res.send(400)
        else
          console.info(".201")
          res.json(201, buildResponse(modelname, serialize(doc)))
    else
      console.log('Wrong data in body')
      res.send(400)


  # UPDATE single
  app.put namespace + resourcename + '/:id', (req, res)->
    id = req.params.id
    body = req.body

    console.log('Update single: ' + modelname)

    if (body != undefined && body[modelname] != undefined)
      record = body[modelname]

      record.id = id
      record = normalize(record)

      db.update { "_id": id }, record, {}, (err, numReplaced)->
        if (numReplaced > 0)
          res.json(200, buildResponse(modelname, [serialize(record)]))
        else
          console.log('No records found to update.')
          res.send(400)
    else
      console.log('Wrong data in body')
      res.send(400)


  # DELETE single
  app.delete namespace + resourcename + '/:id', (req, res)->
    id = req.params.id
    console.log('Delete single: ' + modelname)

    db.remove { "_id": id }, {}, (err, numRemoved)->
      if (numRemoved == 1)
        res.send(204)
      else
        console.log('Record not found.')
        res.send(400)

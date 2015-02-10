###
#  Serializer to normalize/serialize between the formats expected
#  by NeDB and Ember Data DS.RESTSerializer
#
#  NeDB expects the primaryKey to be a property with the name '_id'.
#  DS.RESTSerializer expects the property to be called 'id'.
###

primaryKey = '_id' # primaryKey for NeDB

module.exports =
  ###
    Serialize records from NeDB to DS.RESTSerializer format

    @method serialize
    @param {Object|Array} records
    @return {Object|Array} serialized records
  ###
  serialize: (records)->
    if (Array.isArray(records)) then serializeCollection(records) else serializeSingle(records)


  ###
    Normalize records from DS.RESTSerializer to NeDB format.

    @method normalize
    @param {Object|Array} records
    @return {Object|Array} normalized records
  ###
  normalize: (records)->
    if (Array.isArray(records)) then normalizeCollection(records) else normalizeSingle(records)


# PRIVATE SERIALIZE HELPER FUNCTIONS
serializeId = (hash)->
  hash.id = hash[primaryKey]
  delete hash[primaryKey]

  return hash


serializeSingle = (record)->
  serializeId(record)

serializeCollection = (records)->
  result = records.map (record)->
    return serializeSingle(record)

  return result



# PRIVATE NORMALIZE HELPER FUNCTIONS
normalizeId = (hash)->
  hash[primaryKey] = hash.id
  delete hash.id

  return hash


normalizeSingle = (record)->
  return normalizeId(record)

normalizeCollection = (records)->
  result = records.map (record)->
      return normalizeSingle(record)

  return result

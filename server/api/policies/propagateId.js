module.exports = function(model) {
  return function propagateId (req, res, next) {
    var id = req.param('id');
    if (id && req.body && req.body[model]) {
      req.body[model].id = id;
    }

    next();
  }
};

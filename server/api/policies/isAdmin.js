var Promise = require("../shortcuts/promise");

module.exports = function isAdmin (req, res, next) {
  var sessionUser = req.session.user;

  User.findOneById(sessionUser.id).then(function(user) {
    console.info("session:", req.session, "\nuser:", user, user.isAdmin);
    if (!user.isAdmin()) {
      res.status(403);
      res.send({
        errors: [{ code: "error.permissionDenied" }]
      });
    } else {
      next();
    }

  }).catch(Promise.OperationalError, function(err) {
    res.status(403);
    res.send({
      errors: [{ code: "error.userNotFound" }]
    });
  }).catch(function(err) {
    res.status(500);
    res.send({
      errors: [{ code: "error.unexpectedError" }]
    });
  });

};

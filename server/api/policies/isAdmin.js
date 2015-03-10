var Promise = require("../shortcuts/promise");

module.exports = function isAdmin (req, res, next) {
  var sessionUser = req.session.user;

  if (!sessionUser) {
    res.status(403);
    res.send({
      errors: [{ code: "error.noSessionUser" }]
    });

  } else {
    User.findOneById(sessionUser.id).then(function (user) {
      console.info("session:", req.session, "\nuser:", user, user.isAdmin);
      if (!user.isAdmin()) {
        res.status(403);
        res.send({
          errors: [{code: "error.permissionDenied"}]
        });
      } else {
        next();
      }

    }).catch(Promise.OperationalError, function (err) {
      res.status(403);
      res.send({
        errors: [{code: "error.unknownUser"}]
      });
    }).catch(function (err) {
      res.status(500);
      res.send({
        errors: [{code: "error.unexpectedError"}]
      });
    });
  }

};

var jwt = require('jsonwebtoken');
var _ = require('lodash');
var secret = 'RS#$09qu43f09qfj94qf*&H#(R';
var refreshSecret = 'rw5&&$$2224124f*&H#(R';
var bcrypt = require('bcrypt');

/**
 * AuthController
 */

module.exports = {
  login: function (req, res) {

    if (req.body.grant_type === 'password') {

      User.findOne({username: req.body.username}).then(function (user) {
        if (!user) {
          res.badRequest({
            errors: [{ code: "error.unknownUser" }]
          });
        } else {

          bcrypt.compare(req.body.password, user.password, function (err, result) {
            if (err || !result) {
              res.badRequest({
                errors: [{ code: "error.invalidPassword" }]
              });
            } else {
              req.session.user = user;
              issueToken(user, res);
            }
          });
        }
      }).catch(function(err) {
        res.badRequest({
          errors: [err]
        });
      });

    } else if (req.body.grant_type === 'refresh_token' && req.body.refresh_token) {

      if (req.headers && req.headers.authorization) {
        var parts = req.headers.authorization.split(' ');
        var token;

        if (parts.length == 2) {
          var scheme = parts[0],
            credentials = parts[1];

          if (/^Bearer$/i.test(scheme)) {
            token = credentials;

            var bearerToken = jwt.verify(token, secret);
            var refreshToken = jwt.verify(req.body.refresh_token, refreshSecret);

            if (_.isEqual(bearerToken, refreshToken)) {
              delete bearerToken.exp;
              delete bearerToken.iat;

              var user = bearerToken;
              issueToken(user, res);
              req.session.user = user;
            } else {
              res.badRequest({errors: [{ code: "error.tokenDoNotEqual" }]})
            }
          } else {
            res.badRequest({errors: [{ code: "error.badAuthorizationScheme" }]})
          }
        } else {
          res.badRequest({errors: [{ code: "error.badAuthorizationHeader" }]})
        }
      } else {
        res.badRequest({errors: [{ code: "error.missingAuthorizationHeader" }]})
      }

    } else {
      res.badRequest({errors: [{ code: "error.unknownGrantType" }]})
    }
  },

  logout: function (req, res) {
    req.logout();
    res.send({
      success: true,
      message: 'logoutSuccessful'
    });
  }
};

function issueToken(user, res) {
  var expirationTimeInMinutes = sails.config.auth.expirationInMinutes || 60 * 2;

  var token = jwt.sign(user, secret, {
    expiresInMinutes: expirationTimeInMinutes
  });

  var refreshToken = jwt.sign(user, refreshSecret, {
    expiresInMinutes: expirationTimeInMinutes
  });

  res.send({
    user: user,
    access_token: token,
    expires_in: expirationTimeInMinutes * 60, // because simple auth expects seconds
    refresh_token: refreshToken
  });
}

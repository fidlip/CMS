var Promise = require("../shortcuts/promise");

var bcrypt = require('bcrypt');

/**
 * User
 *
 * @module      :: Model
 * @description :: A short summary of how this model works and what it represents.
 * @docs		:: http://sailsjs.org/#!documentation/models
 */

module.exports = {

    attributes: {

        // Relationships
        posts: {
            collection: 'post',
            via: 'user'
        },
//	photos: {
//            collection: 'photo',
//            via: 'user'
//        },
//        albums: {
//            collection: 'album',
//            via: 'user'
//        },
//        statuses: {
//            collection: 'status',
//            via: 'user'
//        },

        // attributes
        firstName: 'string',
        lastName: 'string',
        username: {
            type: 'string',
            required: true,
            unique: true
        },
        email: {
          type: 'email' // Email type will get validated by the ORM
          //required: true,
          //unique: true
        },

        /**
         * User type
         * 0=regularuser
         * 1=editor
         * 2=redactor
         * 4=admin
         *
         * eg: admin && editor = 1 & 4 = 5
         **/
        userType: {
            type: 'integer',
            defaultsTo: 0
        },

        password: {
            type: 'string',
            required: true
        },

        tagline: {
            type: 'string'
        },


        isUser: function() {
            return this.userType && true;
        },
        isEditor: function() {
            return this.userType & 1 && true;
        },
        isRedactor: function() {
            return this.userType & 2 && true;
        },
        isAdmin: function() {
            return this.userType & 4 && true;
        },

        userAccess: function() {
          var ret = null;

          function addRole(curr, role) {
            if (!curr)
              curr = role;
            else
              curr += "&" + role;
          };

          if (this.isEditor())
            addRole(ret, "Editor");
          if (this.isRedactor())
            addRole(ret, "Redactor");
          if (this.isAdmin())
            addRole(ret, "Redactor");
          if (!ret)
            addRole(ret, "User");

          return ret;
        },
        toJSON: function() {
            var obj = this.toObject();
            // Remove the password object value
            delete obj.password;
            // return the new object without password
            return obj;
        }
    },
    beforeCreate: function(user, cb) {
        bcrypt.genSalt(10, function(err, salt) {
            bcrypt.hash(user.password, salt, function(err, hash) {
                if (err) {
                    console.log(err);
                    cb(err);
                } else {
                    user.password = hash;
                    cb(null, user);
                }
            });
        });
    },
    beforeValidate: function(user, cb) {
      User.findById(user.id).then(function(originalUser) {
        //ignore password and update all
        delete user.password;
        _.merge(originalUser, user);
        cb(null, originalUser);

      }).catch(Promise.OperationalError, function(err) {
        cb(err);
      }).catch(function(err) {
        cb(err);
      });

    }
};

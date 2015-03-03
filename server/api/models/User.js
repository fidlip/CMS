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
        firstName: 'STRING',
        lastName: 'STRING',
        username: {
            type: 'STRING',
            required: true,
            unique: true
        },
        email: {
          type: 'EMAIL' // Email type will get validated by the ORM
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
            type: 'INTEGER',
            defaultsTo: 0
        },

        password: {
            type: 'string',
            required: true
        },

        tagline: {
            type: 'string'
        },


        isAdmin: function() {
            return this.userType == 3;
        },
        userAccess: function() {
            switch (this.userType) {
                case 1:
                    return "Privlidged User";
                case 2:
                    return "Administrator";
                case 3:
                    return "Privlidged Administrator";
                default:
                    return "User";
            }
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
    }
};

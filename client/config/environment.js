/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
      modulePrefix: 'cms',
      podModulePrefix: 'cms/pods',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      defaultLocale: 'en'
    },

    'simple-auth': {
      serverTokenRevocationEndpoint: '/revoke'
    }
  };

  ENV['simple-auth'] = {
      authorizer: 'simple-auth-authorizer:oauth2-bearer'
  };
  ENV['simple-auth-oauth2'] = {
      refreshAccessTokens: true,
      serverTokenEndpoint: '/api/v1/auths/login',
      serverTokenRevocationEndpoint: '/api/v1/auths/logout',
  };


  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};

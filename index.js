(function() {
  var config, dotPath, fs;

  fs = require("fs");

  require("require-yaml");

  dotPath = "../../";

  config = null;

  module.exports = {
    getVariables: function(filename, envVar) {
      var baseDir, env, message;
      if (filename == null) {
        filename = "config";
      }
      if (envVar == null) {
        envVar = true;
      }
      if (config != null) {
        return config;
      }
      if (arguments.length === 1 && typeof filename === "boolean") {
        envVar = filename;
        filename = "config";
      }
      baseDir = __dirname + "/";
      if (fs.existsSync(baseDir + dotPath + filename + ".json")) {
        message = "Configurizer, loading " + filename + ".json";
        config = require(baseDir + dotPath + filename + ".json");
      } else if (fs.existsSync(baseDir + dotPath + filename + ".yaml")) {
        message = "Configurizer, loading " + filename + ".yaml";
        config = require(baseDir + dotPath + filename + ".yaml");
      }
      if (typeof process.env.NODE_ENV === "undefined") {
        message = message + " -- NO NODE_ENV SET -- ";
        return config;
      }
      if (envVar) {
        env = process.env.NODE_ENV;
        if (config.hasOwnProperty(env)) {
          return config[env];
        } else {
          return console.log("ERROR! Configurizer - please make sure that your config file has a property that " + "matches your NODE_ENV environment variable.");
        }
      } else {
        return config;
      }
    },
    setPath: function(path) {
      dotPath = path;
      return this;
    }
  };

}).call(this);

/*
//@ sourceMappingURL=index.js.map
*/
(function() {
  var dotPath, fs;

  fs = require("fs");

  require("require-yaml");

  dotPath = "../../";

  module.exports = {
    getVariables: function(filename, envVar) {
      var config, env, message;
      if (filename == null) {
        filename = "config";
      }
      if (envVar == null) {
        envVar = true;
      }
      message = "";
      if (arguments.length === 1 && typeof filename === "boolean") {
        console.log("boolean");
        envVar = filename;
        filename = "config";
      }
      if (fs.existsSync(dotPath + filename + ".json")) {
        message = "node-simple-config, loading " + filename + ".json";
        config = require(dotPath + filename + ".json");
      } else if (fs.existsSync(dotPath + filename + ".yaml")) {
        message = "node-simple-config, loading " + filename + ".yaml";
        config = require(dotPath + filename + ".yaml");
      }
      if (typeof process.env.NODE_ENV === "undefined") {
        message = message + " -- NO NODE_ENV SET -- ";
        console.log(message);
        return config;
      }
      if (envVar) {
        env = process.env.NODE_ENV;
        if (config.hasOwnProperty(env)) {
          console.log(message + " with " + env + " variables.");
          return config[env];
        } else {
          return console.log("ERROR! simple-node-config - please make sure that your config file has a property that " + "matches your NODE_ENV environment variable.");
        }
      } else {
        console.log(message + " with all variables.");
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
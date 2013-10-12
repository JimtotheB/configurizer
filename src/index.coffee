fs = require("fs")
require "require-yaml"
dotPath = "../../"
config = null
module.exports =

  getVariables: (filename="config", envVar=true) ->
    if config?
      return config
    if arguments.length is 1 and typeof filename is "boolean"
      envVar = filename
      filename = "config"

    baseDir = __dirname + "/"
    if fs.existsSync(baseDir + dotPath + filename + ".json")
      message = "Configurizer, loading " + filename + ".json"
      config = require(baseDir + dotPath + filename + ".json")

    else if fs.existsSync(baseDir + dotPath + filename + ".yaml")
      message = "Configurizer, loading " + filename + ".yaml"
      config = require(baseDir + dotPath + filename + ".yaml")

    if typeof (process.env.NODE_ENV) is "undefined"
      message = message + " -- NO NODE_ENV SET -- "
      return config

    if envVar
      env = process.env.NODE_ENV
      if config.hasOwnProperty(env)
        config[env]
      else
        console.log "ERROR! Configurizer - please make sure that your config file has a property that " + "matches your NODE_ENV environment variable."
    else
      config
  setPath: (path)->
    dotPath = path
    return @
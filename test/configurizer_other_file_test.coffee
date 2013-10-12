should = require "should"

describe "Module should load up other config files", ->
  describe "It loads up a custom config.json for all variables", ->
    process.env.NODE_ENV = 'development'
    config = require("../index.js").setPath("./test/yaml/").getVariables("other", false)

    it "NODE_ENV should equal --development--", ->
      process.env.NODE_ENV.should.eql "development"

    it "Config object should exist", ->
      config.should.exist

    it "Should have property --test-- ", ->
      console.log config
      config.should.have.property "a"

    it "With a value of --development--", ->
      config.a.should.eql "one"

    it "Should not have a value of --production--", ->
      config.c.should.not.eql true
should = require "should"

describe "Module should load up the correct variables for yaml", ->
  describe "It loads up the default config.yaml, with ALL DATA", ->
    process.env.NODE_ENV = 'development'
    config = require("../index.js").setPath("./test/yaml/").getVariables(false)

    it "NODE_ENV should equal --development--", ->
      process.env.NODE_ENV.should.eql "development"

    it "Config object should exist", ->
      config.should.exist

    it "Should have property --production-- ", ->
      config.should.have.property "production"

    it "Should have property --development-- ", ->
      config.should.have.property "development"
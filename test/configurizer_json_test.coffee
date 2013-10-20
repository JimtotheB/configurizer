should = require "should"

describe "Module should load up the correct variables for json", ->
  describe "It loads up the default config.json for NODE_ENV=development", ->
    process.env.NODE_ENV = 'development'
    config = require("../index.js").setPath("./test/json/").getVariables()

    it "NODE_ENV should equal --development--", ->
      process.env.NODE_ENV.should.eql "development"

    it "Config object should exist", ->
      config.should.exist

    it "Should have property --test-- ", ->
      config.should.have.property "test"

    it "With a value of --development--", ->
      config.test.should.eql "development"

    it "Should not have a value of --production--", ->
      config.test.should.not.eql "production"

#  describe "It loads up the default config.json, with ALL DATA", ->
#    config = require("../index.js").setPath("./test/json/").getVariables(false)
#
#    it "NODE_ENV should equal --development--", ->
#      process.env.NODE_ENV.should.eql "development"
#
#    it "Config object should exist", ->
#      config.should.exist
#
#    it "Should have property --production-- ", ->
#      config.should.have.property "production"
#
#    it "Should have property --development-- ", ->
#      config.should.have.property "development"
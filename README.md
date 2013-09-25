#Configurizer [![Build Status](https://travis-ci.org/PaperElectron/configurizer.png?branch=master)](https://travis-ci.org/PaperElectron/configurizer)
####only does one thing, 
####...loads a .yaml or .json file in the same directory as /node_modules.
######not_configurizer = require("../../../../../some.json")
######configurizer = require("configurizer").getVariables()

##Install.
```bash
$ npm install configurizer --save

#testing
$ cd ./node_modules/configurizer && make test
```
##Require it anywhere,
in your application you need access to your configs. Without worrying about the path.
It accepts some parameters on creation. By default it looks for config.yaml/json.

```javascript
  //default - loads config.yaml/json and returns an object based on your NODE_ENV variable
  var conf = require("configurizer").getVariables() 
  
  //If you want to use a custom filename just pass it in as a string.
  //loads myCustomFile.yaml/json and returns an object based on your NODE_ENV variable
  var conf = require("configurizer").getVariables("myCustomFile") 
  
  //If you need a custom filename AND want all of the variables in the file.
  //loads myCustomFile.yaml/json and returns all the variables in the file
  var conf = require("configurizer").getVariables("myCustomFile" , false) 
  
  //If you want all of the variables in the file just pass in false.
  //loads config.yaml/json and returns an object with ALL of your variables.
  var conf = require("configurizer").getVariables(false)
```

##Require it as many times as you want. 
Have some other config file you want access too? Just require it again with a distinct variable.
```javascript
  config = require("configurizer").getVariables() //gives you ENV dependant object
  otherConfig = require("configurizer").getVariables("otherConfig",false) //gives entire object
  //you can setup a separate path if needed
  otherConfig = require("configurizer").setPath("../../").getVariables("otherConfig")
```

##If you need to change the path to your config file.
Remember to start from this modules directory and work up the the root, then down to
wherever your config is located.

```javascript
  config = require("configurizer").setPath("../../").getVariables()
```

##Variables to match your NODE_ENV 
you will need a config.yaml/json with whatever NODE_ENV variables you plan on using.

```bash
#start your server in production mode and configurizer will return the production object.
$ NODE_ENV=production node server.js
```
```javascript
var conf = require("configurizer").getVariables()
console.log(conf.someAPIkey)
->"skjhas08n3e0-"
```
```yaml
#config.yaml
  ---
  production:
    siteName: "MySite"
    someAPIkey: "skjhas08n3e0-"
    mongodb:
      username: "derp"
      password: "8YaMxyzUez"
      port: 12345
  development:
    siteName: "MySite-dev"
    mongodb:
      username: "derp"
      password: "hunter2"
      port: 12345
  whateverYouWant:
    siteName: "I think I broke something"
    mongodb:
      username: "derp"
      password: ""
      port: 12345
```

```javascript
//I much prefer yaml, but you can use JSON if you want...
{
  "production":
    {
      "siteName": "Communicator",
      "someAPIkey": "skjhas08n3e0-",
      "mongodb":
        {
          "username": "derp",
          "password": "8YaMxyzUez",
          "port": 12345
        }
    },
  "development":
  {
    "siteName": "Communicator-test",
    "mongodb":
      {
        "username": "derp",
        "password": "hunter2",
        "port": 12345
      }
  },
  "whatEverYouWant":
  {
    "siteName": "I think I broke something",
    "mongodb":
    {
      "username": "derp",
      "password": "",
      "port": 12345
    }
  }
}
```

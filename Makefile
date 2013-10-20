json:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_json_test.coffee
json-all:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_json_all_test.coffee
yaml:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_yaml_test.coffee
yaml-all:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_yaml_all_test.coffee
other:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_other_file_test.coffee


test: json json-all yaml yaml-all other
.PHONY: test
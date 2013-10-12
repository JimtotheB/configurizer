json:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_json_test.coffee
yaml:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_yaml_test.coffee
other:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script test/configurizer_other_file_test.coffee


test: json yaml other
.PHONY: test
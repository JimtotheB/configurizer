test:
	@./node_modules/.bin/mocha \
		--ui bdd --reporter spec --compilers coffee:coffee-script

.PHONY: test
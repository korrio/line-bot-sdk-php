COMPOSER_BIN = ./vendor/bin

test:
	$(COMPOSER_BIN)/phpunit ./tests

doc:
	yes yes | $(COMPOSER_BIN)/apigen generate --source=./src --destination=./docs --title line-bot-sdk-php

phpcs:
	$(COMPOSER_BIN)/phpcs --standard=PSR2 src/ examples/SendingSample/ examples/EchoBot/src examples/EchoBot/public

phpmd:
	$(COMPOSER_BIN)/phpmd ./src text cleancode,codesize,controversial,design,unusedcode,naming | grep -v 'Avoid using static access to class'
	$(COMPOSER_BIN)/phpmd ./examples/SendingSample text cleancode,codesize,controversial,design,unusedcode,naming | grep -v 'Avoid using static access to class'
	$(COMPOSER_BIN)/phpmd ./examples/EchoBot/src text cleancode,codesize,controversial,design,unusedcode,naming | grep -v 'Avoid using static access to class'
	$(COMPOSER_BIN)/phpmd ./examples/EchoBot/public text cleancode,codesize,controversial,design,unusedcode,naming | grep -v 'Avoid using static access to class'

check: test phpcs phpmd


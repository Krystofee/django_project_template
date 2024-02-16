run:
	@poetry run python manage.py runserver_plus

mm:
	@poetry run python manage.py makemigrations

mi:
	@poetry run python manage.py migrate

shell:
	@poetry run python manage.py shell_plus

i:
	@poetry install

# If the first argument is "a"...
ifeq (a,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "a"
  A_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  # ...and turn them into do-nothing targets
  $(eval $(A_ARGS):;@:)
endif

a:
	@poetry add $(A_ARGS)

su:
	@poetry run python manage.py createsuperuser

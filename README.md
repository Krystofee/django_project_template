My custom django project template.

```bash
# Download the script
curl -o create-django-project.sh [[URL]](https://raw.githubusercontent.com/Krystofee/django_project_template/master/setup.sh)

# Make the script executable
chmod +x create-django-project.sh

# Run the script interactively
./create-django-project.sh
```

Preinstalled:
- django extensions
- django browser reload
- django debug toolbar
- django htmx
- tailwind CDN

Templates are set up to use base templates from root templates directory but also uses templates inside each app. Also uses form renderer to easily override Django default widgets.

#!/usr/bin/env bash

# The new project name is the first argument
read -p "Enter the new project name: " new_name

# Clone the project template
git clone --depth=1 https://github.com/Krystofee/django_project_template.git $new_name

cd $new_name

echo "Setup new git repository"
rm -rf .git && git init

cd src

# Set the old project name
old_name="project_name"

# Determine OS type for sed command compatibility
case "$(uname -s)" in
    Darwin)
        sed_i_command="sed -i ''"
        ;;
    *)
        sed_i_command="sed -i"
        ;;
esac

# Determine OS type and apply appropriate sed command
case "$(uname -s)" in
    Darwin)
        find . -type f \( -iname "*.py" -o -iname "*.html" -o -iname "*.txt" -o -iname "*.json" \) ! -path "./.git/*" -exec sed -i '' -e "s/$old_name/$new_name/g" {} +
        ;;
    *)
        find . -type f \( -iname "*.py" -o -iname "*.html" -o -iname "*.txt" -o -iname "*.json" \) ! -path "./.git/*" -exec sed -i -e "s/$old_name/$new_name/g" {} +
        ;;
esac

rm -rf $new_name
mv $old_name $new_name

echo "Project name refactored from $old_name to $new_name."

echo "Installing packages"
make i

echo "Creating superuser"
poetry run python manage.py create_admin_superuser

echo "Migrating"
make mi

echo "Install precommit"
pre-commit install

echo "Create initial commit"
git add .
git commit -m "Initial commit"

echo "Done... To run the project, run "
echo ""
echo "  make run"
echo ""

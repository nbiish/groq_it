#!/bin/bash

# EXAMPLE USAGE:
# ./groq_it.sh 'from * as allArticles[0...10] {title, body}'
# ./groq_it.sh "Who are the Anishinabe?"


# Check if the venv directory exists
if [ ! -d "venv" ]
then
    # Create a Python virtual environment
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Check if the requirements are installed
python -c "
import pkg_resources
requirements = [str(i) for i in pkg_resources.parse_requirements(open('requirements.txt'))]
installed = {pkg.key for pkg in pkg_resources.working_set}
missing = set(requirements) - installed
if missing:
    exit(1)
"

# If the previous command exited with 1, install the requirements
if [ $? -eq 1 ]
then
    pip install -r requirements.txt > /dev/null 2>&1
fi

# Run the Python script with the first argument passed to the bash script
result=$(python3 groq_query.py "$1")

# Print the result
echo $result

# Deactivate the virtual environment
deactivate
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



# Check if any arguments were passed
if [ $# -gt 0 ]
then
    # Pass the argument to the Python script
    result=$(python3 groq_query.py "$1")
    echo $result > output.txt  
    cat output.txt
else
    # Check if the input file exists
    if [ -f "input.txt" ]
    then
        # Pass the content of the file to the Python script
        result=$(python3 groq_query.py "$(cat input.txt)")
        echo $result > output.txt
        cat output.txt
    else
        echo "No arguments passed and input.txt does not exist."
        exit 1
    fi
fi


echo $1 > input.txt

# Deactivate the virtual environment
deactivate
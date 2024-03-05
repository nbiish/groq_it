# Groq Query Runner

This repository contains scripts for querying the Groq API. It is designed to be used with Mac shortcuts for ease of use.

## Overview

The main components of this repository are:

- `groq_query.py`: This Python script sends a text query to the Groq API and outputs the response.
- `groq_query.sh`: This Bash script is used to run the Python script.

## Usage

1. The script will automatically create a virtual environment and install the necessary Python dependencies. No manual installation is required.
2. Set up your environment variables in the `.env` file. You will need to provide your Groq API key here.
3. Use Mac shortcuts to run the `groq_query.sh` script. This will in turn run the `groq_query.py` script with the provided input.

Please refer to the individual scripts for more detailed usage instructions.
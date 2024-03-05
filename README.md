# Groq Query Runner

This repository contains scripts for querying the Groq API.  
It's designed to be used with Mac or Windows shortcuts for quick use.

## Setting Up Mac Shortcut Automations with Shell Script

To set up Mac shortcuts for running the `groq_query.sh` script, follow these steps:

1. Open Automator on your Mac (you can find it in your Applications folder or search for it in Spotlight).
2. Click on `New Document` and select `Quick Action`.
3. In the workflow input dropdown, select `no input` in `any application`.
4. Search for `Run Shell Script` in the actions panel on the left and drag it to the workflow area.
5. In the `Run Shell Script` box, type the full path to your `groq_query.sh` script. For example, `/Users/YOU/SOME_DIRECTORY/groq_it/groq_query.sh`.
6. Save the workflow with a name you'll remember.
7. Go to `System Preferences > Keyboard > Shortcuts > Services`. Find the name of the workflow you just saved under `General` or `Text`.
8. Click on the `add shortcut` button and press the keys you want to use as your shortcut.

Now, whenever you use this shortcut, your Mac will run the `groq_query.sh` script.


## Overview

The main components:

- `groq_query.py`: sends a text query to the Groq API and outputs the response
- `groq_query.sh`: is used to run the Python script

## Usage

1. Automatically creates a virtual environment and installs the necessary Python dependencies.
2. Add your Groq api key in the `.env` file.
3. Use Mac shortcuts to run the `groq_query.sh` script. This will run the `groq_query.py` script.

Please refer to the individual scripts for more detailed usage instructions.
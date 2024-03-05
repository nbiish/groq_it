# Description:
# send text to the groq api and output the response
#
# INPUT:
# string from bash script
#
# OUTPUT:
# string from groq JSON response
#
# EXAMPLE:
# python3 groq_query.py "Who are the Anishinaabe?"


import os
from groq import Groq
from dotenv import load_dotenv
load_dotenv()

def query_groq(input_string):
    # Create a client with the API key from the environment variable
    client = Groq(
        api_key=os.environ.get("GROQ_API_KEY"),
    )
    # Create a query using the `create` method to send json data to the API
    chat_completion = client.chat.completions.create(
        messages=[
            {
                "role": "user",
                "content": input_string,
            }
        ],
        model="mixtral-8x7b-32768",
    )

    return chat_completion.choices[0].message.content

if __name__ == "__main__":
    print(query_groq("Who are the Anishinaabe?"))
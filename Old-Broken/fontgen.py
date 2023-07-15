import requests
from bs4 import BeautifulSoup
import os

def generate_html(font_name, font_category):
    # Get font details from Google Fonts
    url = f"https://fonts.googleapis.com/css?family={font_name.replace(' ', '+')}&category={font_category.lower()}"
    response = requests.get(url)
    font_data = response.text

    # Extract the font URL from the CSS
    font_url_start = font_data.index("url(") + len("url(")
    font_url_end = font_data.index(")", font_url_start)
    font_url = font_data[font_url_start:font_url_end].strip("'")

    # Create the HTML page
    html = f'''
    <!DOCTYPE html>
    <html>
    <head>
        <link href="../stylesheet.css" rel="stylesheet">
        <style>
            body {{
                font-family: "{font_name}", sans-serif;
            }}
            h1, h2, h3 {{
                font-family: "{font_name}", sans-serif;
            }}
        </style>
    </head>
    <body>
        <h1>Sample Heading 1</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque convallis fringilla erat a laoreet.</p>
        <h2>Sample Heading 2</h2>
        <p>Sed maximus nisi sit amet lectus lacinia tristique. Curabitur non turpis consectetur, vestibulum justo nec, lacinia arcu.</p>
        <h3>Sample Heading 3</h3>
        <p>Maecenas semper neque mauris, at condimentum libero tincidunt vitae. Nulla facilisi. In id magna nec erat interdum efficitur.</p>
    </body>
    </html>
    '''

    return html

def update_index_html(font_name, font_category):
    # Read the existing index.html file
    with open("index.html", "r") as file:
        content = file.read()

    # Append the new font entry to the appropriate category section
    new_entry = f'<li><a href="samples/{font_name.replace(" ", "_").lower()}_sample.html">{font_name}</a> ({font_category})</li>'
    category_start = content.index(f"<!-- {font_category} Fonts -->")
    category_end = content.index(f"<!-- /{font_category} Fonts -->") + len(f"<!-- /{font_category} Fonts -->")
    updated_content = content[:category_end] + f"\n        {new_entry}" + content[category_end:]

    # Write the updated index.html file
    with open("index.html", "w") as file:
        file.write(updated_content)

# Ask for the font name
font_name = input("Enter the name of the font from Google Fonts: ")

# Ask for the font category
font_categories = {
    "1": "Serif",
    "2": "Sans Serif",
    "3": "Script",
    "4": "Monospaced",
    "5": "Display"
}

print("Select a font category:")
for key, category in font_categories.items():
    print(f"{key}. {category}")

font_category_key = input("Enter the number corresponding to the font category: ")
font_category = font_categories.get(font_category_key)

if not font_category:
    print("Invalid font category. Exiting the script.")
    exit()

# Generate the HTML page
html_page = generate_html(font_name, font_category)

# Save the HTML page to a file in the 'samples' folder
folder_path = "samples"
os.makedirs(folder_path, exist_ok=True)
file_name = f"{font_name.replace(' ', '_').lower()}_sample.html"
file_path = os.path.join(folder_path, file_name)
with open(file_path, "w") as file:
    file.write(html_page)

print(f"HTML page generated successfully. Saved as '{file_path}'.")

# Update the index.html file
update_index_html(font_name, font_category)

print("index.html file updated successfully.")

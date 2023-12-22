from bs4 import BeautifulSoup
import pyperclip
import os

def fetch_html(file_path):
    with open(file_path, 'r') as file:
        return file.read()

def extract_links(html_content):
    soup = BeautifulSoup(html_content, 'html.parser')
    links = [a['href'] for a in soup.find_all('a', href=True)]
    return links

def filter_links(links):
    filtered_links = set()
    for link in links:
        if 'facebook.com' in link and not any(x in link for x in ['photo', 'friends', 'mutual']):
            filtered_links.add(link)
    return sorted(list(filtered_links))

def write_to_file(links, base_filename):
    i = 0
    while True:
        filename = f"{base_filename}{i if i > 0 else ''}.txt"
        if not os.path.exists(filename):
            break
        i += 1

    with open(filename, 'w') as file:
        file.write('\n'.join(links))

    return filename

file_path = 'toscrape.html'
html_content = fetch_html(file_path)
links = extract_links(html_content)
filtered_links = filter_links(links)
filename = write_to_file(filtered_links, 'scrape')
pyperclip.copy('\n'.join(filtered_links))
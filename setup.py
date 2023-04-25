import requests

url = "https://www.dnd5eapi.co/api/classes/bard"

payload = ""
response = requests.request("GET", url, data=payload)

print(response.text)
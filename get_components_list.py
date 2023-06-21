import requests
import json
from getpass import getpass
import pprint
import re

pp = pprint.pprint

response_nexus = requests.get("http://prod-lnx-1:8081/service/rest/v1/repositorySettings", auth=('admin', 'admin'))

# user = input("Enter username: ")
# password = getpass("Enter password:")
base_url = "http://prod-lnx-1:8081/service/rest/v1/components?repository="

for i in json.loads(response_nexus.text): #i=str json=list response_nexus.text=str
    r = requests.get(base_url+i["name"], auth=('admin', 'admin'))
    resp=json.loads(r.text)
    #print(resp['items'])#[0]['assets'][0]['path']
    for item in resp['items']: #x=str json=dict r.text=str
        for asset in item['assets']:
            path = asset['path']
            # patter = re.search(r"/[\w\d\.-_]+$", path)
            # patter = re.search(r".*\/", path)
            output = path.split('/')[-1]
            print(output)
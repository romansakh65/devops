import argparse
import json
from pprint import pprint as pp
import re
import requests

def parsing(parser):
    parser.add_argument('--input_json', help='Path to json file with repos')
    parser.add_argument('--credentials',
                        help='Path to json file with jenkins credentials')

def get_assets_from_nexus(nexus_repo):

    #Get assets from nexus via API from specific repos (nexus_repo) with continuation token
    nexus_assets = set()
    data = []
    base_url = 'https://nexus/service/rest/v1/search/assets?sort=version&repository='+nexus_repo  # pylint: disable=line-too-long
    continuationtoken = None
    while True:
        if continuationtoken is not None:
            base_url = f"{base_url}&continuationToken={continuationtoken}"
        resp = requests.get(base_url).json()
        data += resp['items']
        continuationtoken = resp.get('continuationToken')
        if continuationtoken is None:
            break
    for item in data:
        nexus_assets.add(item['path'].rsplit('/', 1)[0])
    return nexus_assets

def get_jobs_from_jenkins(jenkins_repo, credentials):

    # Get jobs from jenkins via API from specific repos (jenkins_repo)
    jenkins_jobs = set()
    with open (credentials, 'r') as fp:
        credentials = json.load(fp)
    username = credentials['username']
    token = credentials['password']
    resp = requests.get('https://jenkins/job/'+jenkins_repo+'/api/json',
                        auth=(username, token))
    del credentials
    del username
    del token
    data = json.loads(resp.text)
    for x in data['jobs']:
        jenkins_jobs.add(re.sub(r'%2F', '/', x['name']))
    return jenkins_jobs

def find_the_difference(credentials, nexus_repo, jenkins_repo):

    # Get dicts from nexus and jenkins and return difference
    nexus_repo = get_assets_from_nexus(nexus_repo)
    jenkins_jobs = get_jobs_from_jenkins(jenkins_repo, credentials)
    difference = nexus_repo.difference(jenkins_jobs)
    return difference

def main(input_json, credentials):

    # Print set difference
    with open (input_json, 'r') as fp:
        load_repo = json.load(fp)

    for jenkins_repo, nexus_repo in load_repo:
        print(f"{jenkins_repo}/{nexus_repo}")
        output = find_the_difference(
            nexus_repo=nexus_repo,
            jenkins_repo=jenkins_repo,
            credentials=credentials,
            )
        pp(output)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parsing(parser)
    args = parser.parse_args()
    main(args.input_json, args.credentials)

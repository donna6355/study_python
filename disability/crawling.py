import requests
from datetime import datetime
import csv

headers = {"User-Agent": "my_crawler/1.0"}
after= None
csvList = []
keywords = ["wheelchair accessible", "power wheelchair battery", "wheelchair on bus","wheelchair repair", "wheelchair cushion pressure sore", "wheelchair lift", "wheelchair accessible van", "wheelchair accessible hotel", "wheelchair accessible restaurant", "wheelchair prescription","wheelchair elderly", "wheelchair transfer", "wheelchair caregiver"]
go = True
sub = 'disability'

def fetch_posts(keyword):
  global after
  # url = f"https://www.reddit.com//search.json?q={keyword}&limit=100"
  url = f"https://www.reddit.com/r/{sub}/search.json?q={keyword}&limit=100&sort=new"
  if(after != None):
    url += f"&after={after}"
  res = requests.get(url, headers=headers)
  data = res.json()
  after = data['data']['after']
  print('after is', after)
  if(after == None):
    global go
    go = False
  postsList = data['data']['children']
  for post in postsList:
    if(post['data']['created'] < 1578000000):
      continue
    try:
      csvList.append({"title":post['data']['title'],"content": post['data']['selftext'],"created":datetime.fromtimestamp( post['data']['created'])})
    except :       
      print(f"Error processing post")
  print(f"Fetched {len(postsList)} posts, total so far: {len(csvList)}")
  if( len(csvList) > 0):
    with open(f'{sub}_{keyword}.csv', 'w', newline='') as output_file:
        dict_writer = csv.DictWriter(output_file, fieldnames=csvList[0].keys())
        dict_writer.writeheader()  # Write column names
        dict_writer.writerows(csvList) # Write all rows at once

  print(f"Saved {len(csvList)} posts to {sub}_{keyword}.csv")

for keyword in keywords:
  print(f"Fetching posts for keyword: {keyword}")
  go = True
  csvList = []
  while go:
    fetch_posts(keyword)
    if len(csvList) >= 1000:
      print(f"Reached 1000 posts for keyword: {keyword}, moving to next keyword.")
      break
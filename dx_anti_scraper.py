import requests
from bs4 import BeautifulSoup

def scrape_naver_kin(keyword):
    """
    Scrapes Naver Kin search results for a given keyword.
    """
    base_url = "https://kin.naver.com/search/list.naver"
    params = {
        'query': keyword
    }
    headers = {
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36'
    }

    try:
        response = requests.get(base_url, params=params, headers=headers)
        response.raise_for_status() # Raise an exception for bad status codes

        soup = BeautifulSoup(response.text, 'html.parser')

        # Selectors based on browser analysis
        # Titles and Links: a._searchListTitleAnchor
        # Summaries: ul.basic1 > li > dl > dd:nth-of-type(2)

        results = []
        
        # The structure is a list of items. It's safer to iterate over the list items to keep title and summary together.
        list_items = soup.select('ul.basic1 > li')

        for item in list_items:
            title_tag = item.select_one('a._searchListTitleAnchor')
            summary_tag = item.select_one('dl > dd:nth-of-type(2)')
            
            if title_tag:
                title = title_tag.get_text(strip=True)
                link = title_tag['href']
                summary = summary_tag.get_text(strip=True) if summary_tag else "No summary available"
                
                results.append({
                    'title': title,
                    'link': link,
                    'summary': summary
                })

        return results

    except requests.exceptions.RequestException as e:
        print(f"Error during request: {e}")
        return []

if __name__ == "__main__":
    keyword = "cat"
    print(f"Scraping results for '{keyword}'...")
    data = scrape_naver_kin(keyword)

    if data:
        print(f"Found {len(data)} results:")
        for i, item in enumerate(data, 1):
            print(f"{i}. {item['title']}")
            print(f"   Link: {item['link']}")
            print(f"   Summary: {item['summary']}")
            print("-" * 50)
    else:
        print("No results found.")
 
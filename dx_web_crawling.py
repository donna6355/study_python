import requests
import pandas as pd

KAKAO_KEY = "c9b0f7efa433da27b0be4a588c648a7e"
KAKAO_SEARCH_URL = "https://dapi.kakao.com/v2/search/web?query={}"

headers = {"Authorization": f"KakaoAK {KAKAO_KEY}"}

res = requests.get(KAKAO_SEARCH_URL.format("고양이"), headers=headers)
# print(res.json())
data = res.json()
df = pd.DataFrame(data["documents"])

print(df)

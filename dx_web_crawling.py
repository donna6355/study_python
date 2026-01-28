import requests
import pandas as pd

KAKAO_KEY = "c9b0f7efa433da27b0be4a588c648a7e"
KAKAO_SEARCH_URL = "https://dapi.kakao.com/v2/search/web?query={}"


CRIME_FILE = "./data/crime_in_Seoul.csv"

headers = {"Authorization": f"KakaoAK {KAKAO_KEY}"}

# res = requests.get(KAKAO_SEARCH_URL.format("고양이"), headers=headers)
# # print(res.json())
# data = res.json()
# df = pd.DataFrame(data["documents"])

# print(df)


df_crime_police = pd.read_csv(CRIME_FILE, encoding="euc-kr", thousands=",")
# print(df_crime_police.info())

st_names = [f"서울{loc[:-1]}경찰서" for loc in df_crime_police["관서명"]]
# print(st_names)


def fetch_add(loc):
    try:
        res = requests.get(
            f"https://dapi.kakao.com/v2/local/search/keyword.json?query={loc}",
            headers=headers,
        )
        data = res.json()
        addr = data["documents"][0]["address_name"]
        return addr.split()[1]
    except:
        print("failed to fetch", loc)


st_address = [fetch_add(loc) for loc in st_names]
# print(st_address)

df_crime_police["구별"] = st_address
# print(df_crime_police)

crime = pd.pivot_table(df_crime_police, index="구별", aggfunc="sum")
crime = crime.drop("관서명", axis=1)
print(crime)

import pandas as pd
import json

JSON_PATH = "data/seoul_municipalities_geo_simple.json"
FILE_PATH = "data/seoul_biz_info.csv"
df = pd.read_csv(FILE_PATH)
# print(df)

# print(df.info())

cafe = df.query('상권업종소분류명 == "카페"')
# print(cafe.info())
ediya = cafe.loc[cafe["상호명"].str.contains("이디야")]
# print(ediya.head())
twosome = cafe.loc[cafe["상호명"].str.contains("투썸플레이스")]
# print(twosome.head())


### 구별로 카페 매장 개수 세기
ediya_count = ediya.groupby("시군구명")["상호명"].count().to_frame()
# ediya_count = ediya.groupby("시군구명")["상호명"].count() => SERIES RETURN!!!
# use either to_frame or double brackets
# ediya_count = ediya.groupby("시군구명")[["상호명"]].count()
ediya_count = ediya_count.rename(columns={"상호명": "count"})
ediya_count = ediya_count.sort_values("count", ascending=False)
ediya_count = ediya_count.reset_index()
# print(ediya_count)
#       count
# 시군구명
# 영등포구     38
# 송파구      35
# 강남구      33
# 마포구      30
# 성북구      29
# 종로구      29
# 강서구      29
# 구로구      28
# 중구       28
# 관악구      26
# 중랑구      25
# 은평구      24
# 서초구      24
# 동대문구     23
# 양천구      23
# 노원구      23
# 강동구      22
# 광진구      22
# 도봉구      22
# 동작구      21
# 금천구      19
# 성동구      18
# 서대문구     17
# 강북구      17
# 용산구      13


twosome_count = twosome.groupby("시군구명")[["상호명"]].count()
twosome_count = twosome_count.rename(columns={"상호명": "count"})
twosome_count = twosome_count.sort_values("count", ascending=False)
twosome_count = twosome_count.reset_index()
# print(twosome_count)
#     시군구명  count
# 0    강남구     37
# 1     중구     30
# 2    송파구     26
# 3    서초구     24
# 4    마포구     23
# 5    강서구     16
# 6   영등포구     14
# 7    성동구     12
# 8    구로구     10
# 9    금천구     10
# 10   종로구     10
# 11   강동구     10
# 12  서대문구     10
# 13   성북구      9
# 14   광진구      9
# 15   노원구      9
# 16   관악구      8
# 17   양천구      8
# 18   중랑구      8
# 19  동대문구      6
# 20   강북구      6
# 21   도봉구      5
# 22   용산구      4
# 23   은평구      4
# 24   동작구      3

# geo_json = json.load(open(JSON_PATH))
# print(geo_json)

ediya_twosome = ediya_count.merge(
    twosome_count, on="시군구명", suffixes=["_이디야", "_투썸"]
)
# print(ediya_twosome)

ediya_twosome["이디야_ratio"] = (
    ediya_twosome["count_이디야"] / ediya_twosome["count_이디야"].sum()
)
ediya_twosome["투썸_ratio"] = (
    ediya_twosome["count_투썸"] / ediya_twosome["count_투썸"].sum()
)

ediya_twosome["투썸_상대적_비율"] = (
    ediya_twosome["투썸_ratio"] / ediya_twosome["이디야_ratio"]
)
print(ediya_twosome)

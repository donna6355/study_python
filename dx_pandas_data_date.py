import pandas as pd

df = pd.read_csv("./data/temperatures.csv")

# print(df.info())

# 시계영 데이터

df["Date1"] = pd.to_datetime(df["Date"], format="%Y-%m-%d")
# print(df.info())
# print(df.head())


sample = df["Date1"].dt.strftime("%Y년%m월")
# print(sample)

sample = df["year"] = df["Date1"].dt.year
# print(sample)

sample = df["month"] = df["Date1"].dt.month
# print(sample)
sample = df["day"] = df["Date1"].dt.day
# print(sample)

sample = df["dow"] = df["Date1"].dt.dayofweek
# print(sample)  # 월요일 0 ~ 일요일 6

sample = df["dowName"] = df["Date1"].dt.day_name()
# print(sample)


df["plus_one"] = df["Date1"] + pd.Timedelta(days=1)
# print(df.head())

df["minus_oneM"] = df["Date1"] - pd.DateOffset(months=1)
# print(df.head())

rg = pd.date_range(start="2026-01-01", periods=30, freq="D")
# print(rg)

rg = pd.date_range(start="2026-01-01", periods=10, freq="W")
# print(rg)

rg = pd.date_range(start="2026-01-01", end="2026-06-01", freq="D")
# print(rg)

rg = pd.date_range(
    start="2026-01-01", end="2026-06-01", freq="MS"
)  # Month End, Month Start
# print(rg)

rg = pd.date_range(start="2026-01-01", end="2035-06-01", freq="YE")
# print(rg)


# 기간 이동 계산
# rolling
# ma = moving average => trend를 그려내는데 사용
df["ma7"] = df["Temp"].rolling(7).mean()
# print(df.head(15))

# 행 이동 row shift
df["time_shift1"] = df["Temp"].shift(1)
print(df.head(15))

# 오늘 날짜와 어제 날짜의 온도 변화율 구하기
# 비율 = 비교대상(기준 - 비교값) / 기준 *100
# 뺄셈 : 변화, 덧셈 : 합
df["diff"] = (df["Temp"] - df["time_shift1"]) / df["Temp"] * 100
print(df.head(15))

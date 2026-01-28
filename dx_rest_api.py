import requests
import pandas as pd

KOSPI_URL = (
    "https://api.stock.naver.com/chart/domestic/index/KOSPI?periodType=dayCandle"
)

res = requests.get(KOSPI_URL)
kospi_df = pd.DataFrame(res.json()["priceInfos"])

KOSDAQ_URL = (
    "https://api.stock.naver.com/chart/domestic/index/KOSDAQ?periodType=dayCandle"
)
daq_res = requests.get(KOSDAQ_URL)
kosdaq_df = pd.DataFrame(daq_res.json()["priceInfos"])

USD_URL = "https://m.stock.naver.com/front-api/chart/pricesByPeriod?reutersCode=FX_USDKRW&category=exchange&chartInfoType=marketindex&scriptChartType=areaYear"
usd_res = requests.get(USD_URL)
usd_df = pd.DataFrame(usd_res.json()["result"]["priceInfos"])
print(usd_df)

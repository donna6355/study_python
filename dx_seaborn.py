import pandas as pd
import numpy as np

import matplotlib.pyplot as plt
import seaborn as sns

# seaborn에서 기본적으로 제공하는 샘플 데이터 세트 가져오기
tips = sns.load_dataset("tips")

# print(tips.head())

# 요일 별 식사한 테이블의 개수를 시각화
#   - 일요일에는 몇 테이블이 식사했고, 월요일에는 몇 테이블이 식사했고
# pure matplotlib way
df_by_day_count = tips.groupby("day")["total_bill"].count()
# print(df_by_day_count)
# plt.bar(df_by_day_count.index, df_by_day_count)
# plt.show()

# seaborn을 활용하면??
sns.countplot(data=tips, x="day")
plt.show()

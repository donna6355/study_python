import plotly.express as px
import matplotlib.pyplot as plt
import seaborn as sns

import pandas as pd

# 예제 데이터 세트 불러오기
df = sns.load_dataset("penguins")
df_group = df.groupby("species")[["body_mass_g"]].mean().reset_index()
df_group

# Seaborn으로 시각화
# sns.barplot(data=df_group, x="species", y="body_mass_g")
# plt.show()

# Plotly
fig = px.bar(data_frame=df_group, x="species", y="body_mass_g")
fig.show()
# html json file

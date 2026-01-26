import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv("./data/event_log.csv")
# print(df.head())

# check nan value
# print(df.isna().sum())

# price = df[["price"]].describe()
# print(price)


# plt.boxplot(df["price"])
# plt.show()


# # IQG = Q3 - Q1
# q1 = df["price"].quantile(0.25)
# q3 = df["price"].quantile(0.75)
# print(q1)
# print(q3)

# # ideal price range based on the whole data set
# iqr = q3 - q1
# print(iqr)

# sns.displot(df["price"], kde=True, rug=True)
# plt.show()


# # add upper risker and lower risker (1.5)
# q1_min_range = q1 - (iqr * 1.5)
# q3_max_range = q3 + (iqr * 1.5)
# print(q1_min_range)  # possible price set to 0
# print(q3_max_range)

# # histogram from the processed data
# mask = (df["price"] >= q1_min_range) & (df["price"] <= q3_max_range)
# masked_price = df.loc[mask]
# sns.displot(masked_price["price"], kde=True, rug=True)
# plt.show()


############## DAU #################
df["event_date"] = pd.to_datetime(df["event_time"]).dt.normalize()
# print(df.head())

# print(df.sort_values(by="event_date"))

# better to use only Oct to Feb data
drop_mask = df["event_date"] > "2020-09-30"
df = df.loc[drop_mask]

# print(df)


dau_data = df.groupby("event_date")["user_id"].nunique()
# print(dau_data.head())

dau_data = dau_data.reset_index()
dau_data = dau_data.rename(columns={"user_id": "user_count"})
# print(dau_data.head())

# sns.lineplot(data=dau_data, x="event_date", y="user_count")
# plt.show()


############## WAU #################
df["event_week"] = df["event_date"].dt.strftime("%Y-w%U")
print(df.head())

# check if every week has valid data
wau_data = df.groupby("event_week")["event_date"].nunique()
# print(wau_data)
# event_week
# 2020-w39    3
# 2020-w40    7
# 2020-w41    7
# 2020-w42    7
# 2020-w43    7
# 2020-w44    7
# 2020-w45    7
# 2020-w46    7
# 2020-w47    7
# 2020-w48    7
# 2020-w49    7
# 2020-w50    7
# 2020-w51    7
# 2020-w52    5
# 2021-w00    2
# 2021-w01    7
# 2021-w02    7
# 2021-w03    7
# 2021-w04    7
# 2021-w05    7
# 2021-w06    7
# 2021-w07    7
# 2021-w08    7
# 2021-w09    1

# concat w52 and w00
df.loc[df["event_week"] == "2021-w00", "event_week"] = "2020-w52"
wau_data = df.groupby("event_week")["event_date"].nunique()
# print(wau_data)

# drop invalid first and last week
drop_mask = (df["event_week"] != "2020-w39") & (df["event_week"] != "2021-w09")
valid_wau_df = df.loc[drop_mask]
wau_data = valid_wau_df.groupby("event_week")["event_date"].nunique()
# print(wau_data)
wau_data = valid_wau_df.groupby("event_week")["user_id"].nunique()

wau_data = wau_data.reset_index()
wau_data = wau_data.rename(columns={"user_id": "user_count"})


# sns.lineplot(data=wau_data, x="event_week", y="user_count")
# plt.show()

############## MAU #################

df["event_month"] = df["event_date"].dt.strftime("%Y-%m")
# print(df.head())

mau_data = df.groupby("event_month")["user_id"].nunique()
mau_data = mau_data.reset_index()
mau_data = mau_data.rename(columns={"user_id": "user_count"})
# print(mau_data.head())

# sns.lineplot(data=mau_data, x="event_month", y="user_count")
# plt.show()


mean_daily_user = dau_data["user_count"].mean()
mean_monthly_user = mau_data["user_count"].mean()

dau_mau_ratio = mean_daily_user / mean_monthly_user
# print(mean_daily_user)
# print(mean_monthly_user)
# print(dau_mau_ratio)


############## COHORT #################
order_data = df.loc[df["event_type"] == "purchase"]

# first order month per user id
first_order = order_data.groupby("user_id")["event_month"].min().to_frame()
first_order = first_order.rename(columns={"event_month": "first_order_month"})


order_data = pd.merge(order_data, first_order, on="user_id")
order_data = order_data.rename(columns={"event_month": "order_month"})

cohorts = order_data.groupby(["first_order_month", "order_month"])["user_id"].nunique()

cohorts = cohorts.reset_index()
cohorts = cohorts.rename(columns={"user_id": "total_users"})

cohorts["order_month_dt"] = pd.to_datetime(cohorts["order_month"])
cohorts["first_order_month_dt"] = pd.to_datetime(cohorts["first_order_month"])

cohorts["order_diff"] = cohorts["order_month_dt"].dt.to_period("M").astype(
    "int"
) - cohorts["first_order_month_dt"].dt.to_period("M").astype("int")

cols = ["first_order_month", "order_diff", "total_users"]
cohorts = cohorts[cols]
# print(cohorts.head())
cohorts = cohorts.set_index(["first_order_month", "order_diff"])
# print(cohorts.head())
cohorts = cohorts.unstack(1)
print(cohorts)

# divide : 지정한 시리즈를 이용해서 나머지 컬럼들을 나눠준다
# reorder_rate = cohorts.divide(cohorts[0], axis=0)
# print(cohorts[0])

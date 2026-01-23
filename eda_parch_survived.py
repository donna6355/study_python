import pandas as pd
import matplotlib.pyplot as plt

# 가설 : 부모자식과 함께 탑승한 가족 탑승객의 경우 연령대가 낮을 수록 생존률이 높고 연령대가 높을수록 생존률이 낮을 것이다.

# => 연령대가 높은 부모 그룹이 자식을 구하기 위해 더 희생하지 않을까

df = pd.read_csv("./data/titanic_train.csv")
# print(df.info())

parch = df.loc[df["Parch"] > 0]
# print(parch.info())

dropped_parch = parch.dropna(subset=["Age"])
print(dropped_parch.info())

plt.hist(dropped_parch["Age"])
plt.show()

# plt.boxplot(dropped_parch["Age"])
# plt.show()


for survived, label, color in [(0, "사망", "#ff6b6b"), (1, "생존", "#4ecdc4")]:
    subset = dropped_parch[dropped_parch["Survived"] == survived]["Age"]
    plt.hist(subset, bins=30, alpha=0.6, label=label, color=color, edgecolor="white")
plt.show()

# 5~10세 구간의 비정상적인 사망률 확인
mask = (
    (dropped_parch["Age"] >= 5)
    & (dropped_parch["Age"] <= 10)
    & (dropped_parch["Survived"] == 0)
)
dropped_parch.loc[mask]

sib_sp_mean = dropped_parch["SibSp"].mean()
print("부모자식 그룹의 평균 형제자매배우자 수:", sib_sp_mean)
baby_sib_sp_mean = dropped_parch.loc[mask]["SibSp"].mean()
print("5~10세 사망자 그룹의 평균 형제자매 수:", baby_sib_sp_mean)

# parch_desc = dropped_parch["Age"].describe()
# par_std = dropped_parch["Age"].mean()
# par_std = par_std.astype("int")
# print(parch_desc)
# print(par_std)


# # 기준값 이하는 자녀 그룹, 기준값 이상을 부모 그룹으로 가정한다

# fig, axes = plt.subplots(1, 2, figsize=(14, 5))

# for survived, label, color in [(0, "사망", "#ff6b6b"), (1, "생존", "#4ecdc4")]:
#     subset = df[df["Survived"] == survived]["Age"].dropna()
#     axes[0].hist(
#         subset, bins=30, alpha=0.6, label=label, color=color, edgecolor="white"
#     )

# axes[0].set_title("생존 여부에 따른 나이 분포", fontsize=14, fontweight="bold")
# axes[0].set_xlabel("나이")
# axes[0].set_ylabel("승객 수")
# axes[0].legend()

# plt.tight_layout()
# plt.show()

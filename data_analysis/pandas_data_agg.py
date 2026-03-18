import pandas as pd

# assign specific column as index
df = pd.read_csv("./data/titanic_train.csv", index_col="PassengerId")
# print(df.head())


# categorical column : discrete values
# -> Survived, Pclass, Cabin, Sex : value itself tells the meaning
# numerical column : continuous values
# -> Age, Fare : compare each values to understand the meaning


##GROUPBY
gb = df.groupby("Pclass")
gb = df.groupby("Pclass").count()
# print(gb)

gb = df.groupby("Pclass").sum(numeric_only=True)
# print(gb)

gb = df.groupby("Pclass").mean(numeric_only=True)
# print(gb)

# sum of AGE by Pclass
gb = df.groupby("Pclass")["Age"].sum()
# print(gb)


##AGGREGATE
agg = df.groupby("Pclass").agg({"Age": ["mean", "sum"], "Fare": "sum"})
# print(agg)

# multi level index
agg = df.groupby("Pclass").agg(["unique", "count"])
# print(agg)


# multi grouping
gb = df.groupby(["Sex", "Pclass"]).mean(numeric_only=True)
# print(gb)

agg = df.groupby(["Sex", "Pclass"]).agg({"Age": ["mean", "min", "max"], "Fare": "sum"})
# print(agg)


##CROSS TAB
# categorycal data comparison

# survived count by sex
ct = pd.crosstab(df["Sex"], df["Survived"])
# print(ct)

# normalize = 'all', 'index', 'columns'

# normalize by all : 전체 인원 중 사망자 비율
ct = pd.crosstab(df["Sex"], df["Survived"], normalize="all")
# print(ct)
ct = pd.crosstab(df["Sex"], df["Survived"], normalize="all", margins=True)
# print(ct)

ct = pd.crosstab(df["Sex"], df["Survived"], normalize="index", margins=True)
# print(ct)

ct = pd.crosstab(df["Sex"], df["Survived"], normalize="columns", margins=True)
# print(ct)


# pivot table
pt = pd.pivot_table(
    df,
    index="Sex",  # in row
    columns="Pclass",  # in column
    values="Fare",  # taget
    aggfunc="mean",  # function
)
# print(pt)

pt = pd.pivot_table(
    df,
    index="Sex",  # in row
    columns="Pclass",  # in column
    values="Fare",  # taget
    aggfunc=["mean", "sum", "max"],  # function
)
# print(pt)

pd.pivot_table(
    df,
    index=["Sex", "Embarked"],  # in row
    columns=["Pclass", "Survived"],  # in column
    values=["Fare", "Age"],  # taget
    aggfunc="mean",  # function
    margins=True,
)
# print(pt)

# STACK, UNSTACK, MELT
# 데이터 - 분석 가능 (집계 가능) : 집계 기준에 대한 정보가 아니고 카테고리


pivot = pd.pivot_table(
    df,
    index=["Sex", "Pclass"],
    values=["Survived", "Fare"],
    aggfunc=["mean", "median", "sum"],
)

# print(pivot)
# print(pivot.index)
# MultiIndex([('female', 1),
#             ('female', 2),
#             ('female', 3),
#             (  'male', 1),
#             (  'male', 2),
#             (  'male', 3)],
#            names=['Sex', 'Pclass'])

# print(pivot.columns)
# MultiIndex([(  'mean',     'Fare'),
#             (  'mean', 'Survived'),
#             ('median',     'Fare'),
#             ('median', 'Survived'),
#             (   'sum',     'Fare'),
#             (   'sum', 'Survived')],
#            )


# STACK : rearrange columns[0] into rows
st = pivot.stack(0)
# print(st)
st = pivot.stack(1)
# print(st)

# UNSTACK : rearrange rows[0] into column
st = pivot.unstack(0)
# print(st)

# MELT : wide data to long data frame
data = pd.DataFrame(
    {
        "name": ["a", "b", "c", "a"],
        "볼펜": [1000, 2000, 1000, 1500],
        "노트": [1000, 1500, 2000, 2500],
    }
)
print(data)
mt = pd.melt(data, id_vars=["name"])
mt = pd.melt(data, id_vars=["name"], var_name="품목", value_name="가격")
print(mt)

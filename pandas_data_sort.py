import pandas as pd

df = pd.read_csv("./data/titanic_train.csv")
# print(df.head())


# SORT

# sort by index
st = df.sort_index()
# print(st)

st = df.sort_index(ascending=False)
# print(st)


# sort by columns
st = df.sort_values(by="Fare")
# print(st)


st = df.sort_values(by="Fare", ascending=False)
# print(st)


# sort by String
st = df.sort_values(by="Name")
# print(st["Name"])

st = df.sort_values(by=["Pclass", "Fare"])
# print(st)

st = df.sort_values(by=["Pclass", "Fare"], ascending=[False, True])
print(st)

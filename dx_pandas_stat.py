import pandas as pd

df = pd.read_csv("./data/titanic_train.csv")
# print(df.info())


# summary : qty, mean, std, min, 25%, 50%, 75%, max
des = df.describe()
# print(des)

des = df.min(numeric_only=True)
# print(des)

des = df.max(numeric_only=True)
# print(des)

des = df.mean(numeric_only=True)
# print(des)

des = df.median(numeric_only=True)
# print(des)

des = df.std(numeric_only=True)
# print(des)

des = df.quantile(numeric_only=True)
# print(des)

# count : non-nan values
des = df.count()
# print(des)

des = df.var(numeric_only=True)
print(des)

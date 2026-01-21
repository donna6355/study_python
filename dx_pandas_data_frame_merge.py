import pandas as pd

df1 = pd.read_csv("./data/korean-idol.csv")
df2 = pd.read_csv("./data/korean-idol-2.csv")

# print(df1.info())
# print(df2.info())

# CONCAT : based on index

df1_copy = df1.copy()
df1_copy.drop([1, 5, 7, 8, 10], inplace=True)
# print(df1_copy)

# vertical concat
# identical columns required
df1_concat = pd.concat([df1, df1_copy], axis=0)
# print(df1_concat)
df1_concat.reset_index(drop=True, inplace=True)
# print(df1_concat)

# horizontal concat
# identical index required
cat = pd.concat([df1, df2], axis=1)
# print(cat)


df3 = df2.drop([2, 14])
# print(df3)
cat = pd.concat([df1, df3], axis=1)
# print(cat)

# index mismatch issue!!!
df4 = df3.reset_index(drop=True)
cat = pd.concat([df1, df4], axis=1)
# print(cat)


# MERGE : based on columns name
df2_right = df2.drop([1, 3, 5, 7, 9])
df2_right = df2_right.reset_index(drop=True)
# print(df2_right)

# Wrong concat
cat = pd.concat([df1, df2_right], axis=1)
# print(cat)

# left, right, inner, outer
mg = pd.merge(df1, df2_right, on="이름", how="left")
# print(mg)

df1_left = df1.drop([2, 4, 6])
mg = pd.merge(df1_left, df2_right, on="이름", how="inner")
# print(mg)


mg = pd.merge(df1_left, df2_right, on="이름", how="outer")
print(mg)

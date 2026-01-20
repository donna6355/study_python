import pandas as pd
df = pd.read_csv('./data/titanic_train.csv')


# print(df.info())
dfTypes = df.dtypes
# print(dfTypes)

selTypes = df.select_dtypes('int')
# print(selTypes)
selTypes = df.select_dtypes('float')
# print(selTypes)
selTypes = df.select_dtypes('object')
# print(selTypes)


#type transform
# 집계나 통계가 필요하지 않는 데이터를 number로 가지고 있을 필요가 없다. 그렇다면 String으로 바꿔야지 집계에 자연스럽게 제외됨

print(df.info())
df["PassengerId"] = df["PassengerId"].astype('str')
print(df.info())

# nan이 있을 경우에는 타입 변경 불가!

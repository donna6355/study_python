import pandas as pd
df = pd.read_csv('./data/titanic_train.csv')

# print(df.index)

#modification index
# 판다스 안전장치! 원본 데이터의 변경을 번거롭게되어 있음. 복사본을 생성함. 
df1 = df.copy()
df2 = df1.rename({
  0:"ROW1",
  1:"ROW2"
})

# print(df1.head())
# print(df2.head())

#원본 데이터 프레임 변형시키기
df1.rename({
  0:"ROW1",
  1:"ROW2"
}, inplace=True)
# print(df1.head())

#전체 인덱스 변경
sample_index = [
  f'{i+1}번째' for i in range(len(df1))
]

# print(sample_index)
df1.index = sample_index
# print(df1.head())


#rename columns
df2= df.copy()
df2.rename({
  "PassengerId":"승객번호"
}, axis=1)

df2.rename(columns={
  "PassengerId":"승객번호"
})
# print(df2.columns)


#lower case columns
sample_col = [col.lower() for col in df2.columns]
# print(sample_col)
df2.columns = sample_col
# print(df2.columns)
# print(df2.head())

#reset index
#기존 인덱스를 폐기하고 rangeIndexfh 인덱스를 재구성하는 것
# 기존 인덱스는 컬럼으로 추가되고, 새로운 인덱스가 0부터 재구성됨
df1.reset_index()

# drop prev index
df1.reset_index(drop=True)




#Data add/delete

#add Row
add_row = df.loc[[3,5,100]]
add_row.index = ['add1','add2','add3']


df3 = df.copy()
# print(df3.tail())
df4 = pd.concat([df3,add_row])
# print(df4.tail())

#delete row
df2.drop([1,2,4])

#add Column
df5 = df.copy()
df5["나이대"] = df5["Age"]//10*10
# print(df5.head())

df5["blah"] = 'blah'
# print(df5.head())

#delete column
df5.drop("blah", axis=1,inplace=True)
# print(df5.head())

# 좌석등급 컬럼을 추가
#   Pclass가 1이면 최고등급
#   Pclass가 2이면 중간등급
#   Pclass가 3이면 최저등급
# loc만 사용해서 구현하기

dfTest = df.copy()
dfTest.loc[dfTest["Pclass"] == 1, "좌석등급"] = "최고등급"
dfTest.loc[dfTest["Pclass"] == 2, "좌석등급"] = "중간등급"
dfTest.loc[dfTest["Pclass"] == 3, "좌석등급"] = "최저등급"
# print(dfTest[["Pclass","좌석등급"]])

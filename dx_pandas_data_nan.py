import pandas as pd

df = pd.read_csv('./data/titanic_train.csv')

#check nan values
df.isna()

nanSum = df.isna().sum()
# print(nanSum)
nanSum = df['Age'].isna().sum()
# print(nanSum)

# Age가 결측치인 사람들의 생존 여부, 좌석 등급, 이름, 나이 조회
condition = df.loc[df['Age'].isna(),["Survived","Pclass","Name","Age"]]
# print(condition)

# Age가 결측치인 사람들 중 탑승지(Embarked)가 Q인 사람의 모든 정보

condition = df.loc[(df['Age'].isna())&(df['Embarked']=='Q') ]
# print(condition)



# delete NaN values

#dropna : 결측치가 하나라도 있으면 해당 행/열 삭제 ** any
dropped = df.dropna()
# print(dropped)

dropped =  df.dropna(axis=1)
# print(dropped)

#모든 데이터가 NaN인 행/열 삭제 ** all
dropped =  df.dropna(how='all')
# print(dropped)

#지정 컬럼 기준으로 결측치가 있는 행/열 삭제
dropped = df.dropna(subset=['Age','Embarked'])
# print(dropped)

#replace Nan values
#replace all
filled = df.fillna(-1)
# print(filled)

#나이 같은 값은 평균에 영향을 갈 수 있기 대문에 평균값을 채운다
age_mean = df['Age'].mean()
# print(age_mean)
df['Age'].fillna(age_mean)

#앞의 값으로 채운다
#뒤의 값으로 채운다
#주식값과 같은 시계열에서 사용
df['Age'].ffill() 
df['Age'].bfill()


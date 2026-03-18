import pandas as pd
df = pd.read_csv('./data/titanic_train.csv')
# print(df.head())

#select row data

#with offset index
# print(df[:10])
selected = df[:10]
selected = df[3:7]
# print(selected)



#select col data
# print(df['Name'])
selectedCol = df['Name']
selectedCol = df.Fare
# print(selectedCol)

#convert to data frame 
selectedFr = df['Fare'].to_frame()
# print(selectedFr)

#select field value
#LOC - LOCATION
#need both row and col 
########## LOC index from 1
selectedLoc = df.loc[3]
selectedLoc = df.loc[3,"Name"]
# print(selectedLoc)

selectedLoc = df.loc[3:10,"Name":"Age"]
# print(selectedLoc)

cols = ["Name","Fare","Pclass"]
selectedLoc = df.loc[3:10,cols]
# print(selectedLoc)
rows = [1,3,5,7]
selectedLoc = df.loc[rows,cols]
# print(selectedLoc)  

#copy data frame
df_copy = df.copy()
# print(df_copy.head())

#edit value
df_copy.loc[0,"Name"] = "Mir Isaac Kim"
# print(df.head())


#################################
##########ILOLC - INDEX LOCATION
#데이터 프레임 고유의 인덱스를 무시하고 배열로 취급하는 방법

selIloc = df.iloc[3:6,[2,5,6]]
# print(selIloc)

#export data
#conditional export

#only Pclass is 1
mask = df["Pclass"]==1
selectedMask = df.loc[mask]
selectedMask = df.loc[~mask] #not Pclass is 1
# print(selectedMask)

# and &, or |
# 복합 조건 사용시 반드시 괄호 사용
mask = (df["Pclass"]==1) &( df["Age"]>=30)
mask = (df["Pclass"]==1)| ( df["Age"]>=30)
selectedMask = df.loc[mask]
# print(selectedMask)

#나이가 30 이하이거나 50 이상이고
#PClassrk 2dls tkfkaemf
mask = ((df["Age"]<=30)|(df["Age"]>=50)) & (df["Pclass"]==2)
selectedMask = df.loc[mask]
# print(selectedMask)

# 여성 중 같이 탑승한 가족이 있다
mask = (df["Sex"]=="female") & (df["SibSp"]+df["Parch"]>0)
selectedMask = df.loc[mask,["Name","Sex","SibSp","Parch"]]
# print(selectedMask)

#뭊나열을 이용해 조건절을 지정
queryRes = df.query('Pclass==1')[["Name","Pclass","Age"]]
# print(queryRes)

#isin
mask = df["PassengerId"].isin([1,3,5,7,9])
selectedIsin = df.loc[mask]
# print(selectedIsin)
# print(df.query("PassengerId in [1,3,5,7,9]"))

#access external variable with @
id_list = [100,200,300] 
print(df.query("PassengerId in @id_list"))
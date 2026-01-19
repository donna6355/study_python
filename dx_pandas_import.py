import pandas as pd

csv_file_path = './data/titanic_train.csv'
df_csv = pd.read_csv(csv_file_path)
print(df_csv)
print(df_csv.info())

# <class 'pandas.core.frame.DataFrame'>
# RangeIndex: 891 entries, 0 to 890
# Data columns (total 12 columns):
#  #   Column       Non-Null Count  Dtype  
# ---  ------       --------------  -----  
#  0   PassengerId  891 non-null    int64  
#  1   Survived     891 non-null    int64  
#  2   Pclass       891 non-null    int64  
#  3   Name         891 non-null    object 
#  4   Sex          891 non-null    object 
#  5   Age          714 non-null    float64
#  6   SibSp        891 non-null    int64  
#  7   Parch        891 non-null    int64  
#  8   Ticket       891 non-null    object 
#  9   Fare         891 non-null    float64
#  10  Cabin        204 non-null    object 
#  11  Embarked     889 non-null    object 
# dtypes: float64(2), int64(5), object(5)
# memory usage: 83.7+ KB
# None

# Dtype에서 원하는 데이터 타입이 맞는지 확인! 숫자 이외에는 거의 Object

#first n records
print(df_csv.head())
#last n records
print(df_csv.tail())


#Assign specific column as idx
df_csv = pd.read_csv(csv_file_path, index_col='PassengerId')
print(df_csv)

#import excel is not recommended, better handling csv!
excel_file_path = './data/titanic_train.xlsx'
df_excel = pd.read_excel(excel_file_path)
print(df_excel)

df_excel = pd.read_excel(excel_file_path, header=1)
print(df_excel)

#fetch html table data
html_path = "https://finance.naver.com/sise/sise_quant.naver"
html_data_list = pd.read_html(html_path, encoding='euc-kr' )

print(html_data_list)
len(html_data_list)
df_kospi = html_data_list[1]
print(df_kospi)
kospi_processed = df_kospi.dropna(how='all').reset_index(drop=True)
print(kospi_processed)

kospi_processed.to_csv('./data/kospi_20260119170000.csv', encoding='utf-8')
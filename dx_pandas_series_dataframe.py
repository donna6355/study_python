import pandas as pd


sample_dict = {"a": 1, "b": 2, "c": 3}

dict_series = pd.Series(sample_dict)
print(dict_series)


sample_list = [1, 2, 3]
list_series = pd.Series(sample_list)
print(list_series)

list_series = pd.Series(sample_list, name="ColumnName")
print(list_series)


##Data Frame

sample_dict = {"name": ["Isaac", "Moomin", "Kkomi"], "weight": [5.7, 4.3, 6.2]}
df = pd.DataFrame(sample_dict)
print(df)

sample_list = [["Isaac", 5.7], ["Moomin", 4.3], ["Kkomi", 6.2]]
df_list = pd.DataFrame(sample_list, columns=["Name", "Weight"])
print(df_list)

# DIC를 List에 모아서 DataFrame로 만드는 방식 -> JSONArray
json_sample = [
    {"name": "A", "height": 180.3},
    {"name": "B", "height": 175.3},
    {"name": "C", "height": 167.3},
]
df = pd.DataFrame(json_sample)
print(df)

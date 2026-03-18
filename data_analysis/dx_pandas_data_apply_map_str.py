import pandas as pd
import numpy as np

df = pd.read_csv("./data/titanic_train.csv")
print(df.info())

## APPLY : in order to custom function, retun mandatory, recieve row as params


# Pclass == 1 && Sibsp ==1 => 'A' or 'B


def pclass_sibsp(row):
    if row.Pclass == 1 and row.SibSp == 1:
        return "A"
    else:
        return "B"


df1 = df.copy()
df1["pclass_sibsp_processed"] = df1.apply(pclass_sibsp, axis=1)
# print(df1.head(10))

# age >= 19 : Adult, age <19 : Child, else nan (np.nan)


def age_group(row):
    if row.Age >= 19:
        return "Adult"
    elif row.Age < 19:
        return "Child"
    else:
        return np.nan


df1["is_adult"] = df1.apply(age_group, axis=1)

# print(df1.head(10))


# better to refer only one column
def age_group_series(age):
    if age >= 19:
        return "Adult"
    elif age < 19:
        return "Child"
    else:
        return np.nan


df1["is_adult_series"] = df1["Age"].apply(age_group_series)
# print(df1.head(10))

# Fare < 10 : "저렴한 좌석", Fare >= 10 : "비싼 좌석"

# def check_fare(fare):
#     if fare >= 10:
#         return "비싼 좌석"
#     else:
#         return "저렴한 좌석"
# df1["is_expensive"] = df1["Fare"].apply(check_fare)


# short with lambda and ternary operator
df1["is_expensive"] = df1["Fare"].apply(
    lambda f: "비싼 좌석" if f >= 10 else "저렴한 좌석"
)
# print(df1.head)


##MAP -> convert to other values based on dictonary

survived_map = {0: "사망", 1: "생존"}
df1["survived_status"] = df1["Survived"].map(survived_map)
# print(df1[["Survived", "survived_status"]].head(10))


##STR
miss_mask = df1.Name.str.contains("Miss")
df1.loc[miss_mask]
# print(df1.head())

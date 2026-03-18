#!/usr/bin/env python
# coding: utf-8

# In[34]:


dic ={"name":"Isaac","age":5,"phone":"010-0000-1234"}
print(dic)
print(type(dic))

dic["dob"] = "20201231"

print(dic)

# get keys only
print(dic.keys())
print(list(dic.keys()))


# get values only
print(dic.values())
print(list(dic.values()))

# get items (key-value pair)
print(dic.items())
for key,value in dic.items():
    print(key,end="-")
    print(value,end="\t")

dicTest = {"title":"Untitled"}
dicTest["singer"]="Isaac"
print(dicTest)

print(dicTest["title"])
print(dicTest.get("title"))
print(dicTest.get("name"))

# modify value
dicTest["singer"]="Kkomi"
print(dicTest)

# delete value
del dicTest["singer"]
print(dicTest)
dicTest.clear()
print(dicTest)


# In[29]:


dict1 = {}
dict1["name"] = ["Isaac", "Kkomi", "Moomin"]
dict1["age"] = [5,5,9]
print(dict1)

dict1["name"][2] = "Jjanga"
print(dict1)

del dict1["name"][2]
del dict1["age"][2]
print(dict1)

# initiate dictionary
keys = ["a","b","c","d"]
dictTest1 = dict.fromkeys(keys)
print(dictTest)

dictTest2 = dict.fromkeys(keys,1)
print(dictTest2)

dicTest3 = {"a1":dic,"a2":dict1}
print(dicTest3)
dicTest3["a3"] = {'name': 'Kkomi', 'age': 5 }
print(dicTest3)
print(dicTest3["a1"]['name'])


#!/usr/bin/env python
# coding: utf-8

# In[16]:


sample = 'kakao_sample.csv'
f = open(sample,'r',encoding="UTF8")
lines = f.readlines()
count = {}
print(lines[2])
for line in lines:
    try:
        name = line.split('"')[1]
        try:
            count[name] +=1
        except:
            count[name] =1
    except:
        pass

print(count) #{'OA 피오나님': 424, 'Donna:)': 432}


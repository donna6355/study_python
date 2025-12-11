#!/usr/bin/env python
# coding: utf-8

# In[1]:


ints = [93,5,2,1,8];
for int in ints:
    print('even num') if int%2 ==0 else print('odd num')


# In[2]:


scores = (99, 40,28,80)
for score in scores:
    print('Pass') if score >= 80 else print('Fail')


# In[16]:


# range()
# range(1,10,1) from 1, before 10, increase by 1
# range(int? startFrom = 0, int before, int? increaseBy = 1)

for i in range(1,10,1):
    print(i)
# for i in range(0,100,5):
#     print(i,end=" ") #default \n
# for i in range(100):
#     print(i,end=" ") #0 1 2 3 4 5 ... 97 98 99 
# for i in range(90,100):
#     print(i,end=" ") #90 91 92 93 94 95 96 97 98 99 


#!/usr/bin/env python
# coding: utf-8

# In[6]:


# NOT allowed to add, edit, delete elements, IMMUTABLE
t1 = (0,1,2,3,4)
print(t1)
print(t1[:2])
print(len(t1))


# In[9]:


l1 = ['one','two','three']
str = 'holy night'

print('night' in l1)
print('night' in t1)
print('night' in str)

print('night' not in l1)
print('night' not in t1)
print('night' not in str)


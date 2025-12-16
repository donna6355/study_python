#!/usr/bin/env python
# coding: utf-8

# In[4]:


# import module_test
# res = module_test.add(10,144)
# print(res)

from module_test import add
res = add(10,144)
print(res)


# In[5]:


import module_test

target = module_test.extractNum(1,100)
print(target)
res = ""
while res != "GOTCHA":
    guess = module_test.inputNum()
    res = module_test.compare(guess, target)
    print(res)


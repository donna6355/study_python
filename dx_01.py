#!/usr/bin/env python
# coding: utf-8

# In[11]:


print('this blue box is called "Cell"')


# In[15]:


print("good")
print("morning")
print("Isaac")
print(":) Meow")


# In[21]:


int(0xfffa1233) #4294578739  #0x hex prefix
int(0b10101111) #175 #0b binary prefix
bin(175) #'0b10101111' 


# In[27]:


#bmi caculator
weight = int(input('input weight'))
height = int(input('input height'))

bmi = weight/(height**2)
print(bmi)


# In[35]:


# import math
# math.pi

from math import pi, floor
print(pi)
print(floor(pi))


# In[39]:


print((50000 - 23000) // 10000)                    # 1만원권
print(((50000 - 23000) % 10000) // 5000)           # 5천원권
print((((50000 - 23000) % 10000) % 5000) // 1000)  # 1천원권

print((50000 - 23000) %5000 // 1000)


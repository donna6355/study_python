#!/usr/bin/env python
# coding: utf-8

# In[21]:


str = 'Hello cute Isaac :)';

print(str[3])
print(str[-17])
print(str[:6]) #print(str[0:6])
print(str[7:]) #print(str[7:19])
print(str[:]) #print(str[0:19])


# In[31]:


day = 7
sample = 'Today is July %d' %day
print(sample)
# %d, %c, %c, %f

#regardless of data type
sample2 = 'Today is July {}'.format('al;skdjf')
print(sample2)


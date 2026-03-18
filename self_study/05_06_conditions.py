#!/usr/bin/env python
# coding: utf-8

# In[13]:


num = 9000
# indent is crucial
if num > 10000:
    print('even number')
    print('odd number')


# In[14]:


if num > 10000 : 
    print('U R rich')
else :
    print('U R broke')

if num >= 10000 :
    print('You can take a taxi')
elif num >= 5000 :
    print('You can take a bus')
else : 
    print('You gotta walk')


# In[17]:


score = int(input('please input Isaac\'s score'))
if score >90:
    print('U got',score, 'Great! U got A')
elif score > 80 : 
    print('U got',score,'Well done! U got B')
elif score >70 :
    print('U got',score,'Good! U got C')
else :
    print('U got',score,'Do you best next time, D')


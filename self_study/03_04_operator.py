#!/usr/bin/env python
# coding: utf-8

# In[1]:


print(7+4) #11
print(7-4) #3
print(7*4) #28
print(7/4) #1.75
print(7//4) #1 decimal value only
print(7%4) #3 remaining


# In[4]:


num1 = 10
str1 = "7"

print(str(num1) + str1) #convert int to String str()
print(num1 + int(str1)) #convert String to int int()

print(str1*5)


# In[6]:


print(2*2*2)
print(2**3)


# In[8]:


name = input('please type your cutest baby\'s name')
print('name is {}'.format(name))


# In[10]:


a = 27
a+=3
print(a)
a-=3 
print(a)

# +=, -+, *=, /=, %=


# In[11]:


one = 3
two = 7
print(one > two)
print(one < two)
print(one != two)


# In[22]:


isTrue = True
# !
print(not isTrue)
print(not one > two)

# &&
print(isTrue and one < two)
print(isTrue and one > two)

# || 
print(isTrue or one < two)
print(isTrue or one > two)
print(one > two or  one > two)

# condition ? trueVal : falseVal
# trueVal if condition else falseVal
res = "Good" if one > 7 else "Bad"
print(res)

inputNum = int(input('please type num'))
finRes = "even" if inputNum%2 == 0 else "odd"
print('typed number {} is {} number'.format(inputNum, finRes))


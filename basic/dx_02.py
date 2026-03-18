#!/usr/bin/env python
# coding: utf-8

# In[1]:


from random import *

random()


# In[3]:


#celcius - fahrenheit converter
# 화씨 = (섭씨 × 9/5) + 32
c = float(input('please input celcius'))
f = (c * 9 / 5) +32
print(c,'degree celcius is', f,' in fahrenheit')


# In[12]:


#bmi caculator
# 체중(kg) / (키(m) * 키(m))
w = float(input('please input your weight in kg'))
h = float(input('please input your height in meter'))
bmi = w / (h**2) # pow(h,2)
print('height is ', h,'weight is ', w, ', your bmi is ',bmi)


# In[5]:


#binary to 24-hour
# 0b00110시 0b10011분
h = 0b00110
m = 0b10011
print(int(h),':',int(m))


# In[13]:


#change calculator
total = 23000
bill = 50000
balance = bill-total
print('balance is',balance)
print('10,000 bill :',(balance)//10000)
print('5,000 bill :',(balance%10000)//5000)
print('1,000 bill :',(balance%5000)//1000)


# In[21]:


str = 'Hello \'World\'   '
print(str)

print(str.upper())
print(str.lower())
print(len(str))
print(str.strip())
print(len(str.strip()))

multiline = '''
Good morning dear,
this is Isaac from Mapo
'''
print(multiline)


# In[31]:


divider = '='*10
print(divider+"\nHello World\n"+divider)

def customPrint(label):
    n = len(label)+1
    divider = '='*n
    print(divider+f"\n{label}\n"+divider)

customPrint('Good morning, cute Isaac:)')


starline = '*' * 5
print(starline+"\n*ABC*\n"+starline)


# In[32]:


name = "Isaac"
age = 5
address = "Mapo"
is_cat = True

print(name)
name = 5
print(name)


#!/usr/bin/env python
# coding: utf-8

# In[1]:


def sum(num1,num2):
    res = num1 + num2
    return res

print(sum(1,4))



# In[8]:


num1 = int(input("input first number"))
num2 = int(input("input second number"))
op = input("input + or -")


def calculate(num1, num2,op):
# docstring """ blah blah """
# shift + tab to check docstring 
    """docstring this is to demonstrate this function """
    if op == "+":
        return num1+num2
    else:
        return num1-num2

res = calculate(num1, num2, op)
print(res)


# In[24]:


# unlimited number of parameters

def varParam(* args):
    print(args)

varParam(1,2,3,4)

def addAll(* args):
    res = 0
    for int in args:
        res+=int
    return res
print(addAll(1,2,3,4,5))


# keyword unlimited number of parameters

def dicParam(** args):
    print(args)

dicParam(string=1) #{'string': 1}

# default parameter
def add(num1, num2, op = "+"):
    if op == "+":
        return num1+num2
    else:
        return num1-num2

print(add(1,3,"+"))
print(add(1,3))

def power(num, power = 2):
    return num ** power;

print(power(3))
print(power(3,3))

# return Tuple (multi values)
def addNSub(num1, num2):
    return num1+num2, num1-num2

print(addNSub(5,3))
resAdd,resSub = addNSub(5,3)
print(resAdd)
print(resSub)

def sumAve(*args):
    sum = 0
    for int in args:
        sum +=int
    avg = sum / len(args)
    return sum, avg

print(sumAve(1,2,3,4,5))


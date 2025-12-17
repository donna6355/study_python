#!/usr/bin/env python
# coding: utf-8

# In[6]:


class SampleClass:
    var = "python"
    def hap(self, a,b):
        print(self.var, a, b)

    def setName(self, name):
        self.name = name

a = SampleClass()
print(a.var)
a.hap(1,400)
a.setName("Isaac")
print(a.name)

class Cat:
    def scratch():
        print("scratch meow")


# In[11]:


# constructor

class TestClass:
    def __init__(self,name):
        self.name = name
        print('__init__ is called')

    def setPrivate(self, int):
        self.__var = int
    def getPrivate(self):
        print(self.__var)

b = TestClass("Kkomi")
print(b.name)

# private var
b.setPrivate(1231)
# print(b.__var) #AttributeError: 'TestClass' object has no attribute '__var'
b.getPrivate()


# In[20]:


# inheritance
class SuperClass:
    def show(self):
        print('My Name is', self.name)

class SubClass(SuperClass):
    def __init__(self,name):
        self.name = name
    #override
    def show(self):
        print("Howdy, I am", self.name)
        #call super class method
        super().show()

isaac = SubClass('Isaac')
isaac.show()



# In[22]:


# operator overload _ magic method

print(1+2)

class OperOverLoadClass:
    def __init__(self,var):
        self.var = var
    def __add__(self,other):
        print("%d %d"%(self.var, other.var))

a = OperOverLoadClass(1)
b = OperOverLoadClass(2)
a+b


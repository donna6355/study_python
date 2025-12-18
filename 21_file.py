#!/usr/bin/env python
# coding: utf-8

# In[2]:


def openFile():
    try :
        "sdf"+1
    except:
        print("Exception")

openFile()


# In[16]:


# r: read, w: write, a: add
f = open("test.txt","w")
f.write("Hi there,\nI am Isaac!")
f.close()

try:

    f = open("test.txt","r")

    # read one line
    # line = f.readline()
    # print(line) #Hi there,

    # while True:
    #     line = f.readline()
    #     if not line:
    #         break
    #     print(line)

    lines = f.readlines()
    for line in lines:
        print(line,end="")

    f.close()
except:
    print("failed to open n read file")


try:
    f = open("test.txt","a")
    f.write("add more!")
    f.close()
except:
    print("failed to write file")


# auto close 
with open("test.txt","r") as f:
    lines = f.readlines()
    print(lines)
    #auto clase after all the block running is over


# In[17]:


# list up the files
import os
dirname = "/Users/donna/Downloads"
filenames = os.listdir(dirname)
for name in filenames:
    print(name)

# delete file
if os.path.exists('test.txt'): # current directory
    os.remove('test.txt')
    print("FILE DELETED")
else :
    print("NO FILE FOUND")


# In[19]:


# create folder
dir = "./test/"
if not os.path.exists(dir):
    os.mkdir(dir)
    print("DIR NEWLY CREATED")
else:
    print("DIR ALREADY EXIST")

# delete folder
if not os.path.exists(dir):
    print("NO DIR FOUND")
else:
    os.rmdir(dir)
    print("DIR DELETED")


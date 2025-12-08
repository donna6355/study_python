#!/usr/bin/env python
# coding: utf-8

# In[32]:


ints = [5,1,2,9,4]
print(ints)


# In[34]:


multi = ['one',2,'three',[1,2,3,4]]
print(multi)
print(multi[2])

print(multi[3][0])

# slicing
print(multi[:3])

# concatenate
print(ints+multi) #[1, 2, 3, 4, 5, 'one', 2, 'three', [1, 2, 3, 4]]

# add element
multi.append('last')
print(multi)

# insert element
multi.insert(2,'Third')
print(multi)

# modify element
multi[2] = '3rd'
multi[:4] = ['one']
print(multi)

# delete element
del multi[0]
print(multi)

# find specific value element and remove, if not exist then throw err
multi.remove('last')
print(multi)

# sort && reverse
ints.sort()
print(ints) #[1, 2, 4, 5, 9]

ints.reverse()
print(ints) #[9, 5, 4, 2, 1]


# check index
print(ints.index(2))

# remove last element
print(ints.pop())
print(ints)

# lentgh
print(len(ints))


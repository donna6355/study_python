langset = {"ko","en","cn"}

fruits = ['banana','apple','blueberry']
fruitSet = set(fruits)

print(fruitSet)
fruitSet.add('kiwi')
print(fruitSet)

fruitSet.remove('kiwi')
print(fruitSet)


#set operations

A = {1, 2, 3, 4}
B = {3, 4, 5, 6}

# 합집합
A | B         # {1, 2, 3, 4, 5, 6}
A.union(B)

# 교집합
A & B         # {3, 4}
A.intersection(B)

# 차집합
A - B         # {1, 2}
A.difference(B)
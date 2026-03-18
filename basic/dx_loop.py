cities = ["Seoul","Tokyo","Beijing"]
for city in cities:
  print(f'Isaac Concerts will be held in {city}')


for i in range(5): #[0,1,2,3,4]
  print(f'number is {i}')

for i in range(2,6): #[2,3,4,5]
  print(f'range number is {i}')


for i in range(2,6): #[2,3,4,5]
  if i == 2:
    print('skip 2')
    continue
  elif i == 4:
    print('break at 4')
    break
  else:
    print(f'test number is {i}')
    # skip 2
    # test number is 3
    # break at 4


#List Comprehension
lovelys = ["Isaac","Moomin","Kkomi","Jjanga"]
loves = [baby.upper() for baby in lovelys ]
print(loves) #['ISAAC', 'MOOMIN', 'KKOMI', 'JJANGA']

#name printer
fruits = ["사과", "바나나", "딸기", "포도", "오렌지"]

for fruit in fruits:
  print(f'I like {fruit}:)')

#multiply printer
for i in range(2,10):
  for j in range(1,10):
    print(f'{i} x {j} = {i*j}')


#total printer
res = 0
for i in range(1,11):
  res += i

print(f'Total comes {res}')

#list concatenation in sorted way
list1 = [1,2,4]
list2 = [1,3,4]
res = []

while len(list1) > 0 and len(list2) > 0:
  if list1[0] < list2[0]:
    res.append(list1.pop(0))
  else:
    res.append(list2.pop(0))

if len(list1) > 0:
  res = res + list1
if len(list2) > 0:
  res = res + list2

print(res)
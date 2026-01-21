# packing
import json


lst = ["A", "B", "C", "D"]
tup = ("A", "B", "C", "D")

# unpacking
item1, item2, item3, item4 = tup
print(item1)
print(item2)
print(item3)

a, b, _, _ = lst
print(a)
print(b)


# parsing: convert STRING into required data type
rating1 = "4.5"
rating2 = "3.9"
rating3 = "1.5"

rs1 = float(rating1)
rs2 = float(rating2)
rs3 = float(rating3)

print((rs1 + rs2 + rs3) / 3)

sp_json = '{"name": "Alice", "age": 30, "city": "New York"}'
sample = json.loads(sp_json)
print(sample)


# loop
list1 = ["apple", "banana", "cherry"]
for i in list1:
    print(i)
list2 = [10, 20, 30]
for item1, item2 in zip(list1, list2):
    print(item1, item2)

for idx, item in enumerate(list1):
    print(idx, item)

# comprehension
even = [x for x in range(20) if x % 2 == 0]
sqr = [x**2 for x in range(1, 6)]
print(sqr)


# function
def foo():
    print("Hello from foo!")


foo()


def sample(a):
    return a * 2


# lambda : always has params and returns
exampple = lambda x: x + 10
print(exampple(5))


# callback
def bar(a, b, op):
    a **= 2
    b **= 2
    op(a, b)


bar(3, 4, lambda x, y: print("using lambda and cb", x + y))

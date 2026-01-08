def add(a :int,b:int)->int: # type hinting is possible
  print("I will add two numbers of",a,"and",b)
  return a+b


print(add(4,5))

def subtract(a,b):
  print("I will subtract two numbers of",a,"and",b)
  return a-b

print(subtract(10,7))
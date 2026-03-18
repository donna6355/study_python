def add(a :int,b:int)->int: # type hinting is possible
  print("I will add two numbers of",a,"and",b)
  return a+b


print(add(4,5))

def subtract(a,b):
  print("I will subtract two numbers of",a,"and",b)
  return a-b

print(subtract(10,7))

def makeMessage(name, age = 3):
  return f"{name} is {age} years old."

print(makeMessage("Isaac",5))
print(makeMessage(age=6,name="Moomin"))
print(makeMessage("Tom"))


#question mark sentence
def add_question(sentence):
  return sentence + "?"

print(add_question("How are you"))


#f->c converter
def convert_to_celcius(f):
  return (f-32)*5/9

print(convert_to_celcius(32))


#average of numbers
def avg(numbers):
  return sum(numbers)/len(numbers)

print(avg([10,20,30,40,50]))

def fibonacci(n):
  a,b = 0,1
  while n > 0:
    a = b
    b = a+b
    n -= 1
  return a

print(fibonacci(11))

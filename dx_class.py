class Cat:
  def __init__(self, name, age, color):
    self.name = name
    self.age = age
    self.color = color

  def meow(self):
    print(f"{self.name} says Meow!")

moomin = Cat("Moomin", 8, ["Orange","white","brown"])
mir = Cat("Mir", 5, ["brown","black","white"])
kkomi = Cat("Kkomi", 5, ["black","white"])

moomin.meow()
mir.meow()
kkomi.meow()


class Car:
  def __init__(self, brand, color):
    self.brand = brand
    self.color = color

  def start(self):
    print('The car has started. Grrrrr')


bmw = Car("BMW","Black")
audi = Car("Audi","White")


#mini practice
class Dog:
  def __init__(self,name, age, breed):
    self.name = name
    self.age = age
    self.breed = breed
    self.ph = 100
  
  def bark(self):
    self.ph -= 20
    print(f"{self.name} barks! Bow Wow!")

  def sleep(self):
    self.ph += 100
    print(f"{self.name} is sleeping. Zzzzz... Ph recovers to {self.ph}")

  def eat(self, food):
    self.ph += 20
    print(f"{self.name} eats {food}. Ph increases to {self.ph}")

  def status(self):
    print(f"{self.name}'s current ph is {self.ph}")

winston = Dog("Winston", 4, "Bulldog")
winston.eat("Fish")
winston.bark()
winston.bark()
winston.bark()
winston.status()
winston.sleep()

num = 10
 
def foo(msg):
  print(f"foo() => {msg}")
 
def goo(num1, num2):
  # 여러 개의 리턴 값을 튜플로 묶어서 리턴
  return num1+num2, num1-num2, num1*num2, num1/num2
 
class Demo:
  def sum_all(self, *args):
    return sum(args)
 
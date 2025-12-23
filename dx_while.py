#timer
import time

sec = int(input("enter time in seconds "))

while sec != 0:
  print(f'it is {sec//3600:02d}:{(sec%3600)//60:02d}:{sec%60:02d}')
  time.sleep(1)
  sec -=1

print("time is over!")
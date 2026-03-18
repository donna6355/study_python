import math

point = (30,20) # x value, y value


#convert list to tuple
rgbColor = [255,254,253]
rgb = tuple(rgbColor)

red, green, blue = rgb
print("red:",red)
print("green:",green)
print("blue:",blue)
print(rgb[2])


# rgb[1] = 200 TypeError: 'tuple' object does not support item assignment


#Fruits practice

# 과일 목록 (과일, 색상)
fruits = [
    ("사과", "빨강"),
    ("바나나", "노랑"),
    ("포도", "보라"),
    ("오렌지", "주황"),
    ("키위", "초록"),
    ("체리", "빨강"),
    ("블루베리", "남색"),
    ("망고", "노랑"),
    ("수박", "초록"),
    ("딸기", "빨강"),
    ("자두", "보라"),
    ("복숭아", "분홍"),
    ("레몬", "노랑"),
    ("라임", "초록"),
    ("아보카도", "초록"),
    ("석류", "빨강"),
    ("용과", "분홍"),
    ("파파야", "주황"),
    ("두리안", "노랑"),
    ("코코넛", "갈색"),
    ("패션프루트", "보라"),
    ("리치", "빨강"),
    ("구아바", "초록"),
    ("자몽", "분홍")
]

for fruit, color in fruits:
  print(fruit,'is',color)



for fruit, color in fruits:
  if color == "주황" :
    print(fruit)


#farest point

points = {
    "A": (3, 4),       # A점
    "B": (-1, 2),      # B점
    "C": (5, -3),      # C점
    "D": (2, -5),      # D점
    "E": (7, 1),       # E점
    "F": (-4, -2),     # F점
    "G": (0, 6),       # G점
    "H": (8, -4),      # H점
    "I": (-3, 5),      # I점
    "J": (4, 7),       # J점
    "K": (-2, -6)      # K점
}
farest = ("",0)

for point in points.keys():
  # distance = math.dist((0,0), points[point])#Farest distance from origin is: 8.94427190999916
  x, y = points[point]
  distance = math.sqrt(x**2 + y**2)
  if distance > farest[1]:
    farest = (point,distance)


print(f"Farest distance {farest[0]} from origin is: {farest[1]}" ) 

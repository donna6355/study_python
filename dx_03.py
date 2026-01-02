fruits = ["apple", "banana", "cherry", "date"]
print(fruits[1])  # Output: banana
print(fruits[-1])  # Output: date

# finde index of an element
print(fruits.index("cherry"))  # Output: 2
# print(fruits.index("melon"))  # Raises ValueError


# modify element
print(fruits[1])
fruits[1] = "pomogranate"
print(fruits[1])

# range of elements
print(fruits[0:2])  # Output: ['apple', 'pomogranate']
print(fruits[:2])  # Output: ['apple', 'pomogranate']
print(fruits[2:4]) # Output: ['cherry', 'date']
print(fruits[2:])# Output: ['cherry', 'date']

train = ["기관차", "식당칸", "침대칸", "화물칸"]

# append로 맨 뒤에 추가
train.append("꼬리칸")     # ["기관차", "식당칸", "침대칸", "화물칸", "꼬리칸"]

# insert로 원하는 위치에 추가
train.insert(1, "일등칸")  # ["기관차", "일등칸", "식당칸", "침대칸", "화물칸", "꼬리칸"]

print(train)

subway = ["아이언맨", "토르", "캡틴아메리카", "블랙위도우", "호크아이"]

# pop으로 마지막 승객 하차
last_passenger = subway.pop()     # "호크아이" 하차
print(last_passenger)
print(subway)

# del로 두 번째 승객 하차
del subway[1]                     # "토르" 하차
print(subway)

# remove로 특정 승객 하차
subway.remove("캡틴아메리카")        # "캡틴아메리카" 하차
print(subway)
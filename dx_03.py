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
first_passenger = subway.pop(0)    # "아이언맨" 하차
print(first_passenger)
print(subway)

# del로 두 번째 승객 하차
del subway[0]                     # "토르" 하차
print(subway)

# remove로 특정 승객 하차
subway.remove("캡틴아메리카")        # "캡틴아메리카" 하차
print(subway)

# clear all elements
subway.clear()
print(subway)  # Output: []


#sort list
numbers = [5, 2, 9, 1, 6]
numbers.sort()
print(numbers)  # Output: [1, 2, 5, 6, 9]

# sort in descending order
numbers.sort(reverse=True)
print(numbers)  # Output: [9, 6, 5, 2, 1]

# copy sort list
nums = [3, 1, 4, 2, 5]
sorted_nums = sorted(nums)
print(sorted_nums)  # Output: [1, 1, 3, 4, 5]
print(nums)         # Original list remains unchanged: [3, 1, 4, 1, 5]


#extend list
one = [1,2,3]
two = [4,5,6]
one.extend(two)
print(one)  # Output: [1, 2, 3, 4, 5, 6]

newlist = one+two
print(newlist)  # Output: [1, 2, 3, 4, 5, 6, 4, 5, 6]

# check element in list
print("Isaac" in subway)  # Output: False

#count total number of element
print(newlist.count(2))  # Output: 1
print(newlist.count(4))  # Output: 1


#practice
numbers = [1,2,3,4,5]
reversed = []
# reversed_numbers = sorted(numbers, reverse=True)

while len(numbers) > 0:
    reversed.append(numbers.pop())

print(numbers)
print(reversed)
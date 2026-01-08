dic = {"name":"Isaac","age":5,"weight":5.6}

print(dic["name"])
print(dic.get("name"))
print(dic.get("address"))  # None

dic["address"] = "123 main St"
print(dic)
del dic["address"]
print(dic)
print(dic.get("address","No Address Found"))

scores = {"math":90,"science":85,"english":88}

scores["math"] = 95
print(scores)
scores.update({"science":89,"art":92})
print(scores)
artScore = scores.pop("art")
print(artScore)
print(scores)
print(scores.keys()) #dict_keys(['math', 'science', 'english'])
print(list(scores.keys())) #['math', 'science', 'english']


# Zoo 
zoo = {
    "사자": 4,
    "호랑이": 3,
    "기린": 7,
    "코끼리": 5,
    "원숭이": 12,
    "팬더": 2,
    "캥거루": 8,
    "코알라": 6,
    "하마": 3,
    "얼룩말": 9,
    "펭귄": 15,
    "악어": 4,
    "뱀": 8,
    "거북이": 12,
    "앵무새": 10,
    "물개": 7,
    "바다사자": 5,
    "수달": 4,
    "재규어": 2,
    "치타": 3,
    "표범": 2,
    "하이에나": 6,
    "기니피그": 20,
    "카멜레온": 6,
    "이구아나": 4,
    "고릴라": 3,
    "침팬지": 5,
    "오랑우탄": 4,
    "기러기": 11,
    "백조": 6,
    "순록": 9,
    "토끼": 25,
    "비버": 4,
    "낙타": 6
}

print("number of penguins:", zoo["펭귄"])
zoo.update({"해달":5})
print(zoo)

print("There is ",zoo["토끼"], "rabbits")
zoo["토끼"] += 3
print("There is ",zoo["토끼"], "rabbits")

del zoo["이구아나"]
print(zoo.get('이구아나',"No Iguana"))


#Student Scores
students_score = {
    "아이언맨": {"수학": 85, "영어": 90, "과학": 95},
    "토르"    : {"수학": 92, "영어": 87, "과학": 70},
    "헐크"    : {"수학": 10, "영어": 80, "과학": 100}
}

students_score["김미르"]= {"수학": 100, "영어": 100, "과학": 100}
print(students_score)

print(students_score["아이언맨"])
students_score["아이언맨"]["영어"] = 95
print(students_score["아이언맨"])

mathTotal = 0
for score in students_score.values():
    mathTotal += score["수학"]
  
print("수학 총점:", mathTotal)
print("수학 평균:", mathTotal / len(students_score))

maxMath = 0
for score in students_score.values():
    if score["수학"] > maxMath:
        maxMath = score["수학"]

print("max math score is", maxMath)
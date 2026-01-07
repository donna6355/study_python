dic = {"name":"Isaac","age":5,"weight":5.6}

print(dic["name"])
print(dic.get("name"))
print(dic.get("address"))  # None


scores = {"math":90,"science":85,"english":88}

scores["math"] = 95
print(scores)
scores.update({"science":89,"art":92})
print(scores)
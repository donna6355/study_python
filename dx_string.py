text = "Good Morning Isaac:)"

for c in text:
  print(c)


print(text.upper())
print(text.lower())
print(text.replace("Morning","Evening"))
print(text.split(" "))
print("-".join(text.replace(" ","")))
print(text.count("o"))
print("Isaac" in text)
print(text.startswith("Evening"))
print(text.endswith(":)"))
print(len(text))

def add(num1, num2):
    return num1+num2

def extractNum(num1, num2):
    import random
    return random.randint(num1, num2)

def inputNum():
    return int(input("input Number"))

def compare(num1, num2):
    if num1>num2 :
        return "DOWN"
    elif num1<num2 :
        return "UP"
    else :
        return "GOTCHA"
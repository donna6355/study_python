import numpy as np

# ndarray : numpy's array
py_list = [1,2,3]

arr1 = np.array(py_list)

print(arr1)
print(type(arr1))

print(arr1[0])

print(arr1[-1])

# only single type array is allowed 
arr2= np.array([10,20,30.123])
print(arr2) #[10.    20.    30.123] => all type is aligned with floating num

arr3 = np.array([1,2.3,"4.5"])
print(arr3) # ['1' '2.3' '4.5'] => all type is aligned with String 


#numpy function

print(np.arange(10)) #[0 1 2 3 4 5 6 7 8 9]
print(np.zeros(5)) #[0. 0. 0. 0. 0.]
print(np.zeros(shape = (2,3))) 
#[[0. 0. 0.]
#[0. 0. 0.]]
print(np.zeros(shape = (2,3,4)))
# [[[0. 0. 0. 0.]
#   [0. 0. 0. 0.]
#   [0. 0. 0. 0.]]

#  [[0. 0. 0. 0.]
#   [0. 0. 0. 0.]
#   [0. 0. 0. 0.]]]

print(np.ones(shape = (2,3)))
# [[1. 1. 1.]
#  [1. 1. 1.]]
print(np.full((2,3),7))
# [[7 7 7]
#  [7 7 7]]

#1부터 10까지 3개의 숫자를 균등한 구간으로 만든다
print(np.linspace(1,10,3)) #[ 1.   5.5 10. ]
print(np.linspace(1,10,4)) #[ 1.  4.  7. 10.]

#random!
# important to statistic and ml, dl
# generate array filling with random num
print(np.random.rand(2,3))

#정규분포 난수에 맞는 array 생성 ** 평균에 가장 많이 분포되어 있다
#평균 0 표준편차 1인 난수 생성
print(np.random.randn(15))

#균등 분포 난수 **구간 내에 일정하게 분포되어 있다
print(np.random.uniform(1,3,size=(4,5)))

#랜검 샘플링
#0-9사이의 정수를 랜덤하게 사이즈에 맞게 생성
#기본이 복원추출이라 중복값 발생 가능
print(np.random.choice(10,size = (2,3)))
#비복원 추출
print(np.random.choice(10,size = (2,3),replace = False))
#정수 랜덤으로 생성
print(np.random.randint(10,100,size=5))



#벡터의 연산
a = np.arange(1,5)
b = np.arange(10,14)
print(a)
print(b)

print(a+b)
print(a-b)
print(a*b) # element wise product [10 22 36 52]
print(a/b)

## 벡터와 벡터의 곱 -> 내적 
## 벡터 내적 활용 -> 유사도 확인에 활용 가능 
print(a@b) # 120 ## 1*10+2*11+3*12+4*13

#transpose row <-> col

#axis 데이터가 추가되는 방향

np.random.seed(42)
arr = np.random.randint(10,100, size = (3,4,3))
print(arr)

#axix = 0 최대값
print(np.max(arr, axis = 0))
print(np.max(arr, axis = 1))
print(np.max(arr, axis = 2))



np.random.seed(42)
arr2 = np.random.randint(12,size= (3,4))
print(arr2)
print(np.min(arr2,axis = 0))
print(np.min(arr2,axis = 1))

#indexing slicing
idxArr = np.arange(1,11).reshape(2,5)
print(idxArr)
print(idxArr[0][3])
print(idxArr[0,3])
print(idxArr[:,3])
print(idxArr[:,1:4])

idxTest =  np.arange(1,37).reshape(3,4,3)
print(idxTest)

print(idxTest[1, 0:2])
print(idxTest[:,1:3,0:2])
print(idxTest[::2,1:3,:2]) ## step ::2 every nth


#facny indexing
fIdxArr =  np.arange(24).reshape(4,3,2)
print(fIdxArr)

indices = [0,3]
print(fIdxArr[indices])

#dimension, shape, size (total element/scalar)
print(fIdxArr.ndim) 
print(fIdxArr.shape) 
print(fIdxArr.size)

#transform shape
x = np.random.randint(15,size =(3,5))
print(x)
print(x.shape)

temp = np.ravel(x) #reference type! 
print(temp)

y = np.random.randint(15,size =(3,5))
tempY = y.flatten() # copy and flatten
print(tempY)

z = np.arange(20)
print(z)
print(z.reshape(2,5,2))
print(z.reshape(2,-1,2)) #wildcard -1 will be auto assigned
print(z.reshape(2,2,-1)) #wildcard -1 will be auto assigned
print(z.reshape(1,-1)) #행벡터로 바꾸기
print(z.reshape(-1,1)) #열벡터로 바꾸기



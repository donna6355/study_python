import matplotlib.pyplot as plt
import numpy as np


# plt.rc("font", family="NanumSquare")

plt.rcParams["font.family"] = "Nanum Gothic"
plt.rcParams["axes.unicode_minus"] = False

# 데이터 생성
# data = np.arange(1, 100)

# CREATE CANVAS
# plt.figure()

# CREATE PLOT
# plt.plot(data**2)
# plt.title("안녕 아이작 미르 킴")

# MULTI PLOTS
## SUBPLOT
# plt.subplot(2, 1, 1)
# plt.plot(data)

# plt.subplot(2, 1, 2)
# plt.plot(data**2)

## SUBPLOTS

# fig, axes = plt.subplots(2, 3)

# axes[0, 0].plot(data)
# axes[0, 1].plot(data**2)
# axes[0, 2].plot(data**3)
# to avoid overlap
# plt.tight_layout()

# plt.show()


# SCATTER : 데이터 X 데이터 분포
# x = np.random.rand(50)
# y = np.random.rand(50)

# colors = np.arange(50)
# area = x * y * 1000
# plt.scatter(x, y, s=area, c=colors)  # 점의 크기 설정(s)  # 점의 색상 설정(c)
# plt.show()

# BARPLOT : 수치 비교할때

# x = ["수학", "과학", "영어", "컴퓨터", "미술", "체육"]
# y = [66, 80, 85, 50, 80, 90]

# # plt.bar(x, y)
# plt.bar(x, y, align="center", alpha=0.7, color="red")

# plt.xticks(x)  # x축에 표시할 값들

# plt.ylabel("점수")
# plt.title("성적")
# plt.show()


# LINE PLOT : X축이 연속적인 값, 시간의 흐름에 따라 변화하는 데이터
# x = np.arange(0, 10, 0.1)
# y = 1 + np.sin(x)  # 각각의 x값에 대한 삼각함수 sin값 만들기

# plt.plot(x, y)

# plt.xlabel("x value (time)")
# plt.ylabel("y value (amplitude)")
# plt.title("sin graph")

# plt.grid()

# plt.show()

# HISTOGRAM : 구간내의 몇명이나 있는지, 고유한 실수값의 경우 의미있는 그래프 생성이 힘들다
# N = 100000  # 데이터의 개수

# # 중요한 변수
# bins = 30  # 범위

# x = np.random.randn(N)

# plt.hist(x, bins=bins)
# plt.show()

# PIE CHART
# labels = ["A", "B", "C", "D", "E", "F"]
# sizes = [20.4, 15.8, 10.5, 9, 7.6, 36.7]
# explode = (0.3, 0, 0, 0, 0, 0)

# patches, texts, autotexts = plt.pie(
#     sizes, explode=explode, labels=labels, autopct="%1.1f%%", shadow=True, startangle=90
# )

# # label 텍스트 스타일링
# for t in texts:
#     t.set_fontsize(12)
#     t.set_color("blue")

# # pie 위의 텍스트에 대한 스타일링
# for t in autotexts:
#     t.set_fontsize(12)
#     t.set_color("white")

# plt.title("파이차트 그려보기!")
# plt.show()


# BOX PLOT
# 기본 데이터
spread = np.random.rand(50) * 100  # 최소 0, 최대 100
center = np.ones(25) * 50

# high : 최대, low : 최소
flier_high = np.random.rand(10) * 100 + 100  # 최소 100 ~ 최대 200
flier_low = np.random.rand(10) * -100  # 최소 -100 ~ 최대 0

# 위에서 만든 4가지 데이터를 모두 합치기
data = np.concatenate([spread, center, flier_high, flier_low])

# 이걸 설정하면 음수가 잘 나옵니다!
plt.rcParams["axes.unicode_minus"] = False

plt.boxplot(data)
plt.show()

# 1Q ~ 3Q : IQR (Inter Quantile Range 정상범위)

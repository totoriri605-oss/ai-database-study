# AX_2회차 Ch1 과제
# Python 기초 과제


# =========================
# Part 1. 리스트와 반복문을 이용한 데이터 처리
# =========================

scores = [65, 80, 92, 55, 88]

count = 0

for score in scores:
    if score >= 80:
        count += 1

print("=== Part 1 ===")
print("전체 점수:", scores)
print("80점 이상인 점수의 개수:", count)


# =========================
# Part 2. 딕셔너리를 이용한 단어 빈도 분석
# =========================

sentence = """
파이썬 공부는 재미있다
파이썬 공부는 어렵지만 재미있다
데이터 분석에도 파이썬을 사용한다
파이썬 공부를 계속하면 실력이 늘어난다
"""

# 문장을 단어 단위로 나누기
words = sentence.split()

# 단어별 등장 횟수를 저장할 빈 딕셔너리
word_count = {}

for word in words:
    if word in word_count:
        word_count[word] += 1
    else:
        word_count[word] = 1

print("\n=== Part 2 ===")
print("전체 단어 빈도:")

for word, count in word_count.items():
    print(f"{word} : {count}회")

print("\n2회 이상 등장한 단어:")

for word, count in word_count.items():
    if count >= 2:
        print(f"{word} : {count}회")


# =========================
# Part 3. 함수로 반복되는 코드 정리하기
# =========================

def count_words(sentence):
    words = sentence.split()
    word_count = {}

    for word in words:
        if word in word_count:
            word_count[word] += 1
        else:
            word_count[word] = 1

    return word_count


def print_words_over_count(word_count, minimum_count):
    for word, count in word_count.items():
        if count >= minimum_count:
            print(f"{word} : {count}회")


result = count_words(sentence)

print("\n=== Part 3 ===")
print("함수로 계산한 결과:")
print(result)

print("\n2회 이상 등장한 단어:")
print_words_over_count(result, 2)


# =========================
# Part 4. 오류 확인 및 예외처리
# =========================

print("\n=== Part 4 ===")

try:
    user_count = int(input("몇 회 이상 등장한 단어를 찾을까요? : "))

    print(f"\n{user_count}회 이상 등장한 단어:")

    print_words_over_count(result, user_count)

except ValueError:
    print("숫자를 입력해주세요.")


# =========================
# 도전 문제
# 가장 많이 등장한 단어 찾기
# =========================

max_word = ""
max_count = 0

for word, count in result.items():
    if count > max_count:
        max_count = count
        max_word = word

print("\n=== 도전 문제 ===")
print(f"가장 많이 등장한 단어: {max_word} ({max_count}회)")


#1. for 반복문은 이 프로그램에서 어떤 역할을 하나요?
#리스트나 단어 목록에 들어 있는 값을 하나씩 꺼내서 확인하고 처리하는 역할을 합니다.

#2. 딕셔너리의 Key와 Value에는 각각 무엇이 저장되나요?
#Key에는 단어가 저장되고 Value에는 해당 단어가 등장한 횟수가 저장됩니다.

#3. 같은 단어가 다시 등장하면 딕셔너리 값은 어떻게 달라지나요?
#이미 딕셔너리에 있는 단어라면 기존 등장 횟수에 1을 더합니다.

#4. 함수를 사용하는 이유는 무엇인가요?
#반복해서 사용하는 코드를 하나로 묶어서 필요할 때 다시 사용할 수 있고,코드를 보기 쉽고 관리하기 쉽게 만들 수 있기 때문입니다.

#5. AI를 사용했다면 AI가 제안한 코드에서 직접 확인하거나 수정한 부분은 무엇인가요?
#AI의 도움을 받아 코드를 작성했지만 직접 실행하면서 변수의 역할과 반복문,조건문의 동작을 확인했습니다.
#특히 print(count)의 들여쓰기에 따라 반복할 때마다 결과가 출력되는 것을 확인했고,최종 결과만 출력하기 위해 반복문 밖으로 위치를 수정했습니다.
#또한 words 변수를 만들지 않아 NameError가 발생했을 때 오류 메시지를 확인하고sentence.split()을 사용해 words 변수를 먼저 생성하도록 수정했습니다.
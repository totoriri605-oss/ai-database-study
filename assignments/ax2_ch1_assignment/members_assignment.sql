-- AX_2회차 Ch1 과제
-- SQL & Database 기초 과제


-- ========================================
-- Part 1. Schema와 Table 만들기
-- ========================================

CREATE SCHEMA IF NOT EXISTS practice;

DROP TABLE IF EXISTS practice.members;

CREATE TABLE practice.members (
    member_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INTEGER,
    joined_at DATE
);


-- ========================================
-- Part 2. INSERT
-- 회원 데이터 5명 입력
-- ========================================

INSERT INTO practice.members
(name, email, age, joined_at)
VALUES
('김민수', 'minsu@example.com', 25, '2026-08-01'),
('이수진', 'sujin@example.com', 31, '2026-08-05'),
('박지훈', 'jihoon@example.com', 22, '2026-08-10'),
('최유진', 'yujin@example.com', 28, '2026-08-15'),
('정하늘', 'haneul@example.com', 19, '2026-08-20');


-- 전체 회원 조회

SELECT *
FROM practice.members;


-- 이름과 이메일만 조회

SELECT name, email
FROM practice.members;


-- 25세 이상 회원 조회

SELECT *
FROM practice.members
WHERE age >= 25;


-- 특정 이름의 회원 조회

SELECT *
FROM practice.members
WHERE name = '김민수';


-- 나이가 많은 순서로 조회

SELECT *
FROM practice.members
ORDER BY age DESC;


-- 가입일 순서로 조회

SELECT *
FROM practice.members
ORDER BY joined_at ASC;


-- ========================================
-- Part 3. UPDATE와 DELETE
-- ========================================

-- 수정 전 확인

SELECT *
FROM practice.members
WHERE member_id = 1;


-- member_id가 1인 회원 나이를 30세로 수정

UPDATE practice.members
SET age = 30
WHERE member_id = 1;


-- 수정 결과 확인

SELECT *
FROM practice.members
WHERE member_id = 1;


-- 삭제 전 확인

SELECT *
FROM practice.members
WHERE member_id = 5;


-- member_id가 5인 회원 삭제

DELETE FROM practice.members
WHERE member_id = 5;


-- 삭제 후 전체 데이터 확인

SELECT *
FROM practice.members;


-- ========================================
-- Part 4. 집계 함수
-- ========================================

-- 전체 회원 수

SELECT COUNT(*) AS total_members
FROM practice.members;


-- 회원 평균 나이

SELECT AVG(age) AS average_age
FROM practice.members;


-- 가장 나이가 많은 회원의 나이

SELECT MAX(age) AS max_age
FROM practice.members;


-- 가장 나이가 어린 회원의 나이

SELECT MIN(age) AS min_age
FROM practice.members;


-- 25세 이상 회원 수

SELECT COUNT(*) AS members_over_25
FROM practice.members
WHERE age >= 25;


-- ========================================
-- 도전 문제
-- 가장 최근에 가입한 회원
-- ========================================

SELECT *
FROM practice.members
ORDER BY joined_at DESC
LIMIT 1;


-- 평균 나이보다 나이가 많은 회원

SELECT *
FROM practice.members
WHERE age > (
    SELECT AVG(age)
    FROM practice.members
);


-- 조건 2개 함께 사용
-- 25세 이상이면서 2026-08-10 이후 가입한 회원

SELECT *
FROM practice.members
WHERE age >= 25
AND joined_at >= '2026-08-10';


#1.PRIMARY KEY는 왜 필요한가요?
#테이블 안에서 각각의 행을 중복 없이 정확하게 구분하기 위해 필요합니다.


#2. WHERE 없이 UPDATE 또는 DELETE를 실행하면 어떤 문제가 발생할 수 있나요?

#특정 데이터만 수정하거나 삭제하려고 했는데테이블의 모든 행이 수정되거나 삭제될 수 있습니다.


#3. SELECT *와 필요한 컬럼만 선택하는 SQL의 차이는 무엇인가요?

#SELECT *는 테이블의 모든 컬럼을 조회하고,필요한 컬럼 이름을 지정하면 원하는 컬럼만 조회할 수 있습니다.

#원본 테이블의 데이터가 삭제되는 것은 아니고 조회 결과에 보이는 컬럼만 달라집니다.


#4. COUNT()와 AVG()는 각각 어떤 값을 계산하나요?
#COUNT()는 조건에 맞는 데이터의 개수를 계산하고, AVG()는 숫자 값의 평균을 계산합니다.


#5. Python에서 데이터를 처리하는 것과 DB에서 SQL로 데이터를 조회하는 것의 차이를 어떻게 이해했나요?

#Python은 프로그램 안에서 리스트나 딕셔너리 등의 데이터를 반복문과 조건문으로직접 처리할 수 있습니다.

#SQL은 데이터베이스에 저장된 데이터를 조건에 따라 조회하거나 추가, 수정, 삭제하는 데 사용합니다.

#둘 다 데이터를 처리하지만 Python은 프로그램의 처리 로직을 작성하는 데 사용하고, SQL은 데이터베이스에 저장된 데이터를 관리하고 조회하는 데 사용한다고 이해했습니다.
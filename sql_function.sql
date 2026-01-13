-- substring
select emp_id,
       birth_date,
       substr(
          birth_date,
          1,
          4
       )
  from emp;

-- replace string
select member_id,
       member_name,
       address,
       replace(
          address,
          ' ',
          ''
       ) as 주소,
       replace(
          address,
          ' ',
          '##'
       ) as 주소
  from lg_member;

-- index of char in string
select member_id,
       member_name,
       email,
       instr(
          email,
          '@'
       ) as "@사인위치값"
  from lg_member;

select member_id,
       member_name,
       email,
       instr(
          email,
          '@'
       ) as "@사인위치값",
       substr(
          email,
          instr(
             email,
             '@'
          ) + 1
       ) as 사용메일종류
  from lg_member;

select 사용메일종류,
       count(*) as 개수
  from (
   select member_id,
          member_name,
          email,
          instr(
             email,
             '@'
          ) as "@사인위치값",
          substr(
             email,
             instr(
                email,
                '@'
             ) + 1
          ) as 사용메일종류
     from lg_member
)
 group by 사용메일종류
 order by 개수 desc;



 -- practice #1 
 -- 1번) EMP테이블에서 BIRTH_DATE를 토대로 각각 년,월,일 컬럼을 만드시오. [힌트 : SUBSTR] 

select emp_id,
       birth_date,
       substr(
          birth_date,
          1,
          4
       ) as 년,
       substr(
          birth_date,
          5,
          2
       ) as 월,
       substr(
          birth_date,
          7,
          2
       ) as 일
  from emp;

  --PRACTICE #2
  --2번) PRODUCT_REVIEW 테이블에서 RATING(평점) 과 함께 리뷰를 10자까지만 출력하고 
  --뒤에는 ‘…’ 을 붙여 리뷰요약 컬럼을 가공하시오. 추가로 원본 리뷰도 함께 출력되도록 하시오. 
  --(출력은 3274개로 스크롤 쭉 내리시면 계속 나와요)
select rating,
       substr(
          review_text,
          1,
          10
       )
       || '...' as 리뷰요약,
       review_text as 리뷰원본
  from product_review;

  -- practice #3
  -- 3번) DEPT 테이블의 DEPT_EN_NAME 컬럼의 값을 모두 대문자로 바꾸시오
select dept_en_name,
       upper(dept_en_name) as 대문자부서명
  from dept;

  -- practice #4
  -- 4번) [심화] LG_MEMBER 테이블을 활용하여 사용자의 휴대폰 연락처 중간 4자리만 추출해주세요. 
  -- (단, 휴대폰번호가 000-0000-0000 형태와 00000000000 형태가 둘다 들어있다고 가정합니다. 
  -- 하나의 상태로 통일이 필요하겠죠? ) [힌트 : REPLACE, SUBSTR 중첩]

select member_id,
       member_name,
       phone_number,
       substr(
          replace(
             phone_number,
             '-',
             ''
          ),
          4,
          4
       ) as 휴대폰중간4자리
  from lg_member;


-- 문자형('1')을 숫자형(1) 로 형변환해 출력 
select to_number('1')
  from dual;

--숫자형(1)을 문자형('1') 로 형변환해 출력 
select to_char(1)
  from dual;

select to_char(
   sysdate,
   'YYYY/MM/DD HH24:MI'
)
  from dual;
select to_char(
   sysdate,
   'YYYYMMDD'
)
  from dual;

select to_date('20230101','YYYY/MM/DD')
  from dual;

select to_date('2023010114','YYYY/MM/DD HH24')
  from dual;

select to_date('20230101141212','YYYY/MM/DD HH24:MI:SS')
  from dual; 

/* 포매팅은 중요한 개념입니다 */ 
/*
YYYY : 연도 4자리 
MM : 월 2자리 
DD : 일 2자리 
HH : 시간 (12시간제)
HH24 : 시간 (24시간제) 
MI : 분 (0~59)
SS : 초 (0~59) 
*/

select emp_id,
       retire_yn,
       retire_date,
       nvl(
          retire_date,
          to_date('99991231')
       ) as 퇴사일시
  from emp;
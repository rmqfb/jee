-- DDL테이블 생성 --
create table MEMBER(
    MEMBERID varchar2(10), -- primary key, -- 간편하게 추가하는데 이렇게 작성하지만, 비추
    PASSWORD varchar2(10) unique,  -- unique는 되도록 주지 말자. - db가 뻗(?)을수가 있으므로.. 
    NAME varchar2(20) not null,  -- null 값을 허용하지 않음
    EMAIL varchar2(80), -- not null 이 없으면 null값 허용
    constraint member_pk primary key(memberid),
     constraint member_fk_address foreign key(addressid)  
     references ADDRESS(addressid)
);
commit; 

create table ADDRESS(
	address varchar2(10),
	constraint address_pk primary key(addressid)
);

-- DDL 테이블 삭제
drop table member; commit;   -- table 삭제 --

-- DML 데이터 삽입(1) --
insert into member(memberid, password, name, email)
values('hong','hong','홍길동','hong@naver.com'); commit;  -- 대소문자를 구분하지 않고, "" 를 사용하지 않는다 무조건 '' 를 사용한다. --

-- DML 데이터 삽입(2) --
insert into member
values('hong2','hong2','홍길동2','hong2@naver.com'); commit;

-- DML 데이터 삽입(3) .. 널(null)인 값이 있을 경우--
insert into member(memberid, password, name) -- memberid,password,name 은 컬럼명 이라 한다
values('hong2','hong2','홍길동2'); commit;

-- DML 데이터 조회 --select 에서는 commit을 작성해줄 필요가 없다. db에서 select는 java에서 system.out.println(member); 와 같은 형태이다.
select * from member;

-- DML 데이터 조회(where 절 사용)
select * from member where name='홍길동';


-- DML 두가지 조건을 가지고 검색
select * from member
where name = '홍길동' and email = 'hong@naver.com'; 

-- DML 같지 않을 때 검색
select * from member
where email is null;

-- DML null이 아닌 경우
select * from member
where email is not null;

-- DML 조건 검색 like  
select * from member
where name like '홍%';  -- (이름이 홍으로 시작되는 사람 검색)

select * from member
where name like '%길%';

-- DML 정렬
select * from member    -- 이름에 가운데 글자가 길 인 사람을 오름차순으로 정렬
where name like '%길%'
order by name asc;  -- ㄱ.ㄴ.ㄷ...오름차순  order by 는 제일 마지막에 실행한다.

select * from member
where name like '%길%'
order by name desc; -- ㅎ.ㅍ.ㅌ...내림차순

-- DML 중복정렬
select * from member
order by name asc, memberid asc;

-- DML 내장된 함수
select count(*) from member;
-- count()은 인스턴스(row)의 수량을 출력함
-- 그런데 파라미터 자리에 * count(*) 이 오면
-- 전체 개수를 리턴

-- DML 데이터 수정
update member
set name = '최길동'
where memberid='park' and email is null; commit;

update member 
set name = '최길동', password='', memberid='choi'  -- 바꿀 내용이 한개 이상일 경우 , 를 사용
where memberid='park' and email is null; commit;

update member
set memberid = 'kim2'
where name like '김철%'; commit;

-- DML 데이터 삭제
-- 테이블 삭제 drop 이고 데이터 삭제 delete 이다.
-- 차이는 클래스를 제거하든지 인스턴스를 제거하는 차이

delete from member
where email is null; commit;

-- DDL 테이블 수정
-- 컬럼을 추가하는 구문
alter table member
add age number; commit;

-- 컬럼명 바꾸기
alter table member
rename column memeberid to id;  -- 원래 컬럼명 to 바꿀 컬럼명
commit;

-- 컬럼을 삭제하는 구문
alter table member
drop column age; commit;

-- 컬럼의 유형을 변경
alter table member
modify age varchar2(10); commit;

-- 컬럼 출력
desc member;

-- 인스턴스 간의 값을 식별할 수 있는 유일한 값이 필요하다.
-- => 제약조건(constraint)
-- 1. null or not null
-- 2. unique or not unique
-- 3. check() 예) boolean 이면 참, 거짓.... 남/여
-- 4. not null + unique => primary key(기본키) PK
-- 5. 참조값 : 관계정의에 필요한 키값 => foregin key(외래키) FK
-- 				=> 상속(부모-자식) >> 이해를 돕기위해 이렇게 작성>> 원래는 상속이라 하지 않음

-- primary key 추가 하기
alter table member
add constraint member_pk primary key(memberid); commit;  -- member_pk >> 테이블명_pk 로 주는거로 약속

-- pk 삭제
alter table member
drop primary key; commit;

-- pk 조회
select table_name, constraint_name, constraint_type
from user_constraints
where table_name = 'MEMBER'; -- 주의!! 대문자




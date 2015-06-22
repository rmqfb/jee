-- 테이블 생성 --
create table MEMBER(
    MEMBERID varchar2(10),
    PASSWORD varchar2(10),
    NAME varchar2(20),
    EMAIL varchar2(80)
);
commit; 

drop table member; commit;   -- table 삭제 --

-- 데이터 삽입(1) --
insert into member(memberid, password, name, email)
values('hong','hong','홍길동','hong@naver.com'); commit;  -- 대소문자를 구분하지 않고, "" 를 사용하지 않는다 무조건 '' 를 사용한다. --

-- 데이터 삽입(2) --
insert into member
values('hong2','hong2','홍길동2','hong2@naver.com'); commit;

-- 데이터 삽입(3) .. 널(null)인 값이 있을 경우--
insert into member(memberid, password, name) -- memberid,password,name 은 컬럼명 이라 한다
values('hong2','hong2','홍길동2'); commit;

-- 데이터 조회 --select 에서는 commit을 작성해줄 필요가 없다. db에서 select는 java에서 system.out.println(member); 와 같은 형태이다.
select * from member;

-- 데이터 조회(where 절 사용)
select * from member where name='홍길동';


-- 두가지 조건을 가지고 검색
select * from member
where name = '홍길동' and email = 'hong@naver.com'; 

-- 같지 않을 때 검색
select * from member
where email is null;

-- null이 아닌 경우
select * from member
where email is not null;

-- 조건 검색 like  
select * from member
where name like '홍%';  -- (이름이 홍으로 시작되는 사람 검색)

select * from member
where name like '%길%';

-- 정렬
select * from member    -- 이름에 가운데 글자가 길 인 사람을 오름차순으로 정렬
where name like '%길%'
order by name asc;  -- ㄱ.ㄴ.ㄷ...오름차순  order by 는 제일 마지막에 실행한다.

select * from member
where name like '%길%'
order by name desc; -- ㅎ.ㅍ.ㅌ...내림차순

-- 중복정렬
select * from member
order by name asc, memberid asc;

-- 내장된 함수
select count(*) from member;
-- count()은 인스턴스(row)의 수량을 출력함
-- 그런데 파라미터 자리에 * count(*) 이 오면
-- 전체 개수를 리턴

-- 데이터 수정
update member
set name = '최길동'
where memberid='park' and email is null; commit;

update member 
set name = '최길동', password='', memberid='choi'  -- 바꿀 내용이 한개 이상일 경우 , 를 사용
where memberid='park' and email is null; commit;

-- 데이터 삭제
-- 테이블 삭제 drop 이고 데이터 삭제 delete 이다.
-- 차이는 클래스를 제거하든지 인스턴스를 제거하는 차이

delete from member
where email is null; commit;

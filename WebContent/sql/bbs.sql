-- bbs.sql
-- 답변형 게시판

-- 테이블 생성
create table tb_bbs(
  bbsno    number(5)       not null -- 일련번호 -99999~99999
 ,wname    varchar2(20)    not null -- 작성자
 ,subject  varchar2(100)   not null -- 글제목
 ,content  varchar2(2000)  not null -- 글내용
 ,passwd   varchar2(10)    not null -- 글비밀번호
 ,readcnt  number(5)       default 0 not null -- 글조회수
 ,regdt    date            default  sysdate -- 글작성일
 ,grpno    number(5)       not null  -- 글 그룹번호
 ,indent   number(5)       default 0 -- 들여쓰기
 ,ansnum   number(5)       default 0 -- 글순서
 ,ip       varchar2(15)    not null -- 글 IP
 ,primary key(bbsno)                --bbsno 기본키 
);

-- 새글쓰기
bbsno : max(bbsno)+1
wname, subject, content, passwd : 사용자입력
default 값 : readcnt, regdt, indent, ansnum
grpno : max(bbsno)+1
ip : request내부객체에서 사용자 PC의 IP정보를 가져옴

-- 행추가 테스트
insert into tb_bbs(bbsno, wname, subject, content, passwd, grpno, ip, regdt)
values(bbsno_seq.nextval,'지나지나','어피치','튜브조아','1234'
          ,(select nvl(max(bbsno),0)+1 from tb_bbs),'127.0.0.1', sysdate);



-- 답글쓰기


-- 시퀀스 생성
create sequence bbsno_seq;


--레코드 조회
select * from tb_bbs
ORDER BY grpno DESC, ansnum ASC;

-- 테이블 삭제
drop table tb_bbs;

-- 시퀀스 삭제
drop sequence bbsno_seq;

-- 목록
select * from tb_bbs order by grpno desc, ansnum asc;

-- 글목록(bbsList.jsp/list()함수)
select bbsno, wname, subject, readcnt, indent, regdt from tb_bbs
order by grpno desc, ansnum asc;

-- 상세보기(bbsRead.jsp/read()함수)
select bbsno, wname, subject, content, readcnt, grpno, ip, regdt
from tb_bbs
where bbsno=?;

-- 조회수 증가
update tb_bbs
set readcnt=readcnt+1
where bbsno=?;

-- 답변쓰기
1) 부모글 정보 가져오기(select문)
select grpno, indent, ansnum
from tb_bbs
where bbsno=?;


2) 글순서 재조정(update문)
update tb_bbs
set ansnum=ansnum+1
where grpno=1 and ansnum>=3

3) 답변글 추가(insert문)
insert into tb_bbs(wname, subject, content, passwd, ip, grpno, indent, ansnum)
values ();


-- 삭제
delete from tb_bbs
where passwd=? and bbsno=?;


-- 수정
-- 비밀번호가 일치하면 수정하고자 하는 글을 가져와서 수정폼에 출력하고
-- 작성자, 제목, 내용, 비밀번호를 수정한다
--1) bbsUpdate.jsp
	-- 비밀번호 입력폼 작성

--2) bbsUpdateForm.jsp
	-- 비밀번호와 글번호가 일치하는 글을 DB에서 가져오기
	SELECT wname, subject, content, passwd
	FROM tb_bbs
	WHERE passwd=? AND bbsno=?
	
--3) 2)의 정보를 수정폼에 출력

--4) bbsUpdateProc.jsp
	-- 사용자가 다시 입력한 내용을 DB에서 수정하기
	UPDATE tb_bbs
	SET wname=?, subject=?, content=?, passwd=?, ip=?
	WHERE bbsno=?
	-- 수정이 완료되면 목록페이지로 이동


--검색
-- 제목에 무궁화 단어가 있는 레코드 검색
SELECT *
FROM tb_bbs
WHERE subject LIKE '%무궁화%';

































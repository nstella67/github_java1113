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


--190119
--페이징
--rownum(줄번호) 활용

1)
from tb_bbs
order by grpno desc, ansnum asc;

2) rownum 추가
SELECT bbsno, subject, grpno, ansnum, rownum
FROM tb_bbs
ORDER BY grpno DESC, ansnum ASC;

3)
SELECT aa.bbsno, aa.subject, aa.grpno, aa.ansnum, rownum
FROM (
	SELECT bbsno, subject, grpno, ansnum, rownum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
) aa;

4) alias 생략가능
SELECT bbsno, subject, grpno, ansnum, rownum
FROM (
	SELECT bbsno, subject, grpno, ansnum, rownum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
);

5) 줄번호 1~3 검색 - 1페이지
SELECT bbsno, subject, grpno, ansnum, rownum
FROM (
	SELECT bbsno, subject, grpno, ansnum, rownum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
)
WHERE rownum>=1 AND rownum<=3
;

6) 줄번호 4~6 검색 - 2페이지
SELECT bbsno, subject, grpno, ansnum, rownum
FROM (
	SELECT bbsno, subject, grpno, ansnum, rownum
	FROM tb_bbs
	ORDER BY grpno DESC, ansnum ASC
)
WHERE rownum>=4 AND rownum<=6
;
--안나옴

7) 줄번호 4~6 검색 - 2페이지 다시검색
SELECT bbsno, subject, grpno, ansnum, rnum
FROM (
	SELECT bbsno, subject, grpno, ansnum, rownum AS rnum
	FROM (
		SELECT bbsno, subject, grpno, ansnum
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	) aa
) bb
WHERE rnum>=4 AND rnum<=6
;

8) alias 생략 가능
SELECT bbsno, subject, grpno, ansnum, rnum
FROM (
	SELECT bbsno, subject, grpno, ansnum, rownum AS rnum
	FROM (
		SELECT bbsno, subject, grpno, ansnum
		FROM tb_bbs
		ORDER BY grpno DESC, ansnum ASC
	) 
) 
WHERE rnum>=4 AND rnum<=6
;

9) 페이징 + 검색
	제목에 '솔데스크' 검색
SELECT bbsno, subject, grpno, ansnum, rnum
FROM (
	SELECT bbsno, subject, grpno, ansnum, rownum AS rnum
	FROM (
		SELECT bbsno, subject, grpno, ansnum
		FROM tb_bbs
		WHERE subject LIKE '%솔데스크%';
		ORDER BY grpno DESC, ansnum ASC
	)
)
WHERE rnum>=4 AND rnum<=6
;


SELECT * FROM TB_BBS
WHERE indent=0
;



SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent, ansnum, r
FROM(
	SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent, ansnum, rownum AS r
	FROM (
		SELECT bbsno, wname, subject, readcnt, regdt, grpno, indent, ansnum
		FROM tb_bbs
		WHERE indent=0
		ORDER BY grpno DESC, ansnum ASC
	)
)
WHERE r >= 1 AND r <= 20;

SELECT * FROM TB_BBS;



--[댓글 갯수 구하기]
-- 출력결과
  부모글제목	답변갯수	조회수	작성자	작성일
  안녕하세요	(1)
  김연아			(2)
--1)
SELECT subject, grpno, indent, ansnum
FROM tb_bbs
ORDER BY grpno DESC
;
--2) grpno가 동일한 레코드를 그룹화하고 갯수 구하기
SELECT grpno, COUNT(grpno) as cnt
FROM tb_bbs
GROUP BY grpno
;
--3) 2)에서 나온 갯수는 부모글+자식글이므로 갯수에서 -1을 한다 
SELECT grpno, COUNT(grpno)-1 as cnt
FROM tb_bbs
GROUP BY grpno
;

--4)  3)의 논리적테이블에 셀프조인해서 최초 부모글 제목 가져오기
SELECT  bb.bbsno bbsno, bb.subject subject, aa.grpno grpno, aa.cnt cnt
	FROM(
	SELECT grpno, COUNT(grpno)-1 as cnt
	FROM tb_bbs
	GROUP BY grpno) aa JOIN tb_bbs bb
ON aa.grpno=bb.grpno
WHERE bb.indent=0		--최초 부모글
ORDER BY grpno DESC
;


SELECT bbsno, subject, wname, readcnt, regdt, grpno, cnt, rnum
FROM (
	SELECT bbsno, subject, wname, readcnt, regdt, grpno, cnt, rownum as rnum
	FROM (
		SELECT bb.bbsno, bb.subject, bb.wname, bb.readcnt, aa.grpno, aa.cnt, bb.regdt
		FROM(
			SELECT grpno, COUNT(grpno)-1 as cnt
			FROM tb_bbs
			GROUP BY grpno
			) aa JOIN tb_bbs bb
		ON aa.grpno=bb.grpno
		WHERE bb.indent=0
		ORDER BY grpno DESC
	)
)
WHERE rnum>=1 AND rnum<=30 AND cnt!=0
;























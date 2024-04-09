-- 1번.
SELECT Email AS 'email'
     , Mobile AS 'mobile' 
	 , Names AS 'names'
	 , Addr AS 'addr'
  FROM membertbl
 ORDER BY addr DESC, email ASC;

-- 2번.
SELECT Names AS '도서명'
     , Author AS '저자'
	 , ISBN
	 , Price AS '정가'
  FROM bookstbl
 ORDER BY Price DESC;

-- 3번.
SELECT Names AS '회원명'
     , Levels AS '회원등급'
	 , Addr AS '회원주소'
	 , rentalDate AS '대여일'
  FROM membertbl AS m LEFT OUTER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 WHERE m.memberIdx NOT IN(SELECT DISTINCT memberIdx FROM rentaltbl)
 ORDER BY Levels ASC;

-- 4번.
SELECT d.[Names] AS '책 장르'
	 , FORMAT(SUM(b.Price), '#,#') + ' 원' AS '총합계금액'
  FROM divtbl AS d, bookstbl AS b
 WHERE d.Division = b.Division
 GROUP BY d.[Names]
 ORDER BY d.[Names] ASC;
   
-- 5번.
SELECT ISNULL(d.[Names], '--합계--') AS '책 장르'
	 , COUNT(d.[Names]) AS '권수'
	 , FORMAT(SUM(b.Price), '#,#') + ' 원' AS '총합계금액'
  FROM divtbl AS d, bookstbl AS b
 WHERE d.Division = b.Division
 GROUP BY d.[Names] WITH ROLLUP;
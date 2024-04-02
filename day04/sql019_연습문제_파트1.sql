-- 1. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT name 
  FROM Customer, Orders, Book
 WHERE c.custid = o.custid
 

-- 2. 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
SELECT name 
  FROM Customer, Orders, Book

-- 3. 전체 고객의 30% 이상이 구매한 도서

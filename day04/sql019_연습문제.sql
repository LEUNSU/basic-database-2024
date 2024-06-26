-- 1. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT DISTINCT custid
  FROM Orders
 WHERE bookid IN (
SELECT bookid
  FROM Book
 WHERE publisher IN (SELECT b.publisher
                       FROM Customer AS c, Orders AS o, Book AS b
                      WHERE c.custid = o.custid
                        AND b.bookid = o.bookid
                        AND c.[name] = '박지성'));

-- 2. 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름


-- 3. 전체 고객의 30% 이상이 구매한 도서
SELECT b.bookname, COUNT(b.bookname)
FROM ORDERS O, BOOK B
WHERE o.bookid = b.bookid
GROUP BY b.bookname
HAVING COUNT(b.bookname) >= (
                            SELECT (COUNT(*) * 0.3)
                            FROM customer);

-- 4. 새로운 도서('스포츠 세계', '대한미디어', 10000원)가 마당서점에 입고되었다. 삽입이 안 될 때 필요한 데이터가 더 있는지 찾아보시오
INSERT INTO Book(bookid, bookname, publisher, price)
    VALUES(14, '스포츠 세계', '대한미디어', 10000);

-- 5. '삼성당'에서 출판한 도서를 삭제하시오.
DELETE FROM Book
 WHERE publisher = '삼성당';

-- 6. '이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안 되면 원인을 생각해 보시오.
-- 참조 제약조건에 걸리기 때문에 삭제 불가
-- 삭제하려면 Orders 테이블에서 bookid 7, 8을 삭제 후 삭제 기능
DELETE FROM Book
 WHERE publisher = '이상미디어';

-- 7. 출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오.
UPDATE Book
   SET publisher = '대한출판사'
 WHERE publisher = '대한미디어';

SELECT *
  FROM Book;

UPDATE Book
   SET publisher = '대한출판사'
 WHERE bookid IN (SELECT bookid
                    FROM Book
                   WHERE publisher = '대한미디어')
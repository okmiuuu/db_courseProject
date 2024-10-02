DROP VIEW V_BOOKS_WITH_AUTHORS;

CREATE VIEW V_BOOKS_WITH_AUTHORS
AS SELECT B.ID, B.NAME AS BOOK_NAME, B.PICTURE, B.DESCRIPTION,
          B.QUANTITY_ON_STOCK, B.COST, B.GENRE, 
          B.GRADE, B.PUBLISHER, GET_ALL_AUTHORS_FOR_BOOK(B.ID) AS AUTHORS
FROM BOOKS B
WHERE B.AVAILABILITY = 1
WITH CHECK OPTION;

DROP VIEW V_ORDERS_WITH_BOOKS;

CREATE VIEW V_ORDERS_WITH_BOOKS
AS SELECT O.ID, O.CLIENT, O.COST, O.STATUS,
          O.MANAGER, O.SHIPPING_WAY, O.ORDER_DATE,
          GET_ALL_BOOKS_FOR_ORDER(O.ID) AS BOOKS
FROM ORDERS O 
WHERE O.STATUS != 'cancelled' 
WITH CHECK OPTION;

SELECT * FROM V_ORDERS_WITH_BOOKS;
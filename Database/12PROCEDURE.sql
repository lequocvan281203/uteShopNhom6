DELIMITER $$
CREATE PROCEDURE updateAmount(id BIGINT,SL int)
BEGIN
   update product set Amount = Amount + SL where ProductID=id;
END; $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE updateAmountWhenRevertStatus(id BIGINT,SL int)
BEGIN
   update product set Amount = Amount - SL where ProductID=id;
END; $$
DELIMITER ;


SELECT product.ProductID, product.ProductName, product.Price, SUM(Q.Quantity) AS Amount
FROM (
    SELECT orderitem.ProductID, product.ProductName, product.Price, orderitem.Quantity
    FROM orderitem
    INNER JOIN bill ON orderitem.BillID = bill.BillID
    INNER JOIN product ON orderitem.ProductID = product.ProductID
    WHERE bill.status = 1
) Q
right outer JOIN product ON Q.ProductID = product.ProductID
GROUP BY product.ProductID, product.Price,product.ProductName;
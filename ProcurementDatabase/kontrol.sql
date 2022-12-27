USE AmunProcurement


SELECT * FROM DeliveryPoint ORDER BY Id
SELECT * FROM EnglishName6 ORDER BY Id
SELECT * FROM CarryingWay_POCa1 ORDER BY Id
SELECT * FROM ContractPrice_PrCo1 ORDER BY Id
SELECT * FROM CurrentStatus_PrCu ORDER BY Id
SELECT * FROM DeliveryDate_PoDe1 ORDER BY Id
SELECT * FROM DeliveryTime2 ORDER BY Id
SELECT * FROM PO_Number5 ORDER BY Id
SELECT * FROM ProjectName0 ORDER BY Id




--What are the delivery points according to the english  name?
SELECT a.EnglishName, a.ProjectName, b.DeliveryPoint, b.PO_Number, SUM(PO_Number) as countofpo
FROM EnglishName6 a,             DeliveryPoint b
WHERE a.Id=b.Id
GROUP BY a.EnglishName, a.ProjectName, b.DeliveryPoint, b.PO_Number
ORDER BY countofpo



-- What is the contract price of PO_Number of "4500356368" project?


SELECT a.PO_Number , b.ProjectName, b.ContractPrice, b.ContractPriceCurrency
FROM DeliveryTime2 a
JOIN ContractPrice_PrCo1 b ON a.Id=b.Id
WHERE PO_Number= 4500356368


-- What is the delivery date of PO_Number of "4500356368" project?
SELECT PO_Number, ProjectName,  DeliveryDate
FROM DeliveryDate_PoDe1
WHERE PO_Number = 4500356368


--What is the carrying way of project named "30.000 ADET ROK. RPG-7 MUH. A/P TAH. OG 7V"?
SELECT A.ProjectName, C.CarryingWay
FROM EnglishName6 A
JOIN DeliveryPoint B ON A.Id = B.Id
JOIN CarryingWay_POCa1 C ON B.Id= C.Id
WHERE ProjectName = '30.000 ADET ROK. RPG-7 MUH. A/P TAH. OG 7V'


--What is the delivery point of current status "MALZEME TESLÝM AÞAMASINDA"?

SELECT A.CurrentStatus, D.DeliveryPoint
FROM CurrentStatus_PrCu A
JOIN ProjectName0 B ON A.ProjectName = B.ProjectName
JOIN CarryingWay_POCa1 C ON B.Id=C.Id
JOIN DeliveryPoint D ON C.Id =D.Id
WHERE CurrentStatus = 'MALZEME TESLÝM AÞAMASINDA'






SELECT * FROM CarryingWay_POCa1 ORDER BY PO_Number
SELECT * FROM PO_Number5  ORDER BY PO_Number

SELECT cw.PO_Number, cw.CarryingWay, PO.ProjectName                                   
FROM CarryingWay_POCa1 cw, PO_Number5 PO
WHERE cw.PO_Number = PO.PO_Number
ORDER BY cw.Id

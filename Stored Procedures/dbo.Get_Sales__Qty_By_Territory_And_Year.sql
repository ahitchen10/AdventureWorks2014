SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[Get_Sales__Qty_By_Territory_And_Year]

AS
BEGIN
  select 
--h.[TerritoryID],
st.Name Country,
YEAR(h.orderdate) As YEAR,
SUM(sod.OrderQty) AS TotalQty
--h.SubTotal,
--h.Freight,
--h.TaxAmt,
--SUM(h.TotalDue) TotalSales
FROM [Sales].[SalesOrderHeader] H (NOLOCK)
inner join [Sales].[SalesTerritory] ST (NOLOCK) on ST.TerritoryID = h.TerritoryID
INNER JOIN [Sales].[SalesOrderDetail] SOD (NOLOCK) ON SOD.SalesOrderID = h.SalesOrderID  
GROUP BY YEAR(h.orderdate),st.Name/*,sod.OrderQty*/--,h.SubTotal,h.Freight,h.TaxAmt
ORDER BY YEAR(h.orderdate),st.Name
END;







GO

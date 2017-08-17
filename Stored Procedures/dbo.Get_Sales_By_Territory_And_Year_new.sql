SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[Get_Sales_By_Territory_And_Year_new]

AS
BEGIN
  SELECT 
--h.[TerritoryID],
st.Name AS Territory_Name,
c.Name Country,
YEAR(h.orderdate) YEAR,
--sod.OrderQty,
--h.SubTotal,
--h.Freight,
--h.TaxAmt,
SUM(h.TotalDue) TotalSales_Sterling,
SUM(sod.OrderQty) TotalQty
FROM [Sales].[SalesOrderHeader] H (NOLOCK)
INNER JOIN [Sales].[SalesTerritory] ST (NOLOCK) ON ST.TerritoryID = h.TerritoryID
INNER JOIN [Person].[CountryRegion] C (NOLOCK) ON c.[CountryRegionCode] = st.[CountryRegionCode]
INNER JOIN [Sales].[SalesOrderDetail] SOD (NOLOCK) ON SOD.SalesOrderID = h.SalesOrderID  
GROUP BY YEAR(h.orderdate),st.Name,c.Name/*,sod.OrderQty*/--,h.SubTotal,h.Freight,h.TaxAmt
ORDER BY YEAR(h.orderdate),st.Name
END;









GO

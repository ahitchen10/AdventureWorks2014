SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[Get_Sales_By_Territory_And_Year]

AS
BEGIN
  select 
--h.[TerritoryID],
st.Name AS Territory,
c.Name Country,
YEAR(h.orderdate) YEAR,
--sod.OrderQty,
--h.SubTotal,
--h.Freight,
--h.TaxAmt,
SUM(h.TotalDue) TotalSales,
SUM(sod.OrderQty) TotalQty
FROM [Sales].[SalesOrderHeader] H (NOLOCK)
inner join [Sales].[SalesTerritory] ST (NOLOCK) on ST.TerritoryID = h.TerritoryID
inner join [Person].[CountryRegion] C (nolock) on c.[CountryRegionCode] = st.[CountryRegionCode]
INNER JOIN [Sales].[SalesOrderDetail] SOD (NOLOCK) ON SOD.SalesOrderID = h.SalesOrderID  
GROUP BY YEAR(h.orderdate),st.Name,c.Name/*,sod.OrderQty*/--,h.SubTotal,h.Freight,h.TaxAmt
ORDER BY YEAR(h.orderdate),st.Name
END;







GO

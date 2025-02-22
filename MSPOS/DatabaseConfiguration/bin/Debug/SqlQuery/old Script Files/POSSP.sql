
Create PROCEDURE getAllDaysBetweenTwoDate1
(
@FromDate DATETIME,    
@ToDate DATETIME
)
AS
BEGIN
    
    DECLARE @TOTALCount INT
    SET @FromDate = DATEADD(DAY,-1,@FromDate)
    Select  @TOTALCount= DATEDIFF(DD,@FromDate,@ToDate);

    WITH d AS 
            (
              SELECT top (@TOTALCount) AllDays =CONVERT(date,DATEADD(DAY, ROW_NUMBER() OVER (ORDER BY object_id), REPLACE(@FromDate,'-','')),103)
              FROM sys.all_objects
            )
        SELECT AllDays From d
        
    RETURN 
END

CREATE PROCEDURE [dbo].[GetDaysBetweenTwoDate]
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

GO
CREATE PROCEDURE [dbo].[getAllDaysBetweenTwoDate]
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

GO

CREATE PROCEDURE [dbo].[sp_DaySalesSummaryDetail](@tActionType varchar(400),@tDate date)
AS
BEGIN

Select Invoice_no as Bill_No,CONVERT(date,Invoice_date,103) as Bill_Date ,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),Total_Amt) END) as Amount from SalesInvoiceMaster_table where Invoice_date =@tDate

END

GO
Create Procedure [dbo].[Sp_MonthlySalesSummary](@ActionType varchar(100),@tMonth varchar(100),@tRetailAmt Numeric(18,2) OUT,@tWholeAmt numeric(18,2) OUT,@tReturnAmt numeric(18,2) OUT)
as
begin

DECLARE @tYear NUMERIC(18,0);
DECLARE @tCurrentMonth NUMERIC(18,0);
DECLARE @tStartDate Date
DECLARE @tEndDate Date
DECLARE @tNextYear NUMERIC(18,0);
BEGIN
IF @tMonth='January'
BEGIN
SELECT @tYear=DATEPART(yyyy,getdate())
select @tStartDate=DATEADD(month,01-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,01,DATEADD(year,@tYear-1900,0))) 

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;

     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='February'
BEGIN
SELECT @tYear=DATEPART(yyyy,getdate())
select @tStartDate=DATEADD(month,02-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,02,DATEADD(year,@tYear-1900,0))) 

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='March'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,03-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,03,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='April'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,04-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,04,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='May'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,05-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,05,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='June'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,06-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,06,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='July'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,07-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,07,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='August'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,08-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,08,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='September'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,09-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,09,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='October'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,10-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,10,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='November'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,11-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,11,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='December'
BEGIN
SELECT @tYear=DATEPART(YYYY,GETDATE())
SELECT @tStartDate=DATEADD(month,12-1,dateadd(year,@tYear-1900,0))
SELECT @tEndDate=DATEADD(day,-1,dateadd(month,12,dateadd(year,@tYear-1900,0)))

     Select @tRetailAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @ActionType = 'GROSSAMT' THEN sum(Total_Amt) END) from SalesInvoiceMaster_table where Invoice_date between @tStartDate and @tEndDate;
     
     if @tRetailAmt is null
     SET @tRetailAmt=0
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END



END




end

GO

CREATE procedure [dbo].[sp_TaxUpdate](@tTaxNo int,@TaxName varchar(150),@TaxValue varchar(500),@SetDefault varchar(20))
as

DECLARE @TranCounter int

begin

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY   

if @SetDefault=1

begin
Update TaxCreation set SetDefault='0'
end

Update TaxCreation set TaxName=@TaxName,TaxValue=@TaxValue,SetDefault=@SetDefault where TaxId=@tTaxNo
	
	
	IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH	
	
end


GO
CREATE procedure [dbo].[sp_TaxInsert](@TaxName varchar(150),@TaxValue varchar(500),@SetDefault varchar(20))
as

declare @tTaxNo int
DECLARE @TranCounter int

begin

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY   


select @tTaxNo=TaxId+1 from Number_table

if @SetDefault=1

begin
Update TaxCreation set SetDefault='0'
end

insert into TaxCreation(TaxId,TaxName,TaxValue,SetDefault) values(@tTaxNo,@TaxName,@TaxValue,@SetDefault)

Update Number_table set TaxId=TaxId + 1


      IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

end


GO
CREATE PROCEDURE [dbo].[sp_SettleHouseACProcess2](@tValue numeric(18,2),@tCreditCardName varchar(400))
AS
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tBankLedger_No Numeric(18,2);
BEGIN
DECLARE @tBillNo NUMERIC(18,2);
   Select @tBankLedger_No=Ledger_No from Ledger_table where Ledger_name=@tCreditCardName
       if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
   SELECT @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1) from NumberTable;
  
   INSERT INTO TempSalRecv_Table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,@tBankLedger_No,@tValue,'0','0')   
   Update NumberTable set SalRecv_Sno=SalRecv_Sno+1
END

GO

CREATE PROCEDURE [dbo].[sp_SettleNETSProcess2](@tValue numeric(18,2))
AS
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
BEGIN
DECLARE @tBillNo NUMERIC(18,2);
  
   if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
   SELECT @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1) from NumberTable;

  
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,'14',@tValue,'0','0')   
   Update NumberTable set SalRecv_Sno=SalRecv_Sno+1
END

GO


CREATE procedure [dbo].[sp_SupplierDelete](@tSupplierNo numeric(18,0),@tSupplierName varchar(200))
as
begin
Delete from Supplier_table where Supplier_no=@tSupplierNo and Supplier_name=@tSupplierName
end


GO

CREATE PROCEDURE [dbo].[sp_vchDelete](@tSalesCount numeric(18,0),@tNetAmt numeric(18,2),@tDiscount numeric(18,2),@tGrossAmt numeric(18,2),@tTotTax numeric(18,2),@tCurrentDate datetime,@CashType VARCHAR(50))	
AS
DECLARE @tVch_party NUMERIC(18,0);
DECLARE @tCHK NUMERIC(18,2);
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tStrnNo numeric(18,0)=0;
DECLARE @tOldVchNo numeric(18,0)=0;

BEGIN
select @tVch_party=vch_party from Vch_table where Vch_No=@tSalesCount group by vch_party
select @tOldVchNo=Vch_Sno from  Vch_table where Vch_No=@tSalesCount and Vch_Party=@tVch_party
delete from Vch_table where Vch_No=@tSalesCount and Vch_Party=@tVch_party
select @tVoucherNoNew=Vch_Sno from Vch_table where Vch_No=@tSalesCount
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Select @tStrnNo=smas_no from salmas_table where smas_billno=@tSalesCount;
select @tVchRefNo=smas_no from salmas_table where smas_billno=@tStrnNo;
IF @CashType='Cash'
BEGIN
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tOldVchNo,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','5',@tVchRefNo,'1',@tCurrentDate,'12','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tOldVchNo,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','5',@tVchRefNo,'1',@tCurrentDate,'12','6','5',-@tCHK,'0','','','0','','0')
else if(@tCHK>0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tOldVchNo,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','5',@tVchRefNo,'1',@tCurrentDate,'12','6','5','0',@tCHK,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;
END
IF @CashType='Credit'
BEGIN
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','14',@tVchRefNo,'1',@tCurrentDate,'10','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tOldVchNo,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','14',@tVchRefNo,'1',@tCurrentDate,'10','6','5',-@tCHK,'0','','','0','','0')
else if(@tCHK>0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tOldVchNo,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','14',@tVchRefNo,'1',@tCurrentDate,'10','6','5','0',@tCHK,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;
END
END

GO

CREATE Procedure [dbo].[sp_vchCreation] (@tTax Numeric(18,2),@tSalesCount numeric(18,0),@tCurrentDate datetime,@tTaxNumber NUMERIC(18,0),@CashType VARCHAR(50),@OldVchNumber varchar(100))
AS

DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tStrnNo numeric(18,0)=0;
BEGIN

if @CashType='Cash'
BEGIN
Select @tStrnNo=smas_no from salmas_table where smas_billno=@tSalesCount;
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@OldVchNumber,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','5',@tVchRefNo,'1',@tCurrentDate,'12',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 --set @tSingleTaxAmtNew=((@tSingleTaxAmt*100)/@tTax);
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@OldVchNumber,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','5',@tVchRefNo,'1',@tCurrentDate,'12',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
END
IF @CashType='Credit'
BEGIN
Select @tStrnNo=smas_no from salmas_table where smas_billno=@tSalesCount;
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@OldVchNumber,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','14',@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 --set @tSingleTaxAmtNew=((@tSingleTaxAmt*100)/@tTax);
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@OldVchNumber,'',@tSalesCount,'',@tSalesCount,@tSalesCount,'1','0','1','14',@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
END
END


GO

CREATE PROCEDURE [dbo].[sp_SettleCreditCardProcess2](@tValue numeric(18,2),@tCreditCardName varchar(400))
AS
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tBankLedger_No Numeric(18,2);
BEGIN
DECLARE @tBillNo NUMERIC(18,2);
  
  Select @tBankLedger_No=Ledger_no from Ledger_table where Ledger_name=@tCreditCardName
  
   
    if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
  SELECT @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1) from NumberTable;
  
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,@tBankLedger_No,@tValue,'0','0')   
   Update NumberTable set SalRecv_Sno=SalRecv_Sno+1
END

GO

CREATE procedure [dbo].[SP_SelectQuery_Return](@ActionType as varchar(100),@VoucherNo as Varchar(20) OUTPUT)
AS Begin
		IF @ActionType='VoucherNo'
		Begin
			select @VoucherNo=(max(pmas_no)+1) from purmas_table
			if @VoucherNo is null
		SELECT	@VoucherNo=1;
		End	
		Else IF @ActionType='MaxBomBillNo'
		Begin
		  select @VoucherNo=(MAX(BOM_BillNumber)+1) from BOMissu_Table
		  
		  if @VoucherNo is null
		  Select @VoucherNo=1
		  
		End
End

GO

CREATE PROCEDURE [dbo].[sp_SalesCreation_RoundCalculate] 
AS
BEGIN
Select * from rptSet where Rdesc='Round'
END

GO
CREATE PROCEDURE [dbo].[sp_SalesCreationHoldInsert]
(@tClickedButton numeric(18,0),@tempTable Type_gridValue Readonly, @tempFreeItem dtSingleFreeSales Readonly)
AS
DECLARE @TranCounter INT;

DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Disc numeric(18,2);
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable


SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
  Insert into SalHold_Table(Hold_no,Item_name,Qty,Rate,Amount,Disc) values(@tClickedButton,@ItemName,@Qty,@Rate,@Amt,@Disc)
  Fetch Next from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc;
end
close c2
deallocate c2

INSERT INTO [dbo].[dtSingleFreeHoldInsert]([HoldNo],[ItemName],[Qty],[ScannedQty],[MainItemName],[OfferName],[OfferFreeQty],[TotSaleQty])
      (Select  @tClickedButton as HoldNo, ItemName,Qty,ScannedQty,MainItemName,OfferName,OfferFreeQty,TotSaleQty from @tempFreeItem)

 IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[SP_RefreshSalesCreation]
(@tClickedButton VARCHAR(300))
AS
SET NOCOUNT ON 
DECLARE @TranCounter INT; 
DECLARE @ItemName varchar(200);
DECLARE C1 CURSOR LOCAL READ_ONLY FOR Select Item_name as ItemName from SalHold_Table where Hold_no=@tClickedButton;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
Select Item_name as ItemName,Qty,Rate,Amount as Amt,Disc from SalHold_Table where Hold_no=@tClickedButton;   
open C1
fetch from C1 into @ItemName
while @@fetch_status=0
begin
    Delete from SalHold_table where Item_name=@ItemName and Hold_no=@tClickedButton;
    fetch next from C1 into @ItemName
end
close C1
deallocate C1 
   
 
 IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_ResetCashDrawer]
	(@ttxtCountP05  numeric(18,0),
	@ttxtCountP10  numeric(18,0),
	@ttxtCountP20  numeric(18,0),
	@ttxtCountP50  numeric(18,0),
	@ttxtCount1  numeric(18,0),
	@ttxtCount2  numeric(18,0),
	@ttxtCount5 numeric(18,0),
	@ttxtCount10  numeric(18,0),
	@ttxtCount20  numeric(18,0),
	@ttxtCount50  numeric(18,0),
	@ttxtCount100  numeric(18,0),
	@ttxtCount1000  numeric(18,0),
	@tlblTotalP05  numeric(18,2),
	@tlblTotalP10  numeric(18,2),
	@tlblTotalP20  numeric(18,2),
	@tlblTotalP50  numeric(18,2),
	@tlblTotal1  numeric(18,2),
	@tlblTotal2  numeric(18,2),
	@tlblTotal5  numeric(18,2),
	@tlblTotal10  numeric(18,2),
	@tlblTotal20  numeric(18,2),
	@tlblTotal50  numeric(18,2),
	@tlblTotal100  numeric(18,2),
	@tlblTotal1000  numeric(18,2),
	@ttxtCountTotal  numeric(18,2),
	@tlblTotalTotal  numeric(18,2),@tUserNo numeric(18,0),@tCurrentCashSales numeric(18,2))
	AS
	DECLARE @tBeginCashDrawId Numeric(18,0)=0;
	DECLARE @tResetDrawerId Numeric(18,0)=0;
	DECLARE @tCounter Numeric(18,0);
	DECLARE @tCount Numeric(18,0);
	DECLARE @tDrawerCash Numeric(18,2);
	DECLARE @tLastValue NUMERIC(18,2);
	BEGIN
	select @tBeginCashDrawId=max(id) from BeginCashDrawer_table where Ctr_no=(Select ctr_no from user_table where user_no=@tUserNo)
	select @tResetDrawerId=(max(ResetDrawerId)+1) from NumberTable
	Select @tCounter=Ctr_no from User_table where User_no=@tUserNo;
    select @tCount=count(*) from ResetDrawer_table where BeginCashDraw_Id=@tBeginCashDrawId and Ctr_no=(select Ctr_no from User_table where User_no=@tUserNo)
    if @tCount=0
    SET @tDrawerCash=@tCurrentCashSales;
    Else 
    BEGIN
    select @tLastValue=Sum(PreviousDrawerCash) from ResetDrawer_table where BeginCashDraw_Id=@tBeginCashDrawId and Ctr_no=(select Ctr_no from User_table where User_no=@tUserNo)
    SET @tDrawerCash=@tCurrentCashSales-@tLastValue;
    END
	Insert into ResetDrawer_table(Id,BeginCashDraw_Id,Coin_P05,Coin_P10,Coin_P20,Coin_P50,Coin_1,Coin_2,Coin_5,Coin_10,Coin_20,Coin_50,Coin_100,Coin_1000,CoinAmt_P05,CoinAmt_P10,CoinAmt_P20,CoinAmt_P50,CoinAmt_1,CoinAmt_2,CoinAmt_5,CoinAmt_10,CoinAmt_20,CoinAmt_50,CoinAmt_100,CoinAmt_1000,CoinTot_Count,CoinTot_Amount,User_no,Ctr_no,PreviousDrawerCash) values 
	(@tResetDrawerId,@tBeginCashDrawId,@ttxtCountP05,@ttxtCountP10,@ttxtCountP20,@ttxtCountP50,@ttxtCount1,@ttxtCount2,@ttxtCount5,@ttxtCount10,@ttxtCount20,@ttxtCount50,@ttxtCount100,@ttxtCount1000,@tlblTotalP05,@tlblTotalP10,@tlblTotalP20,@tlblTotalP50,@tlblTotal1,@tlblTotal2,@tlblTotal5,@tlblTotal10,@tlblTotal20,@tlblTotal50,@tlblTotal100,@tlblTotal1000,@ttxtCountTotal,@tlblTotalTotal,@tUserNo,@tCounter,@tDrawerCash)   
	Update NumberTable set ResetDrawerId=ResetDrawerId+1
	END

GO

CREATE PROCEDURE [dbo].[SP_PREVIOUSBILL]
(@tCounter varchar(100), @tRowCount NUMERIC(18,0) OUT,@tSmas_NetAmount NUMERIC(18,2) OUT,@tSmas_Rcvdamount NUMERIC(18,2) OUT,@tRefundAmt NUMERIC(18,2) OUT,@tRowCount1 NUMERIC(18,0) OUT)
AS
BEGIN


Declare @tCountChk numeric(18,0)=(select count(*) from Tempsalmas_table where ctr_no=@tCounter);
if @tCountChk=0
Select @tRowCount=MAX(smas_billNo) from SalMas_table with (index(IndexSalMas_table)) where smas_rtno=0 and ctr_no=@tCounter
else
Select @tRowCount=MAX(smas_billNo) from Tempsalmas_table  where smas_rtno=0 and ctr_no=@tCounter
IF @tRowCount is NULL OR @tRowCount=-1
SET @tRowCount=0;
if exists( select * from Tempsalmas_table where ctr_no=@tCounter)
BEGIN
select @tSmas_NetAmount=Smas_NetAmount,@tSmas_Rcvdamount=Smas_Rcvdamount from Tempsalmas_table where smas_billno=@tRowCount and smas_rtno=0;
END
else
select @tSmas_NetAmount=Smas_NetAmount,@tSmas_Rcvdamount=Smas_Rcvdamount from salmas_table where smas_billno=@tRowCount and smas_rtno=0;

SET @tRefundAmt=@tSmas_Rcvdamount-@tSmas_NetAmount;
select @tCountChk=count(*) from Tempsalmas_table;
if @tCountChk=0
Select @tRowCount1=MAX(smas_billNo) from SalMas_table with (index(IndexSalMas_table)) where smas_rtno=0 
else
Select @tRowCount1=MAX(smas_billNo) from Tempsalmas_table  where smas_rtno=0 
END

GO

CREATE PROCEDURE [dbo].[sp_MonthSalesSummary](@tActionType varchar(100),@tMonth varchar(100),@tCounterNo varchar(100),@tRetailAmt Numeric(18,2) OUT,@tWholeAmt numeric(18,2) OUT,@tReturnAmt numeric(18,2) OUT, @tYearNew numeric(18,0))
AS
SET NOCOUNT ON 
DECLARE @tYear NUMERIC(18,0);
DECLARE @tCurrentMonth NUMERIC(18,0);
DECLARE @tStartDate Date
DECLARE @tEndDate Date
DECLARE @tNextYear NUMERIC(18,0);
Declare @tDiscountAmt Numeric(18,2);
BEGIN
IF @tMonth='April'
BEGIN
--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,04-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,04,DATEADD(year,@tYear-1900,0))) 

  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and  smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1'  and smas_rtno<>0 and  smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and  Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='May'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,05-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,05,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_Cancel=1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='June'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,06-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,06,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='July'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,07-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,07,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='August'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,08-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,08,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0  and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='September'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,09-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,09,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0  and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='October'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,10-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,10,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0  and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='November'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,11-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,11,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0  and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0  and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='December'
BEGIN

--SELECT @tYear=DATEPART(yyyy,getdate())
Set @tYear=@tYearNew
select @tStartDate=DATEADD(month,12-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,12,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='January'
BEGIN


Set @tYear=@tYearNew+1

select @tStartDate=DATEADD(month,01-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,01,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='February'
BEGIN

--SELECT @tYear=DATEPART(yyyy,DATEADD(year, DATEDIFF(year, -1, GETDATE()), 0))
Set @tYear=@tYearNew+1
select @tStartDate=DATEADD(month,02-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,02,DATEADD(year,@tYear-1900,0))) 
  IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0  and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

IF @tMonth='March'
BEGIN

--SELECT @tYear=DATEPART(yyyy,DATEADD(year, DATEDIFF(year, -1, GETDATE()), 0))
Set @tYear=@tYearNew+1
select @tStartDate=DATEADD(month,03-1,DATEADD(year,@tYear-1900,0))
select @tEndDate=DATEADD(day,-1,DATEADD(month,03,DATEADD(year,@tYear-1900,0))) 
 IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0  and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and smas_billdate between @tStartDate and @tEndDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1' and smas_rtno<>0 and ctr_no=@tCounterNo and smas_billdate between @tStartDate and @tEndDate;
     END
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate between @tStartDate and @tEndDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
     if @tWholeAmt is null
     SET @tWholeAmt=0
     if @tReturnAmt is null
     SET @tReturnAmt=0
END

END

GO

CREATE PROCEDURE [dbo].[sp_AddDiscount](@tDiscountName varchar(400),@tPrintText varchar(400))
AS
BEGIN
insert into DiscountSetting_Table(Enabled,DiscountName,PrintText,Calculation,Amount,ItemsPerOder,AllowOtherDiscount,StartDate,EndDate,Sunday,Monday,Tuesday,Wednessday,Thursday,Friday,Saturday) values('Yes',@tDiscountName,@tPrintText,'Fixed','0','1','Yes',convert(datetime,GETDATE(),103),convert(datetime,GETDATE(),103),'Yes','Yes','Yes','Yes','Yes','Yes','Yes');
END

GO

CREATE procedure [dbo].[SP_LedgerGroupIn](@CardName as varchar(200),@LedgerGroupName as varchar(200))
As 
Begin
SET NOCOUNT ON 
Declare @Cardnumber as varchar(50),@Ledgerno as varchar(20)
(select @Cardnumber=(Card_no)+1 from NumberTable )
(select @Ledgerno=(Ledger_no) from Ledger_table where Ledger_name=@LedgerGroupName)
 insert into CreditCard_Table(Card_No,Card_Name,Card_MtName,BankLedger_No) values(@Cardnumber,@CardName,UPPER(@CardName),@Ledgerno)
 update NumberTable set Card_no=Card_no+1
End

GO

CREATE PROCEDURE [dbo].[sp_funBtnDolor2](@tValue numeric(18,2))
AS
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
BEGIN
DECLARE @tBillNo Numeric(18,0);
   
  
   if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
 SELECT @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1) from NumberTable;
   
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,'5',@tValue,'0','0')   
   Update NumberTable set SalRecv_Sno=SalRecv_Sno+1
END


GO
CREATE PROCEDURE [dbo].[sp_HoldTruncate]
AS
BEGIN
truncate table SalHold_table
truncate table dtSingleFreeHoldInsert
END

GO

CREATE PROCEDURE [dbo].[sp_DailySalesSummary](@tActionType varchar(100),@tCounterNo varchar(100),@tDate date,@tRetailAmt Numeric(18,2) OUT,@tWholeAmt numeric(18,2) OUT,@tReturnAmt numeric(18,2) OUT)
AS
BEGIN
Declare @tDiscountAmt Numeric(18,2)
SET NOCOUNT ON 
IF @tCounterNo =''
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and  smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate = @tDate;
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true'  and smas_rtno=0 and smas_billdate = @tDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1'  and smas_billdate = @tDate;    
     END
  ELSE
     BEGIN
     Select @tRetailAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where  smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0' and ctr_no=@tCounterNo and smas_billdate = @tDate; 
     Select @tWholeAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and smas_saltype='true' and smas_rtno=0 and ctr_no=@tCounterNo and smas_billdate = @tDate;
     Select @tReturnAmt=(CASE WHEN @tActionType = 'GROSSAMT' THEN sum(smas_Gross) ELSE sum(smas_NetAmount) END) from salmas_table where smas_Cancel<>1 and Smas_salmode='1'  and ctr_no=@tCounterNo and smas_billdate = @tDate;
     END
     
     Select @tDiscountAmt=CONVERT(numeric(18,2),sum(Amount)) from DiscountDetail_table , SalMas_table where DiscountDetail_table.Bill_no=SalMas_table.Smas_billno and smas_Cancel<>1 and smas_saltype='false' and smas_rtno=0 and Smas_salmode ='0'  and smas_billdate =@tDate 
     if @tRetailAmt is null
     SET @tRetailAmt=0
     else
     set @tRetailAmt=@tRetailAmt-@tDiscountAmt
END

GO

CREATE PROCEDURE [dbo].[sp_DiscountSetting_Table] 
(@tEnabled varchar(100),@tDiscountName varchar(400),@tPrintText varchar(400),@tCalculation varchar(100),@tAmount varchar(100),@tItemsPerOder numeric(18,0),@tAllowOtherDiscount varchar(100),
                @tStartDate datetime,@tEndDate datetime,@tSunday varchar(100),@tMonday varchar(100),@tTuesday varchar(100),@tWednessday varchar(100),@tThursday varchar(100),@tFriday varchar(100),@tSaturday varchar(100),@tDiscountNameCon varchar(400))
                AS
                BEGIN
 Update  DiscountSetting_Table set Enabled=@tEnabled,DiscountName=@tDiscountName,PrintText=@tPrintText,Calculation=@tCalculation,Amount=@tAmount,ItemsPerOder=@tItemsPerOder,AllowOtherDiscount=@tAllowOtherDiscount, StartDate=@tStartDate,EndDate=@tEndDate,Sunday=@tSunday,Monday=@tMonday,Tuesday=@tTuesday,Wednessday=@tWednessday,Thursday=@tThursday,Friday=@tFriday,Saturday=@tSaturday  where DiscountName=@tDiscountNameCon;
 End

GO

CREATE PROCEDURE [dbo].[sp_DiscountSelectSingle](@tActionType varchar(100),@tValue varchar(400))
AS
BEGIN
	if @tActionType='DISCOUNTNAME'
	select * from DiscountSetting_Table where DiscountName=@tValue;
	if @tActionType='DELETE'
	DELETE from DiscountSetting_Table where DiscountName=@tValue;
	
END

GO

CREATE PROCEDURE [dbo].[sp_DiscountSelectAll](@tActionType varchar(100))
AS
BEGIN
	if @tActionType='LOADDISCOUNT'
	SELECT * from DiscountSetting_Table
	
END


GO

CREATE Procedure [dbo].[AlterSalRevTable](@BillNO AS Varchar(20),@NetAmount as numeric(18,2),@tUserno as varchar(10),@tCounter as varchar(20),@dt_gridload1 sp_funBtnDolorAlterTable  READONLY)
As 
SET NOCOUNT ON 
Begin
			  declare @Type1 as varchar(200),@RecRemBillAmt numeric(18,2),@RecAmt numeric(18,2),@Types2 as varchar(20)
        	  declare c Cursor Local Read_only for select Type1,RemaininbillAmt,ReceiverAmt,Types2 from @dt_gridload1 
        	  declare @counts int=(select count(*)from @dt_gridload1)
        	  if @counts>0
      open c
        	  Begin
        	  delete from SalRecv_table where SalRecv_Salno=@BillNO
			  fetch from c into @Type1,@RecRemBillAmt,@RecAmt,@Types2
        		 	while @@FETCH_STATUS=0
        		 	if   @RecAmt>=@RecRemBillAmt
        		 	 begin
        		 		declare @tSalRecv_Sno As varchar(10)
        		 		select @tSalRecv_Sno=(max(SalRecv_Sno)+1) from NumberTable;
        		 		declare @totRe numeric(18,2)=(@RecAmt-@RecRemBillAmt)
        		 		INSERT INTO SalRecv_Table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@BillNO,@Type1,@RecAmt-@totRe,(@RecAmt-@RecRemBillAmt),'0') 
        		 		declare @mode int=0;
        		 		Declare @LdgName varchar(200)=(select Ledger_name from Ledger_table where Ledger_no=@Type1)        		 		
        		 		if @LdgName='Cash Sales' or @LdgName='Cash A/c'
        		 		begin
        		 		Set @mode=1
        		 		Set @LdgName='Cash Sales'
        		 		End
        		 		Else
        		 		Set @mode=0        		 		
        		 		Update salmas_table set UserNo=@tUserno,ctr_no=@tCounter,party_no=@Type1,smas_name=@LdgName,smas_cashmode=@mode,smas_Gross=@NetAmount,smas_GrossAmount=@NetAmount,smas_NetAmount=@NetAmount,smas_rcvdamount=(@NetAmount+@totRe),Profit=@NetAmount where smas_billno=@BillNO
        		 		Update NumberTable set SalRecv_Sno=(Select (max(SalRecv_Sno)+1) from NumberTable) 
        		 		fetch next from c into @Type1,@RecRemBillAmt,@RecAmt,@Types2 	
        		 	end	
        		 	else if @RecAmt<@RecRemBillAmt
        		 	Begin
        		 		declare @tSalRecv_Sno1 As varchar(10)
        		 		select @tSalRecv_Sno1=(max(SalRecv_Sno)+1) from NumberTable;
        		 		if @RecRemBillAmt>@RecAmt
        		 		INSERT INTO SalRecv_Table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno1,@BillNO,@Type1,@RecAmt,'0','0') 
        		 		Update NumberTable set SalRecv_Sno=(Select (max(SalRecv_Sno)+1) from NumberTable) 
        		 		 fetch next from c into @Type1,@RecRemBillAmt,@RecAmt,@Types2 	
        		 	End	
	    End
	     Close c
End

GO

CREATE procedure [dbo].[BarcodeEntry]
(@Item_no int,@Barcode Varchar(100),@MTBarcode varchar(100),@qty int,@rate numeric(18,2))
As
Begin
  insert into barcode_Table(item_no,Barcode,MTBarcode,qty,rate) values(@Item_no,@Barcode,@MTBarcode,@qty,@rate)
End


GO

CREATE procedure [dbo].[DeleteOpeningQty]
as
SET NOCOUNT ON 
 DECLARE 
 @TranCounter INT,
  @id INT;
    SET @TranCounter = @@TRANCOUNT;
    IF @TranCounter > 0
     SAVE TRANSACTION ProcedureSave;
    ELSE
    BEGIN TRANSACTION;
 BEGIN TRY
    Declare @ItemNo Varchar(50),@StrnType varchar(50),@StrnPartyNo  varchar(50);
	declare c1 Cursor Local Read_only for select item_no,strn_type,StrnParty_no  from stktrn_table WHERE strn_type=0 AND StrnParty_no=0;
	declare @counts int=(select count(*)from stktrn_table where strn_type=0 AND StrnParty_no=0 )
	 if @counts>0
	    begin
				update Item_table set nt_cloqty= (nt_cloqty - nt_opnqty)
				update Item_table set nt_opnqty = 0
			open c1 
				fetch from c1 into  @ItemNo,@StrnType,@StrnPartyNo	
				delete from stktrn_table where item_no =@ItemNo and strn_type ='0' and StrnParty_no='0'
		    close c1
		 end
	Else
	   Begin
		 update Item_table set nt_cloqty= (nt_cloqty - nt_opnqty)
		 update Item_table set nt_opnqty = 0
	   End	 
	
IF @TranCounter = 0           
    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
 IF @TranCounter = 0         
            ROLLBACK TRANSACTION;
        ELSE
        
            IF XACT_STATE() <> -1        
                ROLLBACK TRANSACTION ProcedureSave;        
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE();
        SELECT @ErrorSeverity = ERROR_SEVERITY();
        SELECT @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, -- Message text.
                   @ErrorSeverity, -- Severity.
                   @ErrorState -- State.
                   );
    END CATCH

GO
CREATE Procedure [dbo].[Pro_viewDiffFree] as begin
Declare @tOfferName varchar(500);
Declare @tTotSaleQty numeric(18,2);
Declare @tStartValue numeric(18,2);
Declare @tSaleQty numeric(18,2);
Declare @tEndValue numeric(18,2);
Declare @tDifferent numeric(18,2);
Declare @tDateName varchar(100)=(SELECT DATENAME(dw,(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)))) 
Create table #viewDiffFree (FreeSno int , FreeSnoGroup int,OfferName varchar(400), Item_name varchar(400), TotSaleQty numeric(18,2), TotSalePrice numeric(18,2), FromDate date, ToDate date, ItemType varchar(100),FreeType varchar(100),Active varchar(50))
if @tDateName='Sunday'
Declare c0 cursor local read_only for Select OfferName,TotSaleQty,SaleQty from FreeItemMaster_table Where Sunday=1 and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table))  group by OfferName,TotSaleQty,SaleQty order by TotSaleQty 
else if @tDateName='Monday'
Declare c0 cursor local read_only for Select OfferName,TotSaleQty,SaleQty from FreeItemMaster_table Where Monday=1 and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) group by OfferName,TotSaleQty,SaleQty order by TotSaleQty 
else if @tDateName='Tuesday'
Declare c0 cursor local read_only for Select OfferName,TotSaleQty,SaleQty from FreeItemMaster_table Where Tuesday=1  and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) group by OfferName,TotSaleQty,SaleQty order by TotSaleQty 
else if @tDateName='Wednesday'
Declare c0 cursor local read_only for Select OfferName,TotSaleQty,SaleQty from FreeItemMaster_table Where Wednesday=1 and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) group by OfferName,TotSaleQty,SaleQty order by TotSaleQty 
else if @tDateName='Thursday'
Declare c0 cursor local read_only for Select OfferName,TotSaleQty,SaleQty from FreeItemMaster_table Where thursday=1 and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) group by OfferName,TotSaleQty,SaleQty order by TotSaleQty 
else if @tDateName='Friday'
Declare c0 cursor local read_only for Select OfferName,TotSaleQty,SaleQty from FreeItemMaster_table Where friday=1 and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) group by OfferName,TotSaleQty,SaleQty order by TotSaleQty 
else if @tDateName='Saturday'
Declare c0 cursor local read_only for Select OfferName,TotSaleQty,SaleQty from FreeItemMaster_table Where sturday=1 and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) group by OfferName,TotSaleQty,SaleQty order by TotSaleQty 

open c0
fetch from c0 into @tOfferName,@tTotSaleQty,@tSaleQty
while @@FETCH_STATUS=0
begin
SET @tDifferent=@tSaleQty-@tTotSaleQty
WHILE @tDifferent>=0
BEGIN

if @tDateName='Sunday'
insert into #viewDiffFree (FreeSno, FreeSnoGroup,OfferName, Item_name, TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active) Select FreeSno, FreeSnoGroup,OfferName, Item_table.Item_name, (@tTotSaleQty+@tDifferent) as TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active from FreeItemMaster_table, Item_table Where OfferName=@tOfferName and Sunday=1 and Item_table.Item_no=FreeItemMaster_table.Item_no and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) order by FreeSnoGroup ASC
else if @tDateName='Monday'
insert into #viewDiffFree (FreeSno, FreeSnoGroup,OfferName, Item_name, TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active) Select FreeSno, FreeSnoGroup,OfferName, Item_table.Item_name, (@tTotSaleQty+@tDifferent) as TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active from FreeItemMaster_table, Item_table Where OfferName=@tOfferName and Monday=1 and Item_table.Item_no=FreeItemMaster_table.Item_no and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) order by FreeSnoGroup ASC
else if @tDateName='Tuesday'
insert into #viewDiffFree (FreeSno, FreeSnoGroup,OfferName, Item_name, TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active) Select FreeSno, FreeSnoGroup,OfferName, Item_table.Item_name, (@tTotSaleQty+@tDifferent) as TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active from FreeItemMaster_table, Item_table Where OfferName=@tOfferName and Tuesday=1 and Item_table.Item_no=FreeItemMaster_table.Item_no and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) order by FreeSnoGroup ASC
else if @tDateName='Wednesday'
insert into #viewDiffFree (FreeSno, FreeSnoGroup,OfferName, Item_name, TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active) Select FreeSno, FreeSnoGroup,OfferName, Item_table.Item_name, (@tTotSaleQty+@tDifferent) as TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active from FreeItemMaster_table, Item_table Where OfferName=@tOfferName and Wednesday=1 and Item_table.Item_no=FreeItemMaster_table.Item_no and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) order by FreeSnoGroup ASC
else if @tDateName='Thursday'
insert into #viewDiffFree (FreeSno, FreeSnoGroup,OfferName, Item_name, TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active) Select FreeSno, FreeSnoGroup,OfferName, Item_table.Item_name, (@tTotSaleQty+@tDifferent) as TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active from FreeItemMaster_table, Item_table Where OfferName=@tOfferName and thursday=1 and Item_table.Item_no=FreeItemMaster_table.Item_no and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) order by FreeSnoGroup ASC
else if @tDateName='Friday'
insert into #viewDiffFree (FreeSno, FreeSnoGroup,OfferName, Item_name, TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active) Select FreeSno, FreeSnoGroup,OfferName, Item_table.Item_name, (@tTotSaleQty+@tDifferent) as TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active from FreeItemMaster_table, Item_table Where OfferName=@tOfferName and friday=1 and Item_table.Item_no=FreeItemMaster_table.Item_no and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) order by FreeSnoGroup ASC
else if @tDateName='Saturday'
insert into #viewDiffFree (FreeSno, FreeSnoGroup,OfferName, Item_name, TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active) Select FreeSno, FreeSnoGroup,OfferName, Item_table.Item_name, (@tTotSaleQty+@tDifferent) as TotSaleQty, TotSalePrice, FromDate, ToDate, ItemType,FreeType,Active from FreeItemMaster_table, Item_table Where OfferName=@tOfferName and sturday=1 and Item_table.Item_no=FreeItemMaster_table.Item_no and FreeType='Price' and ItemType='Different' and FreeItemMaster_table.Active=1 and FromDate<=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) and ToDate>=(Select convert(date,DATEADD(DAY,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(id) from EndOfDay_Table)) order by FreeSnoGroup ASC


set @tDifferent=@tDifferent-1;
END

fetch Next from c0 into @tOfferName,@tTotSaleQty,@tSaleQty
end
close c0
deallocate c0
Select * from #viewDiffFree
Drop table #viewDiffFree
End

GO

CREATE PROCEDURE [dbo].[sp_Brand_Update]
(
@Brand_Name as varchar(200),
@Brand_mtname as varchar(200),
@Brand_Name2 as varchar(200)
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 UPDATE DBO.Brand_table SET Brand_name=@Brand_Name,Brand_mtname= @Brand_mtname WHERE Brand_name=@Brand_Name2  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE PROCEDURE [dbo].[sp_Brand_Insert]
(

@tBrandName as varchar(200),
@chk as bit OUT

)
as
DECLARE @TranCounter INT;
DECLARE @bno varchar(200);
DECLARE @grpos varchar(200);
DECLARE @BNameUpper varchar(200)
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
  Select @bno=max(Brand_no)+1 from Numbertable
  select @grpos=max(GroupPos)+1 from Brand_table
  
  set @BNameUpper=UPPER(@tBrandName)
  
  BEGIN
  IF NOT EXISTS(Select * from Brand_Table where Brand_Name=@tBrandName)
  
  BEGIN
   INSERT INTO DBO.Brand_table(Brand_no,Brand_name,Brand_mtname,Brand_level,Brand_under,Brand_gno,Brand_flag,Std_Group,GroupPos) 
  VALUES(@bno ,@tBrandName ,@BNameUpper ,'0','0','0','0','0',@grpos);
  set @chk=0
  
  END
  
  ELSE
 set @chk=1
  END
  
  
  update NumberTable set Brand_no=Brand_No+1  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE PROCEDURE [dbo].[sp_Brand_Delete]
(
@Brand_Name as varchar(200)
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 delete from Brand_table Where Brand_name=@Brand_Name
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE PROCEDURE [dbo].[SP_Bomissuecreatoin] (@Bom_no as varchar(15),@BomName as varchar(20),@Dates as datetime,@Labouramount as varchar(20),@totqty as varchar(20),@remarks as varchar(1000),@VoucherSnumber int,@labouttypes as varchar(500),@BomNumber as varchar(10),@dt_gridload Sp_issuecreation READONLY)
as
SET NOCOUNT ON 
DECLARE @TranCounter INT; 
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
	IF Not Exists(select * from BOMMas_Table where BOM_name=@BomName)
		begin
			declare @BOM_No1 as varchar(100)
			select @BOM_No1=(MAX(BOM_No)+1) from numbertable
				declare @ickh int=0;
				select @ickh=(count(*)) from  @dt_gridload;
				
				if @ickh>0
				Begin
					
					
					Declare @BOMno_values2 as varchar(20),@bommissue_no2 int=0,@ledgerNO2 int,@BOMbillno2 varchar(20),@Voucher_snono2 int=0,@Vchnoteno2 int=0
				    select @BOMno_values2=(bom_no) from BOMMas_Table where BOM_name=@BomName
				    select @bommissue_no2=(MAX(StrnNo)+1) from NumberTable
				    
				    begin
				    if @bommissue_no2 is null
				    SELECT	@bommissue_no2=1;
				    End
					select @ledgerNO2=(ledger_no) from ledsel_table where ledsel_name=@labouttypes
					select @BOMbillno2=(MAX(bom_billnumber)+1) from Bomissu_Table
					
					
					begin
					if @BOMbillno2 is null
					
				    SELECT	@BOMbillno2=1;
				    End
					select @Voucher_snono2=(MAX(VoucherSno)+@VoucherSnumber) from bomissu_table
					select @Vchnoteno2=(MAX(CrnoteVchno)+1) from bomissu_table 
				if @Labouramount=0
				
				 begin
				 
					insert into bomissu_table(BOMIssu_SNo,UserNo,BOM_no,Ctr_No,GodownFrom,GodownTo,LabourNo,BOM_Date,BOM_BillPrefix,BOM_BillNumber,BOM_BillSuffix,BOM_BillNo,Qty,Remarks,LabourAmount,Bom_Cancel,CancelRemarks,VoucherSno,CrNoteVchNo,UpdateFlag) values(@bommissue_no2,'0',@Bom_no,'1','2','2',@ledgerNO2,Convert(Date,@Dates),@BOMbillno2,'',@BOMbillno2,'',@totqty,@remarks,@Labouramount,'0','','0','0','0');
					
				 End
				 Else
				  Begin
				   
				    insert into bomissu_table(BOMIssu_SNo,UserNo,BOM_no,Ctr_No,GodownFrom,GodownTo,LabourNo,BOM_Date,BOM_BillPrefix,BOM_BillNumber,BOM_BillSuffix,BOM_BillNo,Qty,Remarks,LabourAmount,Bom_Cancel,CancelRemarks,VoucherSno,CrNoteVchNo,UpdateFlag) values(@bommissue_no2,'0',@BOMno_values2,'1','2','2',@ledgerNO2,Convert(Date,@Dates),'',@BOMbillno2,@BOMbillno2,'',@totqty,@remarks,@Labouramount,'0','',@Voucher_snono2,@Vchnoteno2,'0');
				    update NumberTable set VoucherSno=VoucherSno+@VoucherSnumber,strnno=strnno+1,VoucherNo=VoucherNo+@VoucherSnumber
				    
				  End
				  
					declare @ItemCode varchar(500),@ItemName varchar(500),@UnitName varchar(100),@Types varchar(10),@TaxQty varchar(20),@Qty int,@Rate varchar(25),@Amount varchar(25),@LabourAmount1 varchar(25),@BOM_name varchar(100),@Bom_number as varchar(200)
					declare c Cursor Local Read_only for select itemCode,ItemName,UnitName,Typess,TaxQty,Qty,Rate,Amount,BOM_No,LabourAmount,BOM_name from @dt_gridload
					 open c
					    fetch from c into @itemCode,@ItemName,@UnitName,@Types,@TaxQty,@Qty,@Rate,@Amount,@BOM_No,@LabourAmount,@BOM_name
        		 		while @@FETCH_STATUS=0
        		 Begin
        		 		 declare @chking int=0,@unit_no as varchar(20),@item_number as varchar(20)
        		 		 select @chking=(COUNT(*)) from item_table where item_name=@ItemName
        		 		if @chking>0
        		 		 select @unit_no=(unit_no) from unit_table where unit_name=@UnitName
        		 		 select @item_number=(item_no) from item_table where item_name=@ItemName
        		 		 insert into Bommas_table(BOM_No,BOM_SNo,BOM_name,BOM_Mtname,Item_No,Unit_No,Type,tx_Qty,nt_qty,Rate,Amount,LabourAmount) values(@BOM_No,'1',@Bom_no,UPPER(@Bom_no),@item_number,@unit_no,@Types,@TaxQty,@Qty,@Rate,@Amount,@LabourAmount)
        		 		 fetch next from c into @itemCode,@ItemName,@UnitName,@Types,@TaxQty,@Qty,@Rate,@Amount,@BOM_No,@LabourAmount,@BOM_name
        		 End
        		 		
        		 		End
					 Close c
				End
	else
		Begin
		Declare @BOMno_values1 as varchar(20),@bommissue_no int=0,@ledgerNO int,@BOMbillno1 varchar(20)
		select @BOMno_values1=(bom_no) from BOMMas_Table where BOM_name=@BomName
		select @bommissue_no=(MAX(StrnNo)+1) from NumberTable
		 if @bommissue_no is null
		  SELECT	@bommissue_no=1;
		select @ledgerNO=(ledger_no) from ledsel_table where ledsel_name=@labouttypes
		select @BOMbillno1=(MAX(bom_billnumber)+1) from Bomissu_Table
		if @BOMbillno1 is null
		SELECT	@BOMbillno1=1;
	       IF @Labouramount=0
				begin 
				   	
					insert into bomissu_table(BOMIssu_SNo,UserNo,BOM_no,Ctr_No,GodownFrom,GodownTo,LabourNo,BOM_Date,BOM_BillPrefix,BOM_BillNumber,BOM_BillSuffix,BOM_BillNo,Qty,Remarks,LabourAmount,Bom_Cancel,CancelRemarks,VoucherSno,CrNoteVchNo,UpdateFlag) values(@bommissue_no,'0',@BOMno_values1,'1','2','2',@ledgerNO,convert(Date,@Dates),'',@BOMbillno1,'',@BOMbillno1,@totqty,@remarks,@Labouramount,'0','','0','0','0');
				end
		   Else 
				Begin
				  Declare @Voucher_snono int=0,@Vchnoteno int=0
					select @Voucher_snono=(MAX(VoucherSno)+@VoucherSnumber) from bomissu_table
					select @Vchnoteno=(MAX(CrnoteVchno)+1) from bomissu_table
					
					insert into bomissu_table(BOMIssu_SNo,UserNo,BOM_no,Ctr_No,GodownFrom,GodownTo,LabourNo,BOM_Date,BOM_BillPrefix,BOM_BillNumber,BOM_BillSuffix,BOM_BillNo,Qty,Remarks,LabourAmount,Bom_Cancel,CancelRemarks,VoucherSno,CrNoteVchNo,UpdateFlag) values(@bommissue_no,'0',@BOMno_values1,'1','2','2',@ledgerNO,Convert(Date,@Dates),'',@BOMbillno1,'',@BOMbillno1,@totqty,@remarks,@Labouramount,'0','',@Voucher_snono,@Vchnoteno,'0');
					update NumberTable set VoucherSno=VoucherSno+@VoucherSnumber,strnno=strnno+1,VoucherNo=VoucherNo+@VoucherSnumber
				End
		End
   IF @TranCounter = 0           
	COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
      
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO
CREATE procedure [dbo].[SP_BomIssueAlterItem](@Dates datetime,@dt_gridload Sp_issuecreation READONLY,@DeleteStkrnvalue as varchar(20))
As
Begin
SET NOCOUNT ON 
    Declare @ickh int=0,@strnno as varchar(20)
	select @ickh=(count(*)) from  @dt_gridload;
	select @strnno=(MAX(strnNo)) from NumberTable
	
				if @ickh>0
				
				Begin
				 if(@DeleteStkrnvalue!='')
				    Begin
				    delete from stktrn_table where strn_no=@DeleteStkrnvalue
				    End
					declare @ItemCode varchar(500),@ItemName varchar(500),@UnitName varchar(100),@Types varchar(10),@TaxQty varchar(20),@Qty varchar(20),@Rate varchar(25),@Amount varchar(25),@LabourAmount1 varchar(25),@BOM_No as varchar(20),@BOM_name1 as varchar(20)
					declare c Cursor Local Read_only for select itemCode,ItemName,UnitName,Typess,TaxQty,Qty,Rate,Amount,BOM_No,LabourAmount,BOM_name from @dt_gridload
					 open c
					    fetch from c into @itemCode,@ItemName,@UnitName,@Types,@TaxQty,@Qty,@Rate,@Amount,@BOM_No,@LabourAmount1,@BOM_name1
        		 		while @@FETCH_STATUS=0
        		    Begin
        		 		  declare @chking int=0,@item_number as varchar(20),@unitno as varchar(20)
        		 		  select @chking=(COUNT(*)) from item_table where item_name=@ItemName
        		 		if @chking>0
        		 		  declare @itemnumber as varchar(20)
        		 		  select @itemnumber=(Item_no) from Item_table where Item_name=@ItemName
        		 		  select @unitno=(unit_no) from unit_table where unit_name=@UnitName
        		 		  declare @strnsno as varchar(20)
        		 		  select @strnsno=(MAX(StrnSno)+1) from NumberTable
        		 		  update NumberTable set StrnSno=@strnsno
        		 		  if @Types='True'
        		 		 Begin
        		 		  declare @itemnumber123 as varchar(20)
        		 		  select @itemnumber123=item_no from Item_table where Item_name=@ItemName
        		 		  update Item_table set nt_purqty=nt_purqty+@Qty,nt_cloqty=nt_cloqty+@Qty,Nt_PurVal=Nt_PurVal+@Amount where Item_no=@itemnumber
        		 		  insert into stktrn_table(strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Amt,Adldisc_Per,Othdisc_Amt,OthPurdisc,Ed_Amt,Ed_PerQty,Ed_Per,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,Commi,CommiPer,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate)values (@strnsno,@strnno,'0','38',Convert(Date,@Dates),'0','0','0','0','0',@itemnumber123,1,2,@unitno,1,0,@Qty,@TaxQty,0,0,0,0,0,'',@Rate,0,0,0,@Amount,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,@Amount,0,0,0,0,0,0,0,0,@Amount,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
        		 		  
        		 		 End
        		 		  If @Types='False'
        		 		 Begin
        		 		  declare @itemnumber1 as varchar(20)
        		 		  select @itemnumber1=item_no from Item_table where Item_name=@ItemName
        		 		  update Item_table set nt_salqty=nt_salqty+@Qty,nt_cloqty=nt_cloqty-@Qty,Nt_Salval=Nt_Salval+@Amount where Item_no=@itemnumber
        		 		  
        		 		  insert into stktrn_table(strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Amt,Adldisc_Per,Othdisc_Amt,OthPurdisc,Ed_Amt,Ed_PerQty,Ed_Per,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,Commi,CommiPer,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate)values (@strnsno,@strnno,'0','37',Convert(Date,@Dates),'0','0','0','0','0',@itemnumber1,1,2,@unitno,1,0,@Qty,@TaxQty,0,0,0,0,0,'',@Rate,0,0,0,@Amount,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,@Amount,0,0,0,0,0,0,0,0,@Amount,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
        		 		  
        		 		 End
        		 		  
        		 		 fetch next from c into @itemCode,@ItemName,@UnitName,@Types,@TaxQty,@Qty,@Rate,@Amount,@BOM_No,@LabourAmount1,@BOM_name1
        			 End
        		 		 Close c
        		End				
End


GO

CREATE PROCEDURE [dbo].[SP_BomCreation]
(@labercost as numeric(18,2),@BomName as varchar(200),@dt_gridload SP_BomCreation  READONLY)
as
SET NOCOUNT ON 
DECLARE @TranCounter INT;
DECLARE @uno varchar(200);
DECLARE @udec float;
DECLARE @UNameUpper varchar(200)
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   declare @ickh int=0,@uniNO as varchar(20),@Bomono as varchar(20),@itemNo as varchar(20);
   
    select @ickh=(count(*)) from  @dt_gridload;
     if @ickh>0
        begin
            
             declare @ItemCode as varchar(200),@ItemName as varchar(200),@bomsno as varchar(20),@unit as varchar(20),@tys as varchar(20),@TaxQty as numeric(18,2),@qty as numeric(18,2),@Rate as numeric(18,2),@Amount numeric(18,2)
             
        	  declare c Cursor Local Read_only for select ItemCode,ItemName,bom_sno,Unit,Typs,TaxQty,qty,Rate,Amount from @dt_gridload 
        	  select @Bomono=(MAX(BOM_No)+1) from NumberTable
        	  update NumberTable set BOM_No=@Bomono 
              open c
               fetch from c into @ItemCode,@ItemName,@bomsno,@unit,@tys,@TaxQty,@qty,@Rate,@Amount
        		 	while @@FETCH_STATUS=0
        		 	
        		 		begin
        		 		declare @tyss as varchar(20)
        		 		select @uniNO=(unit_no) from unit_table where unit_name=@unit
        		 		select @itemNo=(Item_no) from Item_table where Item_name=@ItemName
        		 		
        		 		Insert into BOMMas_Table(BOM_No,BOM_SNo,BOM_name,BOM_Mtname,Item_No,Unit_No,Type,tx_Qty,nt_qty,Rate,Amount,LabourAmount) values(@Bomono,@bomsno,@BomName,upper(@BomName),@itemNo,@uniNO,@tys,@TaxQty,@qty,@Rate,@Amount,@labercost)
							fetch next from c into @ItemCode,@ItemName,@bomsno,@unit,@tys,@TaxQty,@qty,@Rate,@Amount
        		 		End
              Close c
        End
  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE Procedure [dbo].[sp_BeginCashDrawerInsert]
(@tUser_no varchar(50),
@tCoin_P05 varchar(50),@tCoin_P10 varchar(50),@tCoin_P20 varchar(50),@tCoin_P50 varchar(50),@tCoin_1 varchar(50),@tCoin_2 varchar(50),@tCoin_5 varchar(50),@tCoin_10 varchar(50),@tCoin_20 varchar(50),@tCoin_50 varchar(50),@tCoin_100 varchar(50),@tCoin_1000 varchar(50),
@tCoinAmt_P05 varchar(50),@tCoinAmt_P10 varchar(50),@tCoinAmt_P20 varchar(50),@tCoinAmt_P50 varchar(50),@tCoinAmt_1 varchar(50),@tCoinAmt_2 varchar(50),@tCoinAmt_5 varchar(50),@tCoinAmt_10 varchar(50),@tCoinAmt_20 varchar(50),
@tCoinAmt_50 varchar(50),@tCoinAmt_100 varchar(50),@tCoinAmt_1000 varchar(50),@tCoinTot_Count varchar(50),@tCoinTot_Amount varchar(50))
AS
DECLARE @tBeginCashDrawerId Numeric(18,0);
DECLARE @tResetDrawerId Numeric(18,0);
DECLARE @tNextDate datetime=getdate();
DECLARE @tCounter numeric(18,2);
BEGIN
select @tBeginCashDrawerId=Max(BeginCashDrawId)+1 from NumberTable
select @tNextDate=DATEADD(day,1,EndOfDay) from EndOfday_Table where id=(Select max(id) from EndofDay_Table)
if @tNextDate is null
Set @tNextDate=getdate();
Select @tCounter=Ctr_no from User_table where User_no=@tUser_no;
Insert into BeginCashDrawer_table(Id,User_no,Terminal_Id,CashDrawer_id,Coin_P05,Coin_P10,Coin_P20,Coin_P50,Coin_1,Coin_2,Coin_5,Coin_10,Coin_20,Coin_50,Coin_100,Coin_1000,CoinAmt_P05,CoinAmt_P10,CoinAmt_P20,CoinAmt_P50,CoinAmt_1,CoinAmt_2,CoinAmt_5,CoinAmt_10,CoinAmt_20,CoinAmt_50,CoinAmt_100,CoinAmt_1000,CoinTot_Count,CoinTot_Amount,DrawerReset,Date, Ctr_no) values
 (@tBeginCashDrawerId,@tUser_no,'1','1',@tCoin_P05,@tCoin_P10,@tCoin_P20,@tCoin_P50,@tCoin_1,@tCoin_2,@tCoin_5,@tCoin_10,@tCoin_20,@tCoin_50,@tCoin_100,@tCoin_1000,
 @tCoinAmt_P05,@tCoinAmt_P10,@tCoinAmt_P20,@tCoinAmt_P50,@tCoinAmt_1,@tCoinAmt_2,@tCoinAmt_5,@tCoinAmt_10,@tCoinAmt_20,@tCoinAmt_50,@tCoinAmt_100,@tCoinAmt_1000,@tCoinTot_Count,@tCoinTot_Amount,'1',@tNextDate,@tCounter)
Update NumberTable set BeginCashDrawId=BeginCashDrawId+1;
Update beginCashDrawerActive_table set Active=0 Where Ctr_no =(select Ctr_no from User_table where User_no=@tUser_no);
END

GO

CREATE PROCEDURE [dbo].[sp_beginCashDrawer]
(@tUserId numeric(18,0),
@ttxtCountP05  numeric(18,0),
@ttxtCountP10  numeric(18,0),
@ttxtCountP20  numeric(18,0),
@ttxtCountP50  numeric(18,0),
@ttxtCount1  numeric(18,0),
@ttxtCount2  numeric(18,0),
@ttxtCount5 numeric(18,0),
@ttxtCount10  numeric(18,0),
@ttxtCount20  numeric(18,0),
@ttxtCount50  numeric(18,0),
@ttxtCount100  numeric(18,0),
@ttxtCount1000  numeric(18,0),
@tlblTotalP05  numeric(18,2),
@tlblTotalP10  numeric(18,2),
@tlblTotalP20  numeric(18,2),
@tlblTotalP50  numeric(18,2),
@tlblTotal1  numeric(18,2),
@tlblTotal2  numeric(18,2),
@tlblTotal5  numeric(18,2),
@tlblTotal10  numeric(18,2),
@tlblTotal20  numeric(18,2),
@tlblTotal50  numeric(18,2),
@tlblTotal100  numeric(18,2),
@tlblTotal1000  numeric(18,2),
@ttxtCountTotal  numeric(18,2),
@tlblTotalTotal  numeric(18,2))
as
DECLARE @TranCounter INT; 
DECLARE @tBeginCashDrawId Numeric(18,0)=0;
DECLARE @tResetDrawerId Numeric(18,0)=0;
DECLARE @tEndOfDay datetime;
DECLARE @tCounter numeric(18,2);
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY   
select @tBeginCashDrawId=(MAX(BeginCashDrawId)+1), @tResetDrawerId=(max(ResetDrawerId)+1) from NumberTable
select @tEndOfDay=DATEADD(DAY,1,EndOfDay) from EndOfday_Table where id=(Select max(id) from EndofDay_Table)
if @tEndOfDay is NULL
set @tEndOfDay=GETDATE()
Select @tCounter=Ctr_no from User_table where User_no=@tUserId;
Insert into BeginCashDrawer_table(Id,User_no,Terminal_Id,CashDrawer_id,Coin_P05,Coin_P10,Coin_P20,Coin_P50,Coin_1,Coin_2,Coin_5,Coin_10,Coin_20,Coin_50,Coin_100,Coin_1000,CoinAmt_P05,CoinAmt_P10,CoinAmt_P20,CoinAmt_P50,CoinAmt_1,CoinAmt_2,CoinAmt_5,CoinAmt_10,CoinAmt_20,CoinAmt_50,CoinAmt_100,CoinAmt_1000,CoinTot_Count,CoinTot_Amount,DrawerReset,Date,Ctr_no) values 
(@tBeginCashDrawId,@tUserId,'1','1',@ttxtCountP05,@ttxtCountP10,@ttxtCountP20,@ttxtCountP50,@ttxtCount1,@ttxtCount2,@ttxtCount5,@ttxtCount10,@ttxtCount20,@ttxtCount50,@ttxtCount100,@ttxtCount1000,@tlblTotalP05,@tlblTotalP10,@tlblTotalP20,@tlblTotalP50,@tlblTotal1,@tlblTotal2,@tlblTotal5,@tlblTotal10,@tlblTotal20,@tlblTotal50,@tlblTotal100,@tlblTotal1000,@ttxtCountTotal,@tlblTotalTotal,'1',@tEndOfDay,@tCounter)
Insert into ResetDrawer_table(Id,BeginCashDraw_Id,Coin_P05,Coin_P10,Coin_P20,Coin_P50,Coin_1,Coin_2,Coin_5,Coin_10,Coin_20,Coin_50,Coin_100,Coin_1000,CoinAmt_P05,CoinAmt_P10,CoinAmt_P20,CoinAmt_P50,CoinAmt_1,CoinAmt_2,CoinAmt_5,CoinAmt_10,CoinAmt_20,CoinAmt_50,CoinAmt_100,CoinAmt_1000,CoinTot_Count,CoinTot_Amount,User_no,Ctr_no) values 
(@tResetDrawerId,@tBeginCashDrawId,@ttxtCountP05,@ttxtCountP10,@ttxtCountP20,@ttxtCountP50,@ttxtCount1,@ttxtCount2,@ttxtCount5,@ttxtCount10,@ttxtCount20,@ttxtCount50,@ttxtCount100,@ttxtCount1000,@tlblTotalP05,@tlblTotalP10,@tlblTotalP20,@tlblTotalP50,@tlblTotal1,@tlblTotal2,@tlblTotal5,@tlblTotal10,@tlblTotal20,@tlblTotal50,@tlblTotal100,@tlblTotal1000,@ttxtCountTotal,@tlblTotalTotal,@tUserId,@tCounter)   
Update NumberTable set BeginCashDrawId=BeginCashDrawId+1,ResetDrawerId=ResetDrawerId+1;
Update beginCashDrawerActive_table set Active=0 Where Ctr_no =(select Ctr_no from User_table where User_no=@tUserId);
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_DiscountDisplay]

AS
BEGIN
	
	SET NOCOUNT ON;
	DECLARE @tQuary4 VARCHAR(max)='Yes';
	DECLARE @tQuary2 VARCHAR(max);
	DECLARE @tQuary1 VARCHAR(max)='select Calculation,DiscountName,Amount,convert(Datetime,EndDate,103) as EndDate from DiscountSetting_Table where ';
	DECLARE @tQuary3 VARCHAR(max)=' AND Enddate>(Select convert(Datetime,EndofDay,108) from EndOfday_table where id=(Select max(id) from EndOfDay_Table))'; 
	select @tQuary4= @tQuary1+(CASE(datename(dw,DATEADD(day,1,EndOfDay)))
	 when 'Monday' THEN 'Monday='
	 when 'Tuesday' THEN 'Tuesday='
	 when 'Wednesday' THEN 'Wednessday='
	 when 'Thursday' THEN 'Thursday='
	 when 'Friday' THEN 'Friday='
	 when 'Saturday' THEN 'Saturday='
	 Else 'Sunday=' End)+'''Yes'''+@tQuary3 from EndOfDay_Table  where id=(Select max(id) from EndOfDay_Table)	
   
	Execute (@tQuary4);
END


GO

CREATE procedure [dbo].[SP_DeleteTotalSales]
as
SET NOCOUNT ON 
 DECLARE 
 @TranCounter INT,
  @id INT;
    SET @TranCounter = @@TRANCOUNT;
    IF @TranCounter > 0
     SAVE TRANSACTION ProcedureSave;
    ELSE
    BEGIN TRANSACTION;
 BEGIN TRY
    Declare @StrnSNo Varchar(50),@StrnNo varchar(50),@ItemNo varchar(50),@Qty Numeric(18,2),@Rate numeric(18,2), @Amount Numeric(18,2);
	declare c1 Cursor Local Read_only for select strn_sno,strn_no,item_no,nt_qty,Rate,Amount from stktrn_table WHERE strn_type=1 AND StrnParty_no=2;
	declare @counts int=(select count(*)from stktrn_table where strn_no<>1 and strn_type=1 AND StrnParty_no=2)
	 if @counts>0
	  begin
			open c1 
				fetch from c1 into  @StrnSNo,@StrnNo,@ItemNo,@Qty,@Rate,@Amount	
				declare @counts_1 int=(Select COUNT(*) from stktrn_table Where strn_rtno=@StrnSNo) 
				if @counts_1=0  
				 Begin					
					update Item_table set nt_cloqty=nt_cloqty+@Qty,nt_salqty=nt_salqty-@Qty where Item_no=@ItemNo
				 end
		    close c1
		 end
	update Item_table set  nt_salqty=0, Nt_SalRetval=0, Nt_Salval=0, nt_srtqty=0
	truncate table salMas_table
	truncate table Salrecv_table
	
	Delete from stktrn_table where strn_type in(1,2)
	truncate table vch_table
	truncate table DiscountDetail_table
	
	truncate table adjmas_table
	truncate table RemoveItemDetail_table
	update NumberTable set  VoucherNo=0, VoucherSno=0, SalRecv_Sno=0, DiscountEntry_Id=0, RemovedItemId=0
	update VoucherNo_Table set Vch_Billno=1
	
	update NumberTable set CounterSettleDrawerId=0, BeginCashDrawId=0, ResetDrawerId=0, EndOfDayId=0
	truncate table counterSettle_table
	truncate table beginCashDrawer_table
	truncate table ResetDrawer_table
	truncate table EndOfDay_table
	truncate table BeginCashDrawerActive_table
IF @TranCounter = 0           
    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
 IF @TranCounter = 0         
            ROLLBACK TRANSACTION;
        ELSE
        
            IF XACT_STATE() <> -1        
                ROLLBACK TRANSACTION ProcedureSave;        
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE();
        SELECT @ErrorSeverity = ERROR_SEVERITY();
        SELECT @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, -- Message text.
                   @ErrorSeverity, -- Severity.
                   @ErrorState -- State.
                   );
    END CATCH

GO

CREATE procedure [dbo].[SP_DeleteTotalPurchase]
as
SET NOCOUNT ON 
 DECLARE 
 @TranCounter INT,
 @id INT;
   SET @TranCounter = @@TRANCOUNT;
   IF @TranCounter > 0
   SAVE TRANSACTION ProcedureSave;
   ELSE
   BEGIN TRANSACTION;
  BEGIN TRY
    declare @counts1 int=0
    Declare @strnSno varchar(50),@ItemNo varchar(50),@Qty Numeric(18,2);
    declare c1 Cursor Local Read_only for   select stktrn_table.strn_sno,stktrn_table.item_no,stktrn_table.nt_qty from purmas_table,stktrn_table where stktrn_table.strn_no=purmas_table.Pmas_sno and stktrn_table.strn_type=3;

	select @counts1=Count(*) from purmas_table,stktrn_table where stktrn_table.strn_no=purmas_table.Pmas_sno and stktrn_table.strn_type=3

	if @counts1>0
	  begin
			open c1 
				fetch from c1 into @strnSno,@ItemNo,@Qty
				 update Item_table set nt_cloqty=nt_cloqty-@Qty where item_no=@ItemNo
				 delete from stktrn_table where strn_sno=@strnSno
			Close c1		
      End
    Begin
    
    update Item_table set nt_purqty=0,nt_prtqty=0,tx_purqty=0,tx_prtqty=0,tx_PurRetVal=0,Nt_PurVal=0,Pur_PendQty=0,Tx_PurVal=0,Nt_PurRetVal=0
    truncate table purmas_table
    End
IF @TranCounter = 0 

    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
 IF @TranCounter = 0         
            ROLLBACK TRANSACTION;
        ELSE
        
            IF XACT_STATE() <> -1        
                ROLLBACK TRANSACTION ProcedureSave;        
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE();
        SELECT @ErrorSeverity = ERROR_SEVERITY();
        SELECT @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, -- Message text.
                   @ErrorSeverity, -- Severity.
                   @ErrorState -- State.
                   );
    END CATCH


GO

CREATE procedure [dbo].[sp_DeleteAllTransaction]
as
begin
SET NOCOUNT ON 
update Item_table set tx_opnqty=0, nt_opnqty=0,Stock_Value=0, nt_purqty=0,nt_prtqty=0,tx_purqty=0,tx_prtqty=0,InvoiceQty=0,nt_salqty=0,nt_srtqty=0,tx_salqty=0,tx_srtqty=0, nt_cloqty=0,tx_cloqty=0, Nt_Salval=0, Tx_Salval=0, Nt_SalRetval=0,tx_SalRetval=0,Nt_PurVal=0,Tx_PurVal=0, Nt_PurRetVal=0, tx_PurRetVal=0, Pur_PendQty=0, Sal_PendQty=0 
update NumberTable set  VoucherNo=0, StrnSno=0,StrnNo=0, VoucherSno=0,BOM_No=0, SalRecv_Sno=0, DiscountEntry_Id=0, RemovedItemId=0,CounterSettleDrawerId=0, BeginCashDrawId=0, ResetDrawerId=0, EndOfDayId=0
update VoucherNo_Table set Vch_Billno=1
update User_table set Active='False'
truncate table counterSettle_table
truncate table beginCashDrawer_table
truncate table ResetDrawer_table
truncate table EndOfDay_table
truncate table BeginCashDrawerActive_table
truncate table BOMissu_Table
truncate table PaymentDetail_table
truncate table PurOrdAck_table
truncate table purOrder_table
truncate table PurQuotation_table
truncate table PurQuotationTrn_table
truncate table QuotJobcard_master
truncate table QuotJobcard_Trans
truncate table Quotmas_table
truncate table RemoveItemDetail_table
truncate table salMas_table
truncate table Salrecv_table
truncate table Stktrn_table
truncate table SalHold_table 
truncate table SalOrder_table
truncate table Stockadjmas_table
truncate table vch_table
truncate table DiscountDetail_table
truncate table purmas_table
truncate table adjmas_table
truncate table useractivity_table
truncate table tempsalMas_table
truncate table tempSalrecv_table
truncate table tempStktrn_table
truncate table tempvch_table
truncate table tempDiscountDetail_table
Truncate table PaymentDetail_table
truncate table dtSingleFreeHoldInsert
truncate table FreeItemDetail_table
truncate table FreeItemMaster_table
truncate table SalFreeItemDetail_table
END


GO

CREATE PROCEDURE [dbo].[sp_Counter_Update]
(
@Counter_Name as varchar(200),
@Counter_mtname as varchar(200),
@Counter_Name2 as varchar(200)
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 UPDATE DBO.counter_table SET ctr_name=@Counter_Name,ctr_mtname= @Counter_mtname WHERE ctr_name=@Counter_Name2  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE PROCEDURE [dbo].[sp_Counter_Insert]
(
@tCtrName as varchar(200)
)
as
DECLARE @TranCounter INT;
DECLARE @Ctrno int;
DECLARE @CtrGNo int;
DECLARE @CtrNameUpper varchar(200);

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
  Select @Ctrno=max(ctr_no)+1 from Numbertable
  set @CtrNameUpper=UPPER(@tCtrName)
     
  BEGIN
   INSERT INTO dbo.counter_table(ctr_no,ctr_name,ctr_mtname,ctr_grpno ,[ctr_header]
      ,[ctr_footer]
      ,[ctr_cashhead]
      ,[ctr_credhead]
      ,[ctr_cashrethead]
      ,[ctr_credrethead]
      ,[ctr_Itemperpage]
      ,[ctr_Nooflineskip]
      ,[ctr_Linespace]
      ,[ctr_updtac]
      ,[ctr_showstk]
      ,[ctr_salesroundto]
      ,[ctr_TxSaleledger]
      ,[ctr_NtSaleledger]
      ,[ctr_TxretSaleledger]
      ,[ctr_NtretSaleledger]
      ,[ctr_purcledger]
      ,[ctr_Retpurcledger]
      ,[Ctr_Cashledger]
      ,[Ctr_roundledger]
      ,[Ctr_labourac]
      ,[Ctr_labourTaxAc]
      ,[Ctr_LabourEcessAc]
      ,[Ctr_LabourSHEcessAc]
      ,[Ctr_outPaidac]
      ,[Ctr_outRecac]
      ,[Ctr_lessspares]
      ,[Ctr_lesslabour]
      ,[Ctr_lessoutwork]
      ,[Ctr_WtyAc]
      ,[Ctr_RejtAc]
      ,[Ctr_WtySalesAc]
      ,[Ctr_WtySendAc]
      ,[Ctr_outTaxAc]
      ,[Ctr_ratediff]
      ,[Group_no]
      ,[brand_no]
      ,[model_no]
      ,[rack_no]
      ,[Area_No]
      ,[Ctr_colsetting]
      ,[Ctr_stkitemonly]
      ,[Ctr_noofdecimal]
      ,[Jrnl_ColSetting]
      ,[Saleret_setting]
      ,[Ctr_RVoucher]
      ,[Ctr_PyVoucher]
      ,[Ctr_SVoucher]
      ,[Ctr_PVoucher]
      ,[Ctr_CoVoucher]
      ,[Ctr_JVoucher]
      ,[Ctr_CrVoucher]
      ,[Ctr_DrVoucher]
      ,[Ctr_OtVoucher]
      ,[ctr_Mainctr]
      ,[Ctr_TaxNo]
      ,[Ctr_Removebill]
      ,[Ctr_CashRetail]
      ,[Ctr_CreditRetail]
      ,[Ctr_CashWhole]
      ,[Ctr_CreditWhole]
      ,[ctr_CashRetailPrinter]
      ,[ctr_CreditRetailPrinter]
      ,[ctr_CashWholePrinter]
      ,[ctr_CreditWholePrinter])
  VALUES(@Ctrno ,@tCtrName ,@CtrNameUpper,1,'','','Cash Bill','Invoice','','','0','0','0','0','0','100','4','4','4','4','3','3','5','6','7','1','0','0','1','1','1','1','1','1','1','1','0','0','0','0','0','0','0','0','','0','0','','','10','11','12','13','14','15','16','17','18','0','0','0','','','','','','','','')
    
  END  
  
  update NumberTable set ctr_no=ctr_no+1  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_btnUpgradeSales]
as
DECLARE @TranCounter INT; 
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY  

INSERT INTO salmas_table ([smas_no],[smas_slno],[smas_rtno],[smas_billprefix],[smas_billsuffix],[smas_billno],[Smas_Bill],[smas_billdate],[smas_billtime],[smas_days],[Mechanic_no],[MechCommi_Amt],[MechCommi_Per],[SmanCommi_Amt],[SManCommi_Per],[MechCommiTax_Per],[Smas_SmanNo],[dc_no],[dc_date],[order_no],[reference_date],[reference_no],[Vehicle_no],[Smas_Others1],[Smas_others2],[smas_others3],[smas_others4],[UserNo] ,[ctr_no],[Godown_no],[party_no],[Customer_no],[smas_name],[smas_add1],[smas_add2],[smas_add3],[smas_add4],[smas_add5],[smas_st],[smas_cst],[smas_cashmode],[Smas_salmode],[smas_saltype],[smas_ordertype],[smas_addled1] ,[smas_addled2] ,[smas_addled3],[smas_addled4],[smas_adddet1],[smas_adddet2],[smas_adddet3],[smas_adddet4],[smas_adddisc1],[smas_adddisc2],[smas_adddisc3],[smas_adddisc4],[smas_adddiscr1],[smas_adddiscr2],[smas_adddiscr3],[smas_adddiscr4],[smas_addamt1],[smas_addamt2],[smas_addamt3],[smas_addamt4],[smas_Gross],[smas_GrossAmount],[BankCharge],[smas_NetAmount],[smas_rcvdamount],[smas_remarks],[smas_Cancel],[smas_cremark],[smas_rounded],[CashReceived],[Profit],[Update_Flag],[Tax_Refund],[Print_no],[smas_point],[smas_issue],[smas_paidAmt],[smas_Touch],[smas_TotalCash],[smas_TotalCredit],[smas_TotalNets],[Loaditem] ,[Smas_columns],[VoucherSno],[SalesVchNo],[ReceiptVchNo],[CrNoteVchNo],[CardSno] ,[CardNo])
Select [smas_no],[smas_slno],[smas_rtno],[smas_billprefix],[smas_billsuffix],[smas_billno],[Smas_Bill],[smas_billdate],[smas_billtime],[smas_days],[Mechanic_no],[MechCommi_Amt],[MechCommi_Per],[SmanCommi_Amt],[SManCommi_Per],[MechCommiTax_Per],[Smas_SmanNo],[dc_no],[dc_date],[order_no],[reference_date],[reference_no],[Vehicle_no],[Smas_Others1],[Smas_others2],[smas_others3],[smas_others4],[UserNo] ,[ctr_no],[Godown_no],[party_no],[Customer_no],[smas_name],[smas_add1],[smas_add2],[smas_add3],[smas_add4],[smas_add5],[smas_st],[smas_cst],[smas_cashmode],[Smas_salmode],[smas_saltype],[smas_ordertype],[smas_addled1] ,[smas_addled2] ,[smas_addled3],[smas_addled4],[smas_adddet1],[smas_adddet2],[smas_adddet3],[smas_adddet4],[smas_adddisc1],[smas_adddisc2],[smas_adddisc3],[smas_adddisc4],[smas_adddiscr1],[smas_adddiscr2],[smas_adddiscr3],[smas_adddiscr4],[smas_addamt1],[smas_addamt2],[smas_addamt3],[smas_addamt4],[smas_Gross],[smas_GrossAmount],[BankCharge],[smas_NetAmount],[smas_rcvdamount],[smas_remarks],[smas_Cancel],[smas_cremark],[smas_rounded],[CashReceived],[Profit],[Update_Flag],[Tax_Refund],[Print_no],[smas_point],[smas_issue],[smas_paidAmt],[smas_Touch],[smas_TotalCash],[smas_TotalCredit],[smas_TotalNets],[Loaditem] ,[Smas_columns],[VoucherSno],[SalesVchNo],[ReceiptVchNo],[CrNoteVchNo],[CardSno] ,[CardNo] from Tempsalmas_table

INSERT INTO stktrn_table([strn_sno],[strn_no],[strn_rtno] ,[strn_type],[strn_date],[Godown_BillNo],[StrnParty_no],[Grn_no],[OrderSno],[Dc_no],[item_no],[ctr_no],[godown_no],[Unit_no] ,[Unit_Ratio],[QtyInPieces],[nt_qty],[tx_qty],[Short_qty],[rnt_qty],[rtx_qty],[Invnt_qty],[Invtx_qty],[QtyDetails],[Rate],[Tax_Rate],[CurrencyNo],[CurrencyValue],[Amount],[Tax_No],[Disc_PerQty],[Disc_Per],[Disc_Amt],[Adldisc_Per],[Adldisc_Amt],[Othdisc_Amt],[OthPurdisc],[Ed_PerQty],[Ed_Per],[Ed_Amt],[Cess_Per],[Cess_Amt],[SHECess_Per],[SHECess_Amt],[HL_Per],[HL_Amt],[CST_per],[CST_amt],[tax_Flag],[tax_per],[tax_amt],[Sur_per],[Sur_amt],[CommiPer],[Commi],[SmanPer],[SmanAmt],[spl_discamt],[tot_amt],[alp1],[alp2],[alp3],[alp4],[ala1],[ala2],[ala3],[ala4],[Net_Amt],[Other_Exp],[BillOther_Exp],[strn_remarks],[Strn_Cancel],[Order_Ack] ,[Cost] ,[Mrsp],[Margin],[Margin_No],[Srate],[Frtx_Qty],[RFrnt_Qty],[RFrtx_Qty],[Frnt_Qty],[FreeQty],[FreeItemNo],[Profit],[Item_Point],[Mech_no],[PurRate],[InvoiceNo],[InvoiceDate],[OpenItem],[OpenItemCount])
select [strn_sno],[strn_no],[strn_rtno] ,[strn_type],[strn_date],[Godown_BillNo],[StrnParty_no],[Grn_no],[OrderSno],[Dc_no],[item_no],[ctr_no],[godown_no],[Unit_no] ,[Unit_Ratio],[QtyInPieces],[nt_qty],[tx_qty],[Short_qty],[rnt_qty],[rtx_qty],[Invnt_qty],[Invtx_qty],[QtyDetails],[Rate],[Tax_Rate],[CurrencyNo],[CurrencyValue],[Amount],[Tax_No],[Disc_PerQty],[Disc_Per],[Disc_Amt],[Adldisc_Per],[Adldisc_Amt],[Othdisc_Amt],[OthPurdisc],[Ed_PerQty],[Ed_Per],[Ed_Amt],[Cess_Per],[Cess_Amt],[SHECess_Per],[SHECess_Amt],[HL_Per],[HL_Amt],[CST_per],[CST_amt],[tax_Flag],[tax_per],[tax_amt],[Sur_per],[Sur_amt],[CommiPer],[Commi],[SmanPer],[SmanAmt],[spl_discamt],[tot_amt],[alp1],[alp2],[alp3],[alp4],[ala1],[ala2],[ala3],[ala4],[Net_Amt],[Other_Exp],[BillOther_Exp],[strn_remarks],[Strn_Cancel],[Order_Ack] ,[Cost] ,[Mrsp],[Margin],[Margin_No],[Srate],[Frtx_Qty],[RFrnt_Qty],[RFrtx_Qty],[Frnt_Qty],[FreeQty],[FreeItemNo],[Profit],[Item_Point],[Mech_no],[PurRate],[InvoiceNo],[InvoiceDate],[OpenItem],[OpenItemCount] from Tempstktrn_table

INSERT INTO Vch_table([Sno],[Vch_Sno],[Vch_Pre],[Vch_NoLong],[Vch_Suf],[Vch_No],[Vch_MtNo],[Ctr_no],[UserNo],[RepNo],[Vch_Party],[ref_no] ,[ref_det],[Vch_Date],[Vch_type],[ledger_no],[ledger_no1],[Dr_amount],[Cr_amount],[Vch_Remarks],[Vch_IndRemarks],[Vch_Cancel],[Vch_CRemarks],[Vch_flag]) 
select [Sno],[Vch_Sno],[Vch_Pre],[Vch_NoLong],[Vch_Suf],[Vch_No],[Vch_MtNo],[Ctr_no],[UserNo],[RepNo],[Vch_Party],[ref_no] ,[ref_det],[Vch_Date],[Vch_type],[ledger_no],[ledger_no1],[Dr_amount],[Cr_amount],[Vch_Remarks],[Vch_IndRemarks],[Vch_Cancel],[Vch_CRemarks],[Vch_flag] from TempVch_table

INSERT INTO DiscountDetail_table([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) select [Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount] from TempDiscountDetail_table

INSERT INTO [SalRecv_table]([SalRecv_Sno],[SalRecv_Salno],[SalRecv_Led],[SalRecv_Amt],[SalRecv_Refund],[SalRecv_Cancel])
Select [SalRecv_Sno],[SalRecv_Salno],[SalRecv_Led],[SalRecv_Amt],[SalRecv_Refund],[SalRecv_Cancel] from [TempSalRecv_table]

Truncate table Tempsalmas_table
Truncate table Tempstktrn_table
Truncate table TempVch_table
Truncate table TempDiscountDetail_table
Truncate Table TempSalRecv_table





        Declare @tBillno Numeric(18,2);
		Declare @tSalRecv_Sno Numeric(18,0)
		Declare @tNetAmt numeric(18,2);
		Declare @tPartyno Numeric(18,0)
		Declare @tCancel numeric(18,0);
		Declare c1 Cursor local read_only for select smas_billno, smas_NetAmount, party_no, smas_Cancel from SalMas_table where smas_billdate=(Select convert(date,DATEADD(day,1,MAX(EndOfDay)),103)from EndOfDay_Table)
		open c1
		fetch from c1 into @tBillno,@tNetAmt,@tPartyno,@tCancel
		while @@fetch_status=0
		begin
		if not exists(select salRecv_Salno from SalRecv_table where SalRecv_Salno=@tBillno)
		begin
		select @tSalRecv_Sno=(max(SalRecv_Sno)+1) from NumberTable;		
		if @tPartyno=2
		INSERT INTO SalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,'5',@tNetAmt,'0',@tCancel)
		else
		INSERT INTO SalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,@tPartyno,@tNetAmt,'0',@tCancel)
		Update NumberTable set SalRecv_Sno=@tSalRecv_Sno;
	  end                    
	  fetch next from c1 into @tBillno,@tNetAmt,@tPartyno,@tCancel
	  end
	  close c1
	  deallocate c1   
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_GroupNameProfit]
(@tFromDate date,@tToDate date)
AS
BEGIN
SET NOCOUNT ON 
select Item_Grouptable.Item_groupname,Item_table.Item_name,SUM(stktrn_table.nt_qty- stktrn_table.rnt_qty) as Qty,CONVERT(numeric(18,2),Avg((((stktrn_table.nt_qty- stktrn_table.rnt_qty)*stktrn_table.Rate)-stktrn_table.Profit)/(stktrn_table.nt_qty- stktrn_table.rnt_qty))) as ItemCost,CONVERT(numeric(18,2),AVG(stktrn_table.Rate)) as MRP,convert(numeric(18,2),SUM(stktrn_table.Profit)) as Profit from stktrn_table,Item_table,Item_Grouptable where Item_table.Item_no=stktrn_table.item_no and Item_table.item_Groupno=Item_Grouptable.Item_groupno and stktrn_table.Strn_Cancel=0  and stktrn_table.strn_rtno=0 and stktrn_table.strn_type=1 and stktrn_table.nt_qty<>stktrn_table.rnt_qty and stktrn_table.strn_date between @tFromDate and @tToDate group by item_table.Item_name,Item_Grouptable.Item_groupname
END

GO

Create PROCEDURE [dbo].[sp_GroupNameOnly]
(@tFromDate date,@tToDate date)
AS
BEGIN
Select Item_Grouptable.Item_groupname from stktrn_table,Item_table,Item_Grouptable where Item_table.Item_no=stktrn_table.item_no and Item_table.item_Groupno=Item_Grouptable.Item_groupno and stktrn_table.strn_date between @tFromDate and @tToDate group by Item_Grouptable.Item_groupname
END

GO

CREATE PROCEDURE [dbo].[sp_GroupImg_Update]
(
@GroupPos as varchar(200),
@Items_Image as image,
@Group_Color as varchar(200),
@Group_visibility as varchar(200),
@Font_Color as varchar(200),
@item_groupname as varchar(200),
@item_groupno as int,@itemLocation as varchar(max),@imageVisibility varchar(50)
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 UPDATE DBO.item_GroupTable SET GroupPos=@GroupPos,Items_Image=@Items_Image,Group_Color= @Group_Color,Group_visibility=@Group_visibility,Font_Color=@Font_Color,item_groupname=@item_groupname,ImageLocation=@itemLocation,imagevisibility=@imageVisibility  WHERE Item_groupno=@item_groupno 
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE PROCEDURE [dbo].[sp_Group_Update]
(
@GroupPos as varchar(200),
@Group_Color as varchar(200),
@Group_visibility as varchar(200),
@Font_Color as varchar(200),
@item_groupname as varchar(200),
@item_groupno as int,
@imageVisibility as varchar(50) 
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 UPDATE DBO.item_GroupTable SET GroupPos=@GroupPos,Group_Color= @Group_Color,Group_visibility=@Group_visibility,Font_Color=@Font_Color,Item_groupname=@item_groupname,imagevisibility=@imageVisibility  WHERE Item_groupno=@item_groupno   
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_Group_Insert]
(
@Item_groupno as int,
@Item_groupname as varchar(200),
@Item_groupmtname as varchar(200),
@Item_grouplevel as int,
@Item_groupunder as int,
@Item_Commodity as varchar(200),
@Item_groupgno as smallint,
@Item_groupflag as smallint,
@Std_Group as bit,
@GroupPos as int,
@Group_Color as varchar(200),
@Group_visibility as varchar(200),
@Font_Color as varchar(200),
@imageVisibility as varchar(50)
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
  IF NOT EXISTS(Select * from Item_Grouptable where Item_groupname=@Item_groupname)
  
  BEGIN
  INSERT INTO DBO.Item_Grouptable(Item_groupno,Item_groupname,Item_groupmtname,Item_grouplevel,Item_groupunder,Item_Commodity,Item_groupgno,Item_groupflag,Std_Group,GroupPos,Group_Color,Group_visibility,Font_Color,Imagevisibility) 
  VALUES(@Item_groupno ,@Item_groupname ,@Item_groupmtname ,@Item_grouplevel ,@Item_groupunder ,@Item_Commodity ,@Item_groupgno ,@Item_groupflag ,@Std_Group,@GroupPos,@Group_Color,@Group_visibility,@Font_Color,@imageVisibility);
  END
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_GetEndOfDay](@tResult DATETIME OUT)
AS
DECLARE @tEndOfDay DATETIME;
DECLARE @isChk VARCHAR(10)='FALSE';
DECLARE C1 CURSOR LOCAL READ_ONLY FOR Select EndOfDay from EndOFday_Table where Id=(select EndOfDayId from NumberTable);

BEGIN
OPEN C1
FETCH FROM C1 INTO @tEndOfDay
WHILE @@fetch_status=0
BEGIN
SET @isChk='TRUE';
SELECT @tResult=@tEndOfDay+1 FROM EndOFday_Table where Id=(select EndOfDayId from NumberTable);
FETCH NEXT FROM C1 INTO @tEndOfDay 
END
IF @isChk='FALSE'
SELECT @tResult=GETDATE();
CLOSE C1
DEALLOCATE c1
END


GO

CREATE Procedure [dbo].[sp_FreeItemUpdate](@tFreeSnoNew numeric(18,0), @tFromDate date, @tToDate Date,@tItemName varchar(400),@tOfferType varchar(100),@tSaleQtyFrom numeric(18,2), @tSaleQtyTo numeric(18,2) ,@tSalesRate Numeric(18,2),@tActive numeric(18,0),@tFreeTable Type_gridValue Readonly, @ItemImage nvarchar(max))
as 
begin
SET NOCOUNT ON 
Declare @tFreeSno Numeric(18,0);
Declare @tFreeSnoGroup Numeric(18,0);
Declare @tItemno Numeric(18,0);
Declare @tFreeItem_no Numeric(18,0);
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@StockAmt numeric(18,2),@Active Numeric(18,2);
Select @tFreeSnoGroup=FreeSno+1 from Numbertable
Declare c1 cursor Local Read_only for Select ItemName,Qty,Rate,Amt,Disc from @tFreeTable
Select @tItemno=item_no from Item_table where item_name=@tItemName
if @tOfferType='Item Price'
Begin
Select @tFreeItem_no=item_no from item_table where item_name=@ItemName
Update FreeItem_table set [FreeItem_no]=@tItemno,[Item_no]=@tItemno,[SaleQtyFrom]=@tSaleQtyFrom,[SaleQtyTo]=@tSaleQtyTo,[Free_Qty]='0',[Rate]=@tSalesRate,[Disc_Amt]='0',[Disc_Per]='0',[FromDate]=@tFromDate,[ToDate]=@tToDate,[FreeItem_Stock]='0',[FreeItem_TempStock]='0', FreeType=@tOfferType,Active=@tActive , ItemImage= @ItemImage where FreeSnoGroup= @tFreeSnoNew
End
if @tOfferType<>'Item Price'
Delete from FreeItem_table where FreeSnoGroup=@tFreeSnoNew
Open c1
Fetch from c1 into @ItemName,@Qty,@Rate,@StockAmt,@Active
while @@FETCH_STATUS=0
Begin
Select @tFreeSno=FreeSno+1 from Numbertable
Select @tFreeItem_no=item_no from item_table where item_name=@ItemName
Update FreeItem_table set Active='0' where FreeSnoGroup<>@tFreeSnoGroup and FreeType<>'Item Price' and Item_no=(select Item_no from Item_table where Item_name=@ItemName) and FromDate<=@tFromDate and ToDate>=@tFromDate
INSERT INTO FreeItem_table([FreeSno],[FreeItem_no],[Item_no],[SaleQtyFrom],[SaleQtyTo],[Free_Qty],[Rate],[Disc_Amt],[Disc_Per],[Date],[FromDate],[ToDate],[FreeItem_Stock],[FreeItem_TempStock], FreeType,Active,FreeSnoGroup, ItemImage)            
     VALUES
           (@tFreeSno,@tFreeItem_no,@tItemno,@tSaleQtyFrom,@tSaleQtyTo,@Qty,@Rate,'0','0',getdate(),@tFromDate,@tToDate,@StockAmt,@StockAmt,@tOfferType,@tActive,@tFreeSnoGroup, @ItemImage)
Update NumberTable set FreeSno=freeSno+1
Fetch Next from c1 into @ItemName,@Qty,@Rate,@StockAmt,@Active
           
End
Close c1
Deallocate c1
End

GO

CREATE Procedure [dbo].[sp_FreeItemInsertNew]
(@tFromDate date,@tToDate Date,@tOfferName varchar(max),@tItemType varchar(50),@tOfferType varchar(50),@tTotSaleQty numeric(18,2),@tTotSaleRate numeric(18,2),
@tFreeTable Type_FreeItem2 Readonly,@tActive varchar(50),@tItemTable Type_FreeItem1 Readonly,@ItemImage varchar(max),@Sunday varchar(10),@Monday varchar(10),@Tuesday varchar(10),@Wednesday varchar(10),@Thursday varchar(10),@Friday varchar(10),@Sturday varchar(10))
As
Begin
Declare @tFreeSno Numeric(18,0);
Declare @tItemName varchar(400);
Declare @tSalesQty numeric(18,2);
Declare @tFreeGroupSno numeric(18,0);
Declare @tQty numeric(18,2);
Declare @tItem_no numeric(18,0), @tItem_Mrsp Numeric(18,2)=0.00;
Declare c1 cursor Local Read_only for Select ItemName,Qty from @tItemTable
Declare c2 cursor Local Read_only for Select ItemName,Free_Qty from @tFreeTable
Select @tFreeSno=(FreeSno) from NumberTable
set @tFreeGroupSno=@tFreeSno+1;
open c1
fetch from c1 into @tItemName, @tSalesQty
while @@FETCH_STATUS=0
begin
set @tFreeSno=@tFreeSno+1;
Select @tItem_no=Item_no,@tItem_Mrsp=Item_mrsp from Item_table where Item_name=@tItemName and Item_Active=1
INSERT INTO [dbo].[FreeItemMaster_table]
           ([FreeSno],[FromDate],[ToDate],[OfferName],[ItemType],[FreeType],[TotSaleQty],[TotSalePrice]
           ,[Item_no],[SaleQty],[SaleRate],[SaleAmt],[TotFreeQty],[TempTotFreeQty],[Date],[FreeSnoGroup],[ItemImage] ,[Active],[Sunday],[Monday],[Tuesday],[Wednesday],[Thursday],[Friday],[Sturday])
     VALUES(@tFreeSno,@tFromDate, @tToDate,@tOfferName,@tItemType,@tOfferType,@tTotSaleQty,@tTotSaleRate,
    @tItem_no,@tSalesQty, @tItem_Mrsp,(@tSalesQty*@tItem_Mrsp),0,0,GETDATE(),@tFreeGroupSno,@ItemImage,@tActive,@Sunday,@Monday,@Tuesday,@Wednesday,@Thursday,@Friday,@Sturday)
    update NumberTable set  FreeSno=FreeSno+1
     fetch next from c1 into @tItemName, @tSalesQty
     End
     close c1
     deallocate c1
     
     open c2
fetch from c2 into @tItemName, @tSalesQty
while @@FETCH_STATUS=0
begin
Select @tItem_no=Item_no,@tItem_Mrsp=Item_mrsp from Item_table where Item_name=@tItemName and Item_Active=1
INSERT INTO [dbo].[FreeItemDetail_table]([FreeSno],[FreeItem_no],[FreeQty],[FreeRate],[FreeItemStock],[FreeItemTempStock],[Active])
VALUES(@tFreeGroupSno,@tItem_no,@tSalesQty,@tItem_Mrsp,0,0,@tActive)
fetch next from c2 into @tItemName, @tSalesQty
 End
 close c2
 Deallocate c2
End

GO

CREATE Procedure [dbo].[sp_FreeItemInsert](@tFromDate date, @tToDate Date,@tItemName varchar(400),@tOfferType varchar(100),@tSaleQtyFrom numeric(18,2), @tSaleQtyTo numeric(18,2) ,@tSalesRate Numeric(18,2),@tActive numeric(18,0),@tFreeTable Type_gridValue Readonly, @ItemImage nvarchar(max))
as 
begin
SET NOCOUNT ON 
Declare @tFreeSno Numeric(18,0);
Declare @tFreeSnoGroup Numeric(18,0);
Declare @tItemno Numeric(18,0);
Declare @tFreeItem_no Numeric(18,0);
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@StockAmt numeric(18,2),@Active Numeric(18,2);
Select @tFreeSnoGroup=FreeSno+1 from Numbertable
Declare c1 cursor Local Read_only for Select ItemName,Qty,Rate,Amt,Disc from @tFreeTable
Select @tItemno=item_no from Item_table where item_name=@tItemName
if @tOfferType='Item Price'
Begin
Select @tFreeSno=FreeSno+1 from Numbertable
Select @tFreeItem_no=item_no from item_table where item_name=@ItemName
Update FreeItem_table set Active='0' where Item_no=@tItemno and FromDate<=@tFromDate and ToDate>=@tFromDate
INSERT INTO FreeItem_table([FreeSno],[FreeItem_no],[Item_no],[SaleQtyFrom],[SaleQtyTo],[Free_Qty],[Rate],[Disc_Amt],[Disc_Per],[Date],[FromDate],[ToDate],[FreeItem_Stock],[FreeItem_TempStock], FreeType,Active, FreeSnoGroup, ItemImage)           
     VALUES
           (@tFreeSno,@tItemno,@tItemno,@tSaleQtyFrom,@tSaleQtyTo,'0',@tSalesRate,'0','0',getdate(),@tFromDate,@tToDate,'0','0',@tOfferType,@tActive,@tFreeSnoGroup, @ItemImage)
Update NumberTable set FreeSno=freeSno+1

End
Open c1
Fetch from c1 into @ItemName,@Qty,@Rate,@StockAmt,@Active
while @@FETCH_STATUS=0
Begin
Select @tFreeSno=FreeSno+1 from Numbertable
Select @tFreeItem_no=item_no from item_table where item_name=@ItemName
Update FreeItem_table set Active='0' where FreeSnoGroup<>@tFreeSnoGroup and  Item_no=(select Item_no from Item_table where Item_name=@tItemName) and FromDate<=@tFromDate and ToDate>=@tFromDate
INSERT INTO FreeItem_table([FreeSno],[FreeItem_no],[Item_no],[SaleQtyFrom],[SaleQtyTo],[Free_Qty],[Rate],[Disc_Amt],[Disc_Per],[Date],[FromDate],[ToDate],[FreeItem_Stock],[FreeItem_TempStock], FreeType,Active,FreeSnoGroup, ItemImage)            
     VALUES
           (@tFreeSno,@tFreeItem_no,@tItemno,@tSaleQtyFrom,@tSaleQtyTo,@Qty,@Rate,'0','0',getdate(),@tFromDate,@tToDate,@StockAmt,@StockAmt,@tOfferType,@tActive,@tFreeSnoGroup,@ItemImage)
Update NumberTable set FreeSno=freeSno+1
Fetch Next from c1 into @ItemName,@Qty,@Rate,@StockAmt,@Active
           
End
Close c1
Deallocate c1
End

GO

CREATE Procedure [dbo].[sp_EndOfDayPrinting](@tActionType varchar(300),@tDate date,@tValue varchar(300))
AS
BEGIN
SET NOCOUNT ON 
IF @tActionType='lblCashSalesTotal'
	Select sum(SalRecv_table.SalRecv_Amt) as Amt from SalRecv_table,SalMas_Table where  Smas_cancel<>1 and Smas_rtno=0 and ctr_no=( select Ctr_no from User_table where User_no=@tValue) and SalRecv_table.SalRecv_Led='5' and SalRecv_table.SalRecv_Salno=SalMas_Table.smas_billno and smas_billdate =@tDate group by SalRecv_table.SalRecv_Led
	
if @tActionType='CashInDrawer'
	BEGIN
	DECLARE @tBeginDate date;
	DECLARE @tEndDate date;
	select @tBeginDate=Date from beginCashDrawer_table where id=(select max(id) from BeginCashDrawer_table where Ctr_no=(Select ctr_no from user_table where user_no=1))
    select @tEndDate=CONVERT(date,EndOfDay,103) from EndOfDay_Table where Id=(select EndOfDayId from NumberTable)
    if @tBeginDate<>@tEndDate    
	Select Sum(PreviousDrawerCash) as PreviousDrawerCash from ResetDrawer_table where BeginCashDraw_Id=(select max(id) from BeginCashDrawer_table where Ctr_no=(Select ctr_no from user_table where user_no=@tValue))	
	END
if @tActionType='lblStartAmt'
	BEGIN
  
    
    DECLARE @tCount numeric(18,0);
    DECLARE @tDate1 Date;
    DECLARE @tCount1 numeric(18,0);
    select @tCount1=COUNT(*) from EndOfDay_Table;   
   
     Select @tCount=Count(*) from ResetDrawer_table where id=(Select MAX(id) from ResetDrawer_table where BeginCashDraw_Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select ctr_no from user_table where User_no=@tValue) and Date=@tDate))
     
     If @tCount=0
     Begin        
     Select * from BeginCashDrawer_table where Id=(select Max(Id) from BeginCashDrawer_table where Date=@tDate and Ctr_no=(select Ctr_no from User_table where User_no=@tValue) and Date=@tDate);     
     END
      Else
      Select * from ResetDrawer_table where id=(Select MAX(id) from ResetDrawer_table where BeginCashDraw_Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select Ctr_no from User_table where User_no=@tValue) and Date=@tDate))
     END
END

GO
CREATE PROCEDURE [dbo].[sp_EndOfDay_Insert]
(@ttxtCountP05  numeric(18,0),
@ttxtCountP10  numeric(18,0),
@ttxtCountP20  numeric(18,0),
@ttxtCountP50  numeric(18,0),
@ttxtCount1  numeric(18,0),
@ttxtCount2  numeric(18,0),
@ttxtCount5 numeric(18,0),
@ttxtCount10  numeric(18,0),
@ttxtCount20  numeric(18,0),
@ttxtCount50  numeric(18,0),
@ttxtCount100  numeric(18,0),
@ttxtCount1000  numeric(18,0),
@tlblTotalP05  numeric(18,2),
@tlblTotalP10  numeric(18,2),
@tlblTotalP20  numeric(18,2),
@tlblTotalP50  numeric(18,2),
@tlblTotal1  numeric(18,2),
@tlblTotal2  numeric(18,2),
@tlblTotal5  numeric(18,2),
@tlblTotal10  numeric(18,2),
@tlblTotal20  numeric(18,2),
@tlblTotal50  numeric(18,2),
@tlblTotal100  numeric(18,2),
@tlblTotal1000  numeric(18,2),
@ttxtCountTotal  numeric(18,2),
@tlblTotalTotal  numeric(18,2),
@Status varchar(50),
@tUserNo varchar(10))
AS
SET NOCOUNT ON 
DECLARE @tBeginCashDrawId Numeric(18,0)=0;
DECLARE @tResetDrawerId Numeric(18,0)=0;
DECLARE @tEndOFDayId Numeric(18,0)=0;
DECLARE @tCurrentDate datetime
DECLARE @tCounter Numeric(18,0);
DECLARE @tCount NUMERIC(18,0);
DECLARE @tChkUser NUMERIC(18,0);
BEGIN
select @tEndOFDayId=(max(CounterSettleDrawerId)+1) from NumberTable
select @tBeginCashDrawId=MAX(Id) from BeginCashDrawer_table where Ctr_no=(select Ctr_no from User_table where User_no=@tUserNo)

Select @tCurrentDate=CONVERT(date,DATEADD(day,1,EndOfDay),103) from EndOfDay_Table where Id=(Select  EndOfDayId from NumberTable)
Select @tCounter=Ctr_no from User_table where User_no=@tUserNo;
Insert into CounterSettle_Table(Id,EndOfDay,Coin_P05,Coin_P10,Coin_P20,Coin_P50,Coin_1,Coin_2,Coin_5,Coin_10,Coin_20,Coin_50,Coin_100,Coin_1000,Coin_P05amt,Coin_P10amt,Coin_P20amt,Coin_P50amt,Coin_1amt,Coin_2amt,Coin_5amt,Coin_10amt,Coin_20amt,Coin_50amt,Coin_100amt,Coin_1000amt,CoinTotCount,CoinTotAmt,Status,BeginCashDrawId,User_no,Ctr_no) values 
(@tEndOFDayId,@tCurrentDate,@ttxtCountP05,@ttxtCountP10,@ttxtCountP20,@ttxtCountP50,@ttxtCount1,@ttxtCount2,@ttxtCount5,@ttxtCount10,@ttxtCount20,@ttxtCount50,@ttxtCount100,@ttxtCount1000,@tlblTotalP05,@tlblTotalP10,@tlblTotalP20,@tlblTotalP50,@tlblTotal1,@tlblTotal2,@tlblTotal5,@tlblTotal10,@tlblTotal20,@tlblTotal50,@tlblTotal100,@tlblTotal1000,@ttxtCountTotal,@tlblTotalTotal,@Status,@tBeginCashDrawId,@tUserNo,@tCounter)   
Update NumberTable set CounterSettleDrawerId=CounterSettleDrawerId+1
Update beginCashDrawerActive_table set Active=1,EndofDayDate=@tCurrentDate where Ctr_no=(select Ctr_no from User_table where User_no=@tUserNo)
END


GO

CREATE PROCEDURE [dbo].[sp_EndOfDay_Change]
(
@tUserNo varchar(10))
AS
SET NOCOUNT ON 
DECLARE @tBeginCashDrawId Numeric(18,0)=0;
DECLARE @tResetDrawerId Numeric(18,0)=0;
DECLARE @tEndOFDayId Numeric(18,0)=0;
DECLARE @tCurrentDate datetime
DECLARE @tCounter Numeric(18,0);
DECLARE @tCount NUMERIC(18,0);
DECLARE @tChkUser NUMERIC(18,0);
BEGIN
select @tEndOFDayId=(max(EndOfDayId)+1) from NumberTable
Select @tCurrentDate=CONVERT(date,DATEADD(day,1,EndOfDay),103) from EndOfDay_Table where Id=(Select MAX(EndOfDayId) from NumberTable)
Select @tCounter=Ctr_no from User_table where User_no=@tUserNo;
Insert into endofday_table(Id,EndOfDay,User_no,Ctr_no) values(@tEndOFDayId,@tCurrentDate,@tUserNo,@tCounter)   
Update NumberTable set EndOfDayId=EndOfDayId+1

END

GO

Create Procedure [dbo].[sp_ManagerbtnCashDrawer](@tUserno numeric(18,0), @tCounter Numeric(18,0),@tlblStartAmt numeric(18,2) out,@tlblLastReset date out,@tcurrentDate date out,@tlblCCashSalesTotal numeric(18,2) out,@tCashReturnValue numeric(18,2) out,
@tNETSReturnValue numeric(18,2) out,@tlblCashInDrawer numeric(18,2) out,@tlblCNETSSalesTotal numeric(18,2) out,@tlblCreditCardSalesTotal Numeric(18,2) out )
as
Begin 
 
    DECLARE @tCount numeric(18,0);
    DECLARE @tDate Date;
    DECLARE @tCount1 numeric(18,0);

    
    select @tCount1=COUNT(*) from EndOfDay_Table; 
    if @tCount1=1
    SELECT @tDate=CONVERT(date,DATEADD(day,1,MAX(endofday))) from EndOfDay_Table
    ELSE
    SELECT @tDate=CONVERT(date,DATEADD(day,1,MAX(endofday))) from EndOfDay_Table
    
    Select @tCount=Count(*) from ResetDrawer_table where id=(Select MAX(id) from ResetDrawer_table where BeginCashDraw_Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select ctr_no from user_table where User_no=@tUserno) and Date=@tDate))
    If @tCount=0
    Begin        
    Select @tlblStartAmt=(case when CoinTot_Amount is null then 0.00 else CoinTot_Amount end) from BeginCashDrawer_table where Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select Ctr_no from User_table where User_no=@tUserno) and Date=@tDate);     
    END
    Else
    begin
    Select @tlblStartAmt=(case when CoinTot_Amount is null then 0.00 else CoinTot_Amount end) from ResetDrawer_table where id=(Select MAX(id) from ResetDrawer_table where BeginCashDraw_Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select Ctr_no from User_table where User_no=@tUserno) and Date=@tDate))
    end
    if @tlblStartAmt is null
    set @tlblStartAmt=0.00;
    
    -- print @tlblStartAmt
    
    
    if exists ( Select CONVERT(date,EndOfDay,108) from EndOFday_Table where Id=(select EndOfDayId from NumberTable))
    Begin
    Select @tlblLastReset= CONVERT(date,EndOfDay,108) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
    set @tcurrentDate=DATEADD(DAY,1,@tlblLastReset)    
    End
    ELSE
    Begin    
    set @tlblLastReset=DATEADD(DAY,-1,getdate())  
    set @tcurrentDate=GETDATE();  
    End
    
  
if exists (Select sum(SalRecv_table.SalRecv_Amt) as Amt from SalRecv_table,SalMas_Table where  Smas_cancel<>1 and Smas_rtno=0 and ctr_no=( select Ctr_no from User_table where User_no=@tUserno) and SalRecv_table.SalRecv_Led='5' and SalRecv_table.SalRecv_Salno=SalMas_Table.smas_billno and smas_billdate =(Select convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)) group by SalRecv_table.SalRecv_Led)
begin
Select @tlblCCashSalesTotal=(case when sum(SalRecv_table.SalRecv_Amt)IS NULL then 0.00 else sum(SalRecv_table.SalRecv_Amt) End)  from SalRecv_table,SalMas_Table where  Smas_cancel<>1 and Smas_rtno=0 and ctr_no=( select Ctr_no from User_table where User_no=@tUserno) and SalRecv_table.SalRecv_Led='5' and SalRecv_table.SalRecv_Salno=SalMas_Table.smas_billno and smas_billdate =(Select convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)) group by SalRecv_table.SalRecv_Led
end
else
begin
set @tlblCCashSalesTotal=0.00;
end



Declare @tparty_no numeric(18,0),@tsmas_rtno numeric(18,0),@tAmount numeric(18,2);


Declare c1 cursor Local read_only for select party_no, smas_rtno,convert(numeric(18,2),SUM(smas_NetAmount)) as Amount from salmas_table where ctr_no=@tCounter and Smas_Cancel<>1 and smas_rtno<>0 and Smas_billdate=(Select CONVERT(date,dateadd(day,1,endofday),103) from endofday_table where Id=(Select MAX(EndOfDayId) from NumberTable)) group by smas_rtno, party_no
open c1
fetch from c1 into @tparty_no,@tsmas_rtno,@tAmount
while @@FETCH_STATUS=0
begin
if @tAmount is null
set @tAmount=0;
if @tparty_no='2'
set @tCashReturnValue=@tCashReturnValue+@tAmount
if @tparty_no='14'
set @tNETSReturnValue=@tNETSReturnValue+@tAmount
fetch next from c1 into @tparty_no,@tsmas_rtno,@tAmount
end
close c1
deallocate c1


    Declare @tPrevValue Numeric(18,2)=0.00;
    DECLARE @tBeginDate date;
	DECLARE @tEndDate date;
	select @tBeginDate=Date from beginCashDrawer_table where id=(select max(id) from BeginCashDrawer_table where Ctr_no=(Select ctr_no from user_table where user_no=1))
    select @tEndDate=CONVERT(date,EndOfDay,103) from EndOfDay_Table where Id=(select EndOfDayId from NumberTable)
    if @tBeginDate<>@tEndDate    
	Select @tPrevValue=(case when Sum(PreviousDrawerCash) is null then 0.00 else Sum(PreviousDrawerCash) end) from ResetDrawer_table where BeginCashDraw_Id=(select max(id) from BeginCashDrawer_table where Ctr_no=(Select ctr_no from user_table where user_no=@tUserno))	
	
    set @tlblCashInDrawer= (@tlblStartAmt+(@tlblCCashSalesTotal-(@tPrevValue+@tCashReturnValue)));
    

   if exists( select Distinct (Strn_no) from stktrn_table,salmas_table where stktrn_table.strn_type=1 and  stktrn_table.strn_rtno<>1 and  stktrn_table.strn_no=salmas_table.smas_no and stktrn_table.strn_date=(Select convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where  Id=(select EndOfDayId from NumberTable)))
   begin
      Declare @tCashAmt Numeric(18,2) = 0.00, @tNetsAmt Numeric(18,2) = 0.00;
      Declare @tNETs Numeric(18,2),@tCash Numeric(18,2);
      Declare c2 cursor Local Read_only for select (Case When SalRecv_table.SalRecv_Led=14  Then Convert(Numeric(18,2),(case when SUM(SalRecv_table.SalRecv_Amt) is null then 0.00 else SUM(SalRecv_table.SalRecv_Amt) End))  End) as NETs, (Case When SalRecv_table.SalRecv_Led=5 Then Convert(Numeric(18,2),(case when SUM(SalRecv_table.SalRecv_Amt) is null then 0.00 else SUM(SalRecv_table.SalRecv_Amt) End))  End) As Cash from salmas_table,SalRecv_table  where salmas_table.smas_billno=SalRecv_table.SalRecv_Salno and salmas_table.Smas_rtno=0 and salmas_table.ctr_no=(Select ctr_no from User_table where user_no=1) and smas_Cancel<>1 and smas_billdate =(Select convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)) and salmas_table.smas_rtno<>1 and salmas_table.smas_billno=SalRecv_table.salRecv_Salno group by SalRecv_table.SalRecv_Amt,SalRecv_table.SalRecv_Led
      open c2
      Fetch from c2 into @tNETs,@tCash
      Declare @tCountChk numeric(18,0)=0;
      while @@FETCH_STATUS=0
      begin
      set @tCountChk=@tCountChk+1
      if @tCash=''
      if @tCash<>null
      set @tCashAmt=@tCashAmt+@tCash;
      if @tCountChk>1
      if @tNETs='' 
      if @tNETs <> null
      set @tNetsAmt=@tNetsAmt+@tNETs;
      Fetch next from c2 into @tNETs,@tCash
      End
      close c2
      deallocate c2
      End
      
      set @tlblCCashSalesTotal=@tCashAmt-@tCashReturnValue;
      set @tlblCNETSSalesTotal=@tNetsAmt-@tNETSReturnValue;
      
      select @tlblCreditCardSalesTotal=(case when sum(SalRecv_Amt) IS null then 0.00 else  sum(SalRecv_Amt) End) from SalRecv_table,Ledger_table where SalRecv_Led= Ledger_no and Ledger_groupno=5 and Ledger_no<>14
      
      


End

GO

CREATE Procedure [dbo].[sp_LedgerTrigger]   
AS                  
BEGIN 
SET NOCOUNT ON                  
DECLARE @action varchar(100);                  
 SET NOCOUNT ON;                   
                 

Update Ledger_table set PLimit_amount=Ledger_open where Ledger_groupno=32 ;              
Update Ledger_table set PLimit_Amount=Ledger_open where Ledger_groupno=31 ;              
          
DECLARE @tSalRecv_Led varchar(50);                  
DECLARE @tAmount Numeric(18,2);                  
DECLARE c1 CURSOR LOCAL READ_ONLY FOR Select  Party_no,SUM(pmas_value) from PurMas_table where party_no is not null group by Party_no                
Update Ledger_table set CLimit_Amount=0 where Ledger_groupno=31                     
open c1                  
Fetch From c1 into @tSalRecv_Led,@tAmount                  
while @@FETCH_STATUS=0                  
Begin                  
Update Ledger_table set CLimit_Amount=@tAmount where Ledger_no=@tSalRecv_Led and ledger_groupno=31                  
Fetch NEXT From c1 into @tSalRecv_Led,@tAmount                  
END                  
Close c1                  
Deallocate c1           
      
--Payment Code        
   DECLARE @tSalRecv_Led2 varchar(50);            
DECLARE @tAmount2 Numeric(18,2);            
DECLARE c1 CURSOR LOCAL READ_ONLY FOR Select Ledger_no,Sum(Payment_Amt) as Amount from PaymentDetail_table group by Ledger_no                 
open c1            
Fetch From c1 into @tSalRecv_Led2, @tAmount2            
while @@FETCH_STATUS=0            
Begin            
update Ledger_table set PLimit_Amount=0 where Ledger_no=@tSalRecv_Led2           
Update Ledger_table set PLimit_Amount=@tAmount2+Ledger_open where Ledger_no=@tSalRecv_Led2           
Fetch NEXT From c1 into @tSalRecv_Led2,@tAmount2            
END            
Close c1            
Deallocate c1            
             
  --Sales Code        
     DECLARE @tSalRecv_Led1 varchar(50);            
DECLARE @tAmount1 Numeric(18,2);      
DECLARE @tReturnAmt Numeric(18,2);          
DECLARE c1 CURSOR LOCAL READ_ONLY FOR Select SalRecv_Led,SUM(SalRecv_Amt) as Amount from SalRecv_table where SalRecv_Led<>2 and SalRecv_Led<>5 and SalRecv_Led<>14 and SalRecv_Cancel=0 group by SalRecv_Led            
Update Ledger_table set CLimit_Amount=0 where Ledger_groupno=32            
open c1            
Fetch From c1 into @tSalRecv_Led1,@tAmount1            
while @@FETCH_STATUS=0            
Begin      
    
select @tReturnAmt=(CASE WHEN convert(numeric(18,2),SUM(smas_NetAmount)) IS NULL  THEN 0.00 ELSE convert(numeric(18,2),SUM(smas_NetAmount)) END) from salmas_table where Smas_Cancel<>1 and smas_rtno<>0 and party_no=@tSalRecv_Led1     
Update Ledger_table set CLimit_Amount=@tAmount1-@tReturnAmt where Ledger_no=@tSalRecv_Led1 and ledger_groupno=32            
Fetch NEXT From c1 into @tSalRecv_Led1,@tAmount1            
END            
Close c1            
Deallocate c1            
END

GO

CREATE PROCEDURE [dbo].[sp_Amountupdate]
(
@tStrNo INT OUTPUT,
@tCtr_name varchar(200),
@tTotalAmt numeric(18,2),
@tDate datetime
)
as
DECLARE @TranCounter INT;
DECLARE @vAdj_billno INT;
DECLARE @vAdj_billno2 INT; 
DECLARE @vCtr_no INT;
DECLARE @vTime DATETIME;
DECLARE @vTotalAmt numeric(18,2)=0;

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
  select @tStrNo=StrnNo from NumberTable
  set @tStrNo=@tStrNo+1;
  Update NumberTable set StrnNo=StrnNo+1
  select @vAdj_billno=max(Adj_Billno)+1 from adjmas_table
  if @vAdj_billno<>0
  begin
  set @vAdj_billno2=@vAdj_billno;
  end
  else
  begin
  set @vAdj_billno2=1;
  end
  select @vCtr_no=ctr_no from counter_table where ctr_name=@tCtr_name
  select @vTime= CONVERT(time,GETDATE(),108)
  set @vTotalAmt=@tTotalAmt;
  insert into adjmas_table(Adj_No,Adj_Billprefix,Adj_Billsuffix,Adj_Billno,Adj_bill,Ctr_No,Adj_Date,Adj_Time,Adj_Type,Godown_No,Togodown_No,Transfer_Type,Branch_Godown,UserNo,NetAmount,Adj_Remarks,Export,Cancel,CancelRemarks) 
					values(@tStrNo,'','',@vAdj_billno2,@vAdj_billno2,@vCtr_no,@tDate,@vTime,'0','2','0','0','','0',@vTotalAmt,'','0','0','')
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH
    
GO


CREATE PROCEDURE [dbo].[sp_ItemwiseSelect](@tActionType varchar(100), @tValue varchar(400),@tDateFrom date, @tDateTo date)
AS
BEGIN
Select  Item_table.Item_code,Item_table.Item_name, sum(stktrn_table.nt_qty)as nt_qty ,sum(stktrn_table.Amount) as Amount from stktrn_table,Item_table where Item_table.Item_no=stktrn_table.item_no and stktrn_table.strn_date between @tDateFrom and @tDateTo and  stktrn_table.StrnParty_no=@tValue group by Item_table.Item_no,Item_table.Item_code,Item_table.Item_name 
END

GO


CREATE Procedure [dbo].[Sp_itemTable](
@item_code varchar(20),@Item_name varchar(120),@Printer_name varchar(120),
@Item_selname nvarchar(125),
@Item_mtselname nvarchar(125),
@unit_name varchar(125),@nt_openqty Float,@stkopenqty varchar(50),@stopatRate varchar(50),@groupName varchar(100),@ModelName Varchar(100),@UnitName varchar(100),@BrandName varchar(100),@Item_Cost varchar(50),@Item_Price varchar(50),@ItemSpecial1 varchar(50),@ItemSpecial2 varchar(50),@ItemSpecial3 varchar(50),@Reorder Varchar(50),@MiniStock Varchar(20),@MaxStock Varchar(50),@PricePerRate varchar(50),@StopatQty varchar(50),@TaxType Varchar(50),@dt_gridload Sp_BarCodeTable READONLY,@jak varchar(50) OUTPUT,@IetmOpenQty as varchar(20),@ItemPossition as numeric(18,2),@Active as Varchar(20))
As
Begin
SET NOCOUNT ON 
                        --StrnSno number
                        declare @number_seroius_strn_Sno int=0
                        select @number_seroius_strn_Sno=(max(StrnSno+1)) from NumberTable
                        --strnNo() number;   not put all values check....
						Declare @strnNo1 int=0            
			            select @strnNo1=(max(StrnNo)+1) from NumberTable
			            declare @autonumber int=0
						select @autonumber=(max(itemNo)+1) from NumberTable
						--geting Itemname
						declare @Unitno varchar(10)
						select @Unitno=(unit_no) from unit_table where unit_name=@unitName
						declare @Groupno int=0
						select @Groupno=item_groupno from Item_Grouptable where item_groupname =@GroupName
						declare @ModelNo int=0
                        select @ModelNo=(Model_no) from Model_table where Model_name=@ModelName
                        declare @brandNo int=0
                        select @brandNo=(Brand_no) from Brand_table where Brand_name=@BrandName
                        declare @taxno int=0
                        select @taxno=(Tax_no) from Tax_table where Tax_name=@TaxType
                        
                        insert into Item_Seltable(Item_no,Item_selname,Item_mtselname,Item_Active)values(@autonumber,@Item_name+'                               '+@item_code,Upper(@Item_selname),@Active)
        insert into Item_Seltable(Item_no,Item_selname,Item_mtselname,Item_Active)values(@autonumber,@item_code+'    '+@Item_name ,upper(@Item_mtselname),@Active)
				if(@nt_openqty>0)
						Begin
                        update NumberTable set ItemNo=@autonumber,StrnSno=@number_seroius_strn_Sno,StrnNo=@strnNo1 
                        INSERT INTO [stktrn_table] ([strn_sno],[strn_no],[strn_rtno],[strn_type],[strn_date],[Godown_BillNo],[StrnParty_no],[Grn_no],[OrderSno],[Dc_no],[item_no],[ctr_no],[godown_no],[Unit_no],[Unit_Ratio],[QtyInPieces],[nt_qty],[tx_qty],[Short_qty],[rnt_qty],[rtx_qty],[Invnt_qty],[Invtx_qty],[QtyDetails],[Rate],[Tax_Rate],[CurrencyNo],[CurrencyValue],[Amount],[Tax_No],[Disc_PerQty],[Disc_Per],[Disc_Amt],[Adldisc_Per],[Adldisc_Amt],[Othdisc_Amt],[OthPurdisc],[Ed_PerQty],[Ed_Per],[Ed_Amt] ,[Cess_Per],[Cess_Amt],[SHECess_Per],[SHECess_Amt],[HL_Per],[HL_Amt],[CST_per],[CST_amt],[tax_Flag],[tax_per],[tax_amt],[Sur_per],[Sur_amt] ,[CommiPer],[Commi],[SmanPer],[SmanAmt],[spl_discamt],[tot_amt],[alp1],[alp2],[alp3],[alp4],[ala1],[ala2],[ala3],[ala4],[Net_Amt],[Other_Exp],[BillOther_Exp],[strn_remarks],[Strn_Cancel],[Order_Ack],[Cost],[Mrsp],[Margin],[Margin_No],[Srate],[Frtx_Qty],[RFrnt_Qty],[RFrtx_Qty],[Frnt_Qty],[FreeQty],[FreeItemNo],[Profit],[Item_Point],[Mech_no],[PurRate])VALUES (@number_seroius_strn_Sno,@strnNo1,'0','0',convert(date,GETDATE()),'0','0','0','0','0',@autonumber,'0','2',@Unitno,'1','0',@nt_openqty,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0')
                        insert into Item_table(Item_no,Item_code,Item_mtcode,Item_Active,Item_name,Item_mtname,Item_Printname,Item_mtPrintname,item_Groupno,Model_no,Brand_no,Unit_no,Item_cost,Item_mrsp,Item_special1,Item_special2,item_special3,Item_reorder,tx_opnqty,nt_opnqty,Item_Minstock,Item_Maxstock,nt_cloqty,Item_prefix,Item_sufix,Item_number,Commodity_Code,Item_aliasname,Item_mtaliasname,PurUnit,ConvRatio,Margin_no,Item_ndp,Item_special,CurrencyNo,CommissionPer,CommissionAmt,SManPer,SmanAmt,Item_Point,Item_AvgSale,Item_OpnAvgSale,Stock_Type,Item_Critical,BarcodeRatePrint,StopatQty,StopatRate,Item_warranty,Item_figure,Item_Remarks,Item_Remarks1,Item_MtRemarks1,Item_flag,Stock_Value,nt_purqty,nt_prtqty,tx_purqty,tx_prtqty,InvoiceQty,nt_salqty,nt_srtqty,tx_salqty,tx_srtqty,tx_cloqty,Row_no,Open_Rate,Nt_Salval,Tx_Salval,Nt_SalRetval,tx_SalRetval,Nt_PurVal,Tx_PurVal,Nt_PurRetVal,tx_PurRetVal,Pur_PendQty,Sal_PendQty,ItemPicture,Item_PrintIndex,ItemColor,Tax_no,Rack_no,OpenItem,Item_possition) values (@autonumber,@item_code,UPPER(@item_code),@Active,@Item_name,UPPER(@Item_name),@Printer_name,UPPER(@Printer_name),@Groupno,@ModelNo,@brandNo,@Unitno,@Item_Cost,@Item_Price,@ItemSpecial1,@ItemSpecial2,@ItemSpecial3,@Reorder,'0',@nt_openqty,@Ministock,@MaxStock,@nt_openqty,'','','0','0','','','0','0','1',@PricePerRate,'0','0','0','0','0','0','0','0','0','0','0','True',@stkopenqty,@stopatRate,'True','','','','','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','16777215',@taxno,'0',@IetmOpenQty,@ItemPossition)
                        
                        --Duplicate Remove
                          Declare @DuplicateValues1 Varchar(20)  
                          SELECT @DuplicateValues1=item_name FROM Item_table GROUP BY Item_name HAVING COUNT(*) > 1
                          delete from Item_table where Item_name=@DuplicateValues1 and Commodity_Code=''
                        End
                else if((@nt_openqty<=0) or (@nt_openqty=null))        
                        Begin
                          set @nt_openqty=0
                          update NumberTable set ItemNo=@autonumber
                          insert into Item_table(Item_no,Item_code,Item_mtcode,Item_Active,Item_name,Item_mtname,Item_Printname,Item_mtPrintname,item_Groupno,Model_no,Brand_no,Unit_no,Item_cost,Item_mrsp,Item_special1,Item_special2,item_special3,Item_reorder,tx_opnqty,nt_opnqty,Item_Minstock,Item_Maxstock,nt_cloqty,Item_prefix,Item_sufix,Item_number,Commodity_Code,Item_aliasname,Item_mtaliasname,PurUnit,ConvRatio,Margin_no,Item_ndp,Item_special,CurrencyNo,CommissionPer,CommissionAmt,SManPer,SmanAmt,Item_Point,Item_AvgSale,Item_OpnAvgSale,Stock_Type,Item_Critical,BarcodeRatePrint,StopatQty,StopatRate,Item_warranty,Item_figure,Item_Remarks,Item_Remarks1,Item_MtRemarks1,Item_flag,Stock_Value,nt_purqty,nt_prtqty,tx_purqty,tx_prtqty,InvoiceQty,nt_salqty,nt_srtqty,tx_salqty,tx_srtqty,tx_cloqty,Row_no,Open_Rate,Nt_Salval,Tx_Salval,Nt_SalRetval,tx_SalRetval,Nt_PurVal,Tx_PurVal,Nt_PurRetVal,tx_PurRetVal,Pur_PendQty,Sal_PendQty,ItemPicture,Item_PrintIndex,ItemColor,Tax_no,Rack_no,OpenItem,Item_possition) values (@autonumber,@item_code,UPPER(@item_code),@Active,@Item_name,UPPER(@Item_name),@Printer_name,UPPER(@Printer_name),@Groupno,@ModelNo,@brandNo,@Unitno,@Item_Cost,@Item_Price,@ItemSpecial1,@ItemSpecial2,@ItemSpecial3,@Reorder,'0',@nt_openqty,@Ministock,@MaxStock,@nt_openqty,'','','0','0','','','0','0','1',@PricePerRate,'0','0','0','0','0','0','0','0','0','0','0','True',@stkopenqty,@stopatRate,'True','','','','','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','0','16777215',@taxno,'0',@IetmOpenQty,@ItemPossition)
                          
						---Duplicate Remove
                          Declare @DuplicateValues Varchar(20)
                          SELECT @DuplicateValues=item_name FROM Item_table GROUP BY Item_name HAVING COUNT(*) > 1
                          delete from Item_table where Item_name=@DuplicateValues and Commodity_Code=''
                          
                        End
                    declare @ickh int=0;
					declare @Item_no1 Varchar(50),@Barcode1 varchar(50),@MTBarcode1 varchar(50),@barcodevalues1 varchar(50),@rate1 numeric(18,2),@qty1 numeric(18,2)
					select @ickh=(count(*)) from  @dt_gridload;
			 if @ickh>0
								begin
											declare @item_namechk as varchar(200)
											select @item_namechk =(Item_no) from Item_table where Item_name=@Item_name
											declare c Cursor Local Read_only for select Item_no,Barcode,MTBarcode,barcodevalues,rate,qty from @dt_gridload 
										open c
												fetch from c into @Item_no1,@Barcode1,@MTBarcode1,@barcodevalues1, @rate1,@qty1
														while @@FETCH_STATUS=0
														begin
																begin 
																	insert into barcode_Table(item_no,Barcode,MTBarcode,rate,qty,barcodevalues)values(@item_namechk,@Barcode1,@MTBarcode1,@barcodevalues1,@rate1,@qty1)
																	fetch next from c into @Item_no1,@Barcode1,@MTBarcode1,@barcodevalues1, @rate1,@qty1
																end
																Set @jak='1';
														end
										close c
										deallocate c			
								 end
                  
End

GO

CREATE PROCEDURE [dbo].[SP_ITEMNAMESEARCH]
(@tEnterValue VARCHAR(300))
AS
BEGIN
SET NOCOUNT ON 
Select item_name from Item_table where Item_Active=1 and  Item_name Like '%'+@tEnterValue+'%' or Item_Code Like '%'+@tEnterValue+'%';
END

GO

CREATE PROCEDURE [dbo].[sp_ItemNameProfit]
(@tFromDate date,@tToDate date)
AS
BEGIN
SET NOCOUNT ON 

select Item_table.Item_name as ItemNames,SUM(stktrn_table.nt_qty) as Qty,CONVERT(numeric(18,2),Avg((((stktrn_table.nt_qty )*stktrn_table.Rate)-stktrn_table.Profit)/(stktrn_table.nt_qty))) as ItemCost,CONVERT(numeric(18,2),AVG(stktrn_table.Rate)) as SalesPrice,convert(numeric(18,2),SUM(stktrn_table.Profit)) as Profit from stktrn_table,Item_table where Item_table.Item_no=stktrn_table.item_no and stktrn_table.Strn_Cancel=0 and stktrn_table.nt_qty<>stktrn_table.rnt_qty and stktrn_table.strn_rtno=0 and stktrn_table.strn_type=1 and stktrn_table.strn_date between @tFromDate and @tToDate  group by item_table.Item_name
END

GO
CREATE Procedure [dbo].[Sp_ItemCreation_Delete](
@tItemNo int
)
As
Begin  

	 Delete from Item_table where item_no= @tItemNo     
			                                     
End


GO

CREATE procedure [dbo].[Sp_Item_Seltable]
(
@Item_no int,@item_code varchar(20),@Item_name varchar(120),@Printer_name varchar(120),
@Item_selname nvarchar(125),
@Item_mtselname nvarchar(125),
@unit_name varchar(125),@nt_openqty float,@stkopenqty varchar(50),@stopatRate varchar(50),@groupName varchar(100),@ModelName Varchar(100),@UnitName varchar(100),@BrandName varchar(100),@Item_Cost varchar(50),@Item_Price varchar(50),@ItemSpecial1 varchar(50),@ItemSpecial2 varchar(50),@ItemSpecial3 varchar(50),@Reorder Varchar(50),@MiniStock Varchar(20),@MaxStock Varchar(50),@PricePerRate varchar(50),@StopatQty varchar(50),@TaxType Varchar(50),@dt_gridload Sp_BarCodeTable READONLY,@jak varchar(50) OUTPUT,@IetmOpenQty as varchar(20),@ItemPossition as numeric(18,2),@Active as Varchar(50))
As 
Begin
SET NOCOUNT ON 
        delete  from item_seltable where item_no=@Item_no

        insert into Item_Seltable(Item_no,Item_selname,Item_mtselname,Item_Active)values(@Item_no,@Item_name+'                               '+@item_code,Upper(@Item_selname),@Active)
        insert into Item_Seltable(Item_no,Item_selname,Item_mtselname,Item_Active)values(@Item_no,@item_code+'    '+@Item_name ,upper(@Item_mtselname),@Active)
         declare @chk int
       select @chk=(count(*)) from item_table where item_no=@Item_no
       if @chk>0
       
         begin
		 declare @group_no varchar(20),@model_no varchar(20),@brand_nos varchar(20),@Unit_no varchar(20),@Tax_no varchar(20);
					select @group_no=item_groupno from Item_Grouptable where item_groupname =@groupName
					
					select @model_no=Model_no from Model_table where Model_name=@ModelName
					
					select @brand_nos=Brand_no from Brand_table where Brand_name=@BrandName
					
					select @Unit_no=unit_no from unit_table where unit_name=@unit_name
					
					select @Tax_no=Tax_no from Tax_table where Tax_name=@TaxType
					
					Update item_table set Item_code=@item_code,Item_mtcode=UPPER(@item_code),Item_name=@Item_name ,Item_mtname=UPPER(@Item_name),Item_Printname=@Printer_name,Item_mtPrintname=UPPER(@Printer_name),item_Groupno=@group_no,Model_no=@model_no,Brand_no=@brand_nos,Unit_no=@Unit_no,Item_cost=@Item_Cost,Item_mrsp=@Item_Price,Item_special1=@ItemSpecial1,Item_special2=@ItemSpecial2,item_special3=@ItemSpecial3,Item_reorder=@Reorder,nt_opnqty=@nt_openqty,Item_Minstock=@MiniStock,Item_Maxstock=@MaxStock,nt_cloqty=nt_cloqty+(@nt_openqty-nt_opnqty),Item_ndp=@PricePerRate,StopatQty=@StopatQty,StopatRate=@stopatRate,Tax_no=@Tax_no,OpenItem=@IetmOpenQty,Item_possition=@ItemPossition,item_Active=@Active where item_no=@Item_no
					declare @nt_openqty1 float=0;
		select  @nt_openqty1=(nt_opnqty) from item_table where item_no=@Item_no	 
			if @nt_openqty>0
				 begin
					declare @countchck int=0
						select @countchck=(count(*)) from stktrn_table where item_no=@Item_no and StrnParty_no=0 and strn_type=0
						if @countchck>0
							begin 
								     Declare @tItemNo numeric(18,0),@StrnParty_no varchar(50),@strn_type varchar(50) ,@strn_sno  varchar(50),@strn_no varchar(50), @strn_sno1 varchar(50);
								     declare c1 Cursor Local Read_only for select StrnParty_no,strn_type,strn_sno ,strn_no,strn_sno from stktrn_table where item_no=@Item_no and StrnParty_no=0 and strn_type=0;
								     declare @counts int=(select count(*)from stktrn_table where item_no=@Item_no and StrnParty_no=0 and strn_type=0 )
								     if @counts>0
								      begin
											open c1
												fetch from c1 into @StrnParty_no,@strn_type,@strn_sno,@strn_no, @strn_sno1
													while @@FETCH_STATUS=0
														begin
															declare @deletes varchar(50),@itemno_numbertable varchar(50);
															begin
																delete from stktrn_table where strn_sno=@strn_sno1
																fetch next from c1 into @StrnParty_no,@strn_type,@strn_sno,@strn_no, @strn_sno
																declare @strnSnomaxno varchar(50),@Unitno varchar(50);
																
																update NumberTable set StrnSno=StrnSno+1 
																select @strnSnomaxno=(StrnSno) from NumberTable;
																select @Unitno=unit_no from unit_table where unit_name=@unit_name
																
																
																INSERT INTO [dbo].[stktrn_table] ([strn_sno],[strn_no],[strn_rtno],[strn_type],[strn_date],[Godown_BillNo],[StrnParty_no],[Grn_no],[OrderSno],[Dc_no],[item_no],[ctr_no],[godown_no],[Unit_no],[Unit_Ratio],[QtyInPieces],[nt_qty],[tx_qty],[Short_qty],[rnt_qty],[rtx_qty],[Invnt_qty],[Invtx_qty],[QtyDetails],[Rate],[Tax_Rate],[CurrencyNo],[CurrencyValue],[Amount],[Tax_No],[Disc_PerQty],[Disc_Per],[Disc_Amt],[Adldisc_Per],[Adldisc_Amt],[Othdisc_Amt],[OthPurdisc],[Ed_PerQty],[Ed_Per],[Ed_Amt] ,[Cess_Per],[Cess_Amt],[SHECess_Per],[SHECess_Amt],[HL_Per],[HL_Amt],[CST_per],[CST_amt],[tax_Flag],[tax_per],[tax_amt],[Sur_per],[Sur_amt] ,[CommiPer],[Commi],[SmanPer],[SmanAmt],[spl_discamt],[tot_amt],[alp1],[alp2],[alp3],[alp4],[ala1],[ala2],[ala3],[ala4],[Net_Amt],[Other_Exp],[BillOther_Exp],[strn_remarks],[Strn_Cancel],[Order_Ack],[Cost],[Mrsp],[Margin],[Margin_No],[Srate],[Frtx_Qty],[RFrnt_Qty],[RFrtx_Qty],[Frnt_Qty],[FreeQty],[FreeItemNo],[Profit],[Item_Point],[Mech_no],[PurRate])
																VALUES (@strnSnomaxno,@strn_no,'0','0',Convert(date,getdate()),'0','0','0','0','0',@Item_no,'0','2',@Unitno,'1','0',@nt_openqty,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0')
																Set @jak='2';
															end	
															Select @jak;
														 end
												close c1
									     end
								end  
						if @countchck=0
									  begin
									       if @nt_openqty>0     
												begin
													declare @strnSnomaxno2 varchar(50),@strnNomaxno2 varchar(20),@Unit_no2 varchar(20),@autonumber2 varchar(50);
													update NumberTable set StrnSno=StrnSno+1,StrnNo=StrnNo+1 
													select @strnSnomaxno2=(StrnSno) from NumberTable;
													select @strnNomaxno2=(StrnNo) from NumberTable;
												
													select @Unit_no2=unit_no from unit_table where unit_name=@unit_name
													
													
												   
												   INSERT INTO [dbo].[stktrn_table] ([strn_sno],[strn_no],[strn_rtno],[strn_type],[strn_date],[Godown_BillNo],[StrnParty_no],[Grn_no],[OrderSno],[Dc_no],[item_no],[ctr_no],[godown_no],[Unit_no],[Unit_Ratio],[QtyInPieces],[nt_qty],[tx_qty],[Short_qty],[rnt_qty],[rtx_qty],[Invnt_qty],[Invtx_qty],[QtyDetails],[Rate],[Tax_Rate],[CurrencyNo],[CurrencyValue],[Amount],[Tax_No],[Disc_PerQty],[Disc_Per],[Disc_Amt],[Adldisc_Per],[Adldisc_Amt],[Othdisc_Amt],[OthPurdisc],[Ed_PerQty],[Ed_Per],[Ed_Amt] ,[Cess_Per],[Cess_Amt],[SHECess_Per],[SHECess_Amt],[HL_Per],[HL_Amt],[CST_per],[CST_amt],[tax_Flag],[tax_per],[tax_amt],[Sur_per],[Sur_amt] ,[CommiPer],[Commi],[SmanPer],[SmanAmt],[spl_discamt],[tot_amt],[alp1],[alp2],[alp3],[alp4],[ala1],[ala2],[ala3],[ala4],[Net_Amt],[Other_Exp],[BillOther_Exp],[strn_remarks],[Strn_Cancel],[Order_Ack],[Cost],[Mrsp],[Margin],[Margin_No],[Srate],[Frtx_Qty],[RFrnt_Qty],[RFrtx_Qty],[Frnt_Qty],[FreeQty],[FreeItemNo],[Profit],[Item_Point],[Mech_no],[PurRate])VALUES (@strnSnomaxno2,@strnNomaxno2,'0','0',convert(Date,getdate()),'0','0','0','0','0',@Item_no,'0','2',@Unit_no2,'1','0',@nt_openqty,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0')
												   Set @jak='3';
												end
												Select @jak;
					                     end	
			    end	
		    else
		       begin
		         if @nt_openqty=0
		            begin 
		            declare @strn_no2 varchar(50);
		              select @strn_no2=strn_sno from stktrn_table where item_no=@Item_no and StrnParty_no=0 and strn_type=0;
		            
		              delete from stktrn_table where strn_sno=@strn_no2 and item_no=@Item_no 
		            end
			  end
  end	
  
    declare @ickh int=0;
					declare @Item_no1 Varchar(50),@Barcode1 varchar(50),@MTBarcode1 varchar(50),@barcodevalues1 varchar(50),@rate1 numeric(18,2),@qty1 numeric(18,2)
					delete from barcode_Table where Item_No=@Item_no
					select @ickh=(count(*)) from  @dt_gridload;
					if @ickh>0
								begin
											declare c23 Cursor Local Read_only for select Item_no,Barcode,MTBarcode,barcodevalues,rate,qty from @dt_gridload 
										open c23
												fetch from c23 into @Item_no1,@Barcode1,@MTBarcode1,@barcodevalues1, @rate1,@qty1
														while @@FETCH_STATUS=0
														begin
														
																begin 
																	insert into barcode_Table(item_no,Barcode,MTBarcode,rate,qty,barcodevalues)values(@Item_no1,@Barcode1,@MTBarcode1,@barcodevalues1,@rate1,@qty1)
																	fetch next from c23 into @Item_no1,@Barcode1,@MTBarcode1,@barcodevalues1, @rate1,@qty1
																end
														end
										close c23
										 deallocate c23			
								end
						delete  from additionalinfo where item_no=@Item_no	
end

GO

CREATE PROCEDURE [dbo].[sp_OpeningQty](@tActionType varchar(100),@tItemNo varchar(100),@tDateFrom date, @tDateTo date,@tFinalOpenQty numeric(18,2) out,@tItemCost numeric(18,2) out ,@tClosingStock numeric(18,2) out )
AS
SET NOCOUNT ON 
DECLARE @tIsChkOpening numeric(18,0)=0;
DECLARE @tTotQty numeric(18,2)=0;
DECLARE @tSelectedTotQty numeric(18,2)=0;
DECLARE @tOpeningQty numeric(18,2)=0;
BEGIN
select @tIsChkOpening=COUNT(*) from stktrn_table where strn_date between CONVERT(date,@tDateFrom) and CONVERT(date,@tDateTo) and item_no=@tItemNo and StrnParty_no=0 and strn_type=0
if @tActionType='All'
select @tSelectedTotQty=SUM(nt_qty) from stktrn_table where strn_type<>0 and strn_date between CONVERT(date,@tDateFrom) and CONVERT(date,@tDateTo) and item_no=@tItemNo
else if @tActionType='Sales'
select @tSelectedTotQty=SUM(nt_qty) from stktrn_table where strn_type<>0 and strn_date between CONVERT(date,@tDateFrom) and CONVERT(date,@tDateTo) and item_no=@tItemNo and strn_type=1
else if @tActionType='Purchase'
select @tSelectedTotQty=SUM(nt_qty) from stktrn_table where strn_type<>0 and  strn_date between CONVERT(date,@tDateFrom) and CONVERT(date,@tDateTo) and item_no=@tItemNo and strn_type<>0

select @tTotQty=SUM(nt_qty) from stktrn_table where item_no=@tItemNo and  strn_date between CONVERT(date,@tDateFrom) and CONVERT(date,@tDateTo) 
select @tItemCost=item_cost from Item_table where Item_no=@tItemNo
if @tIsChkOpening>0 
select @tFinalOpenQty=@tOpeningQty+(@tTotQty-@tSelectedTotQty);
ELSE
select @tFinalOpenQty=@tOpeningQty-((@tTotQty-(@tSelectedTotQty+@tOpeningQty)));
END

GO

CREATE PROCEDURE [dbo].[sp_Next27Records]
(@tGroupNo int,@tNextRecord int)
as
SET NOCOUNT ON 
begin
	select Top 35 * from Item_Table where item_groupNo=@tGroupNo and Item_name not in (Select Top (CONVERT(int,@tNextRecord)) Item_name from Item_Table where item_groupNo=@tGroupNo order by Item_possition ASC)  order by Item_possition ASC
	END

GO
CREATE PROCEDURE [dbo].[sp_Model_Update]
(
@Model_name as varchar(200),
@Model_mtname as varchar(200),
@Model_name2 as varchar(200)
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 UPDATE DBO.Model_table SET Model_name=@Model_name,Model_mtname= @Model_mtname WHERE Model_name=@Model_name2  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_Model_Insert]
(

@tModel_name as varchar(200),
@chk as bit OUT

)
as
DECLARE @TranCounter INT;
DECLARE @mno varchar(200);
DECLARE @grpos varchar(200);
DECLARE @MNameUpper varchar(200)
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
  select @mno=max(Model_no)+1 from Numbertable
  select @grpos=max(GroupPos)+1 from Model_table
  
  set @MNameUpper=UPPER(@tModel_name)
  
  BEGIN
  IF NOT EXISTS(Select * from Model_table where Model_name=@tModel_name)
  
  BEGIN
   INSERT INTO DBO.Model_table(Model_no,Model_name,Model_mtname,Model_level,Model_under,Model_gno,Model_flag,Row_no,Std_Group,GroupPos) 
  VALUES(@mno ,@tModel_name ,@MNameUpper ,'0','0','0','0','0','0',@grpos);
  set @chk=0
  
  END
  
  ELSE
 set @chk=1
  END
  
  update NumberTable set Model_no=Model_no+1  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_Model_Delete]
(
@Model_name as varchar(200)
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 delete from Model_table Where Model_name=@Model_name
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE procedure [dbo].[sp_RollBackEndOfDay]
as
SET NOCOUNT ON 
 DECLARE @TranCounter INT;
 DECLARE @Endofday Date;
 DECLARE @BeginId int;
 DECLARE @tCount Int=0;
 DECLARE @tMsg Varchar(400)='';
  
    SET @TranCounter = @@TRANCOUNT;
    IF @TranCounter > 0
     SAVE TRANSACTION ProcedureSave;
    ELSE
    BEGIN TRANSACTION;
 BEGIN TRY    
	 select @Endofday= CONVERT(DATE,endofDay,103) from EndofDay_table where ID=(Select EndofDayId from numberTable);	 
	 select @tCount=COUNT(*) from SalMas_table where Smas_billDate=(Select DateAdd(day,1,@Endofday))
	 if @tCount=0
	 BEGIN
	 DECLARE c1 CURSOR LOCAL READ_ONLY FOR Select id from BeginCashDrawer_table where Date=(select convert(date,DateAdd(Day,1,Endofday),103) from EndofDay_table where ID=(Select EndofDayId from numberTable))
	 open c1
fetch from c1 into @BeginId
while @@fetch_status=0
begin	 
	 Delete from ResetDrawer_table where beginCashDraw_Id=@BeginId 
	 fetch next from c1 into @BeginId
end
close c1
deallocate c1
DElete From counterSettle_table where EndofDay=(select convert(date,DateAdd(Day,1,Endofday),103) from EndofDay_table where ID=(Select EndofDayId from numberTable))
Delete from BeginCashDrawer_table where date=(select convert(date,DateAdd(Day,1,Endofday),103) from EndofDay_table where ID=(Select EndofDayId from numberTable))
Update BeginCashDrawerActive_table set Active=1;
DELETE FROM EndOfDay_table where ID=(Select EndofDayId from numberTable);
DECLARE @tBeginValue int=0;
DECLARE @tResetValue int=0;
DECLARE @tCounterSettleValue int=0;
Declare @tRowCount Int=0;
select @tRowCount=COUNT(*) from BeginCashDrawer_table
if @tRowCount<>0
Begin
Select @tBeginValue=MAX(id) from BegincashDrawer_table
if @tBeginValue=''
Set @tBeginValue=0;
END

select @tRowCount=COUNT(*) from ResetDrawer_table
if @tRowCount<>0
Begin
Select @tResetValue=MAX(id) from ResetDrawer_table
if @tResetValue=''
Set @tResetValue=0
END

select @tRowCount=COUNT(*) from counterSettle_table
if @tRowCount<>0
Begin
Select @tCounterSettleValue= MAX(id) from counterSettle_table
if @tCounterSettleValue=''
set @tCounterSettleValue=0;
END

select @tRowCount=COUNT(*) from EndOfDay_Table
if @tRowCount=0
Begin
truncate table BeginCashDrawerActive_table
END


UPdate numberTable set BeginCashDrawId=@tBeginValue,ResetDrawerId=@tResetValue, CounterSettleDrawerId=@tCounterSettleValue,EndOfDayId=EndOfDayId-1


END

IF @TranCounter = 0           
    COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
 IF @TranCounter = 0         
            ROLLBACK TRANSACTION;
        ELSE
        
            IF XACT_STATE() <> -1        
                ROLLBACK TRANSACTION ProcedureSave;        
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT @ErrorMessage = ERROR_MESSAGE();
        SELECT @ErrorSeverity = ERROR_SEVERITY();
        SELECT @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, -- Message text.
                   @ErrorSeverity, -- Severity.
                   @ErrorState -- State.
                   );
    END CATCH

GO
CREATE Procedure [dbo].[sp_PaymentDetailHACInsert](@tLedger_no Numeric(18,0),@tPaymentLedger_NoType varchar(400),@tPayment_Amt numeric(18,2),@tAccount_Limit numeric(18,2),@tBalance_Due numeric(18,2),@tAvaliable_Credit numeric(18,2), @tUserNo Numeric(18,0))
AS
Begin
SET NOCOUNT ON 
Declare @tPaymentDetail_Id Numeric(18,0)=(select max(PaymentDetail_Id)+1 from NumberTable);
Declare @tCtr_no Numeric(18,0)=(select Ctr_no from User_table where User_no=@tUserNo);
DECLARE @tEndOfDay Date=(Select CONVERT(Date,DATEADD(day,1,EndOfDay),108) as EndOfday from EndOfDay_Table where Id=(Select MAX(EndOfDayId) from NumberTable))
Declare @tLedger_groupNo Numeric(18,0)=(Select ledger_groupno from Ledger_GroupTable where Ledger_groupname='Sundry Debtors')
DEClare @tPaymentLedger_No Numeric(18,0);
DECLARE @tLedgerGroupNoNew NUMERIC(18,0)=(Select Ledger_groupno from Ledger_table where Ledger_no=@tLedger_no)
DECLARE @tVch_billNo NUMERIC(18,0);
DECLARE @tVch_Type NUMERIC(18,0);
DECLARE @tVoucherSno NUMERIC(18,0)=(Select VoucherSno+1 from NumberTable)
DECLARE @tVoucherno NUMERIC(18,0)=(Select Voucherno+1 from NumberTable)

if @tLedgerGroupNoNew=32
BEGIN
Select @tVch_billNo=Vch_Billno from VoucherNo_Table where Vch_Type=10
Update Ledger_table set CLimit_Bills=0 where Ledger_no=@tLedger_no
SET @tVch_Type=10
END
ELSE
bEGIN
Select @tVch_billNo=Vch_Billno from VoucherNo_Table where Vch_Type=11
SET @tVch_Type=11
END

if @tPaymentLedger_NoType='CASH'
set @tPaymentLedger_No=5;
ELSE if @tPaymentLedger_NoType='NETS'
set @tPaymentLedger_No=14;
Else
Select @tPaymentLedger_No=Ledger_no from Ledger_table Where Ledger_name=@tPaymentLedger_NoType
INSERT INTO PaymentDetail_table(PaymentDetail_Id,Ledger_no,Ledger_groupNo,PaymentLedger_No,Payment_Amt,Account_Limit,Balance_Due,Avaliable_Credit,Ctr_no,User_no, EndOfDay)
     VALUES(@tPaymentDetail_Id ,@tLedger_no,@tLedger_groupNo,@tPaymentLedger_No,@tPayment_Amt,@tAccount_Limit,@tBalance_Due,@tAvaliable_Credit,@tCtr_no,@tUserNo,@tEndOfDay)
if @tLedgerGroupNoNew=32
BEGIN    
INSERT INTO Vch_table([Sno],[Vch_Sno],[Vch_Pre],[Vch_NoLong],[Vch_Suf],[Vch_No],[Vch_MtNo],[Ctr_no],[UserNo],[RepNo],[Vch_Party],[ref_no],[ref_det],[Vch_Date],[Vch_type] ,[ledger_no],[ledger_no1] ,[Dr_amount] ,[Cr_amount],[Vch_Remarks],[Vch_IndRemarks],[Vch_Cancel] ,[Vch_CRemarks],[Vch_flag]) VALUES
           (@tVoucherSno,@tVoucherno ,'',@tVch_billNo,'',@tVch_billNo,@tVch_billNo,@tCtr_no ,@tUserNo,0,@tLedger_no,0,99,@tEndOfDay ,@tVch_Type,@tLedger_no,@tPaymentLedger_No,0,@tPayment_Amt,'','',0,'',0)
INSERT INTO Vch_table([Sno],[Vch_Sno],[Vch_Pre],[Vch_NoLong],[Vch_Suf],[Vch_No],[Vch_MtNo],[Ctr_no],[UserNo],[RepNo],[Vch_Party],[ref_no],[ref_det],[Vch_Date],[Vch_type] ,[ledger_no],[ledger_no1] ,[Dr_amount] ,[Cr_amount],[Vch_Remarks],[Vch_IndRemarks],[Vch_Cancel] ,[Vch_CRemarks],[Vch_flag]) VALUES
           (@tVoucherSno+1,@tVoucherno ,'',@tVch_billNo,'',@tVch_billNo,@tVch_billNo,@tCtr_no ,@tUserNo,0,@tLedger_no,0,99,@tEndOfDay ,@tVch_Type,@tPaymentLedger_No,@tLedger_no,@tPayment_Amt,0,'','',0,'',0)
END
ELSE
BEGIN      

INSERT INTO Vch_table([Sno],[Vch_Sno],[Vch_Pre],[Vch_NoLong],[Vch_Suf],[Vch_No],[Vch_MtNo],[Ctr_no],[UserNo],[RepNo],[Vch_Party],[ref_no],[ref_det],[Vch_Date],[Vch_type] ,[ledger_no],[ledger_no1] ,[Dr_amount] ,[Cr_amount],[Vch_Remarks],[Vch_IndRemarks],[Vch_Cancel] ,[Vch_CRemarks],[Vch_flag]) VALUES
           (@tVoucherSno,@tVoucherno ,'',@tVch_billNo,'',@tVch_billNo,@tVch_billNo,@tCtr_no ,@tUserNo,0,@tLedger_no,0,99,@tEndOfDay ,@tVch_Type,@tLedger_no,@tPaymentLedger_No,@tPayment_Amt,0,'','',0,'',0)
INSERT INTO Vch_table([Sno],[Vch_Sno],[Vch_Pre],[Vch_NoLong],[Vch_Suf],[Vch_No],[Vch_MtNo],[Ctr_no],[UserNo],[RepNo],[Vch_Party],[ref_no],[ref_det],[Vch_Date],[Vch_type] ,[ledger_no],[ledger_no1] ,[Dr_amount] ,[Cr_amount],[Vch_Remarks],[Vch_IndRemarks],[Vch_Cancel] ,[Vch_CRemarks],[Vch_flag]) VALUES
           (@tVoucherSno+1,@tVoucherno ,'',@tVch_billNo,'',@tVch_billNo,@tVch_billNo,@tCtr_no ,@tUserNo,0,@tLedger_no,0,99,@tEndOfDay ,@tVch_Type,@tPaymentLedger_No,@tLedger_no,0,@tPayment_Amt,'','',0,'',0)
END
   
Update NumberTable set VoucherNo=VoucherNo+1, VoucherSno=VoucherSno+2
Update VoucherNo_Table set Vch_Billno=Vch_Billno+1 where Vch_Type=@tVch_Type           
Update NumberTable Set PaymentDetail_Id=PaymentDetail_Id+1
END

GO
CREATE procedure [dbo].[sp_RemovedItemInsert1](         
          
           @tItem_NoValue varchar(400),
           @tnt_Qty numeric(18,4),
           @tRate numeric(18,2)
          )
as
DECLARE @tRemoveItem_Id numeric(18,0);
DECLARE @tItem_No numeric(18,2);
Declare  @tDate date;
DECLARE  @tTot_Amt numeric(18,2);
BEGIN
select @tRemoveItem_Id=max(RemovedItemId)+1 from NumberTable
select @tDate=CONVERT (date, endofDay,103) from EndOfDay_Table where Id=(select MAX(id) from  EndOfDay_Table);
Select @tItem_No=Item_no from Item_table where Item_name=@tItem_NoValue
set @tTot_Amt=@tnt_Qty*@tRate;
INSERT INTO RemoveItemDetail_table(RemoveItem_Id,Date,Item_No,nt_Qty,Rate,Tot_Amt,ModeType)
     VALUES
           (@tRemoveItem_Id
           ,@tDate
           ,@tItem_No
           ,@tnt_Qty
           ,@tRate
           ,@tTot_Amt,'Return')
           update NumberTable set RemovedItemId=RemovedItemId+1
END

GO
CREATE procedure [dbo].[sp_RemovedItemInsert](         
          
           @tItem_NoValue varchar(400),
           @tnt_Qty numeric(18,4),
           @tRate numeric(18,2)
          )
as
DECLARE @tRemoveItem_Id numeric(18,0);
DECLARE @tItem_No numeric(18,2);
Declare  @tDate date;
DECLARE  @tTot_Amt numeric(18,2);
BEGIN
select @tRemoveItem_Id=max(RemovedItemId)+1 from NumberTable
select @tDate=CONVERT (date, endofDay,103) from EndOfDay_Table where Id=(select MAX(id) from  EndOfDay_Table);
Select @tItem_No=Item_no from Item_table where Item_name=@tItem_NoValue
set @tTot_Amt=@tnt_Qty*@tRate;
INSERT INTO RemoveItemDetail_table(RemoveItem_Id,Date,Item_No,nt_Qty,Rate,Tot_Amt)
     VALUES
           (@tRemoveItem_Id
           ,@tDate
           ,@tItem_No
           ,@tnt_Qty
           ,@tRate
           ,@tTot_Amt)
           update NumberTable set RemovedItemId=RemovedItemId+1
END

GO
CREATE procedure [dbo].[sp_RemoveAll]
as
begin
SET NOCOUNT ON 
update NumberTable set  VoucherNo=0, StrnSno=0,StrnNo=0, VoucherSno=0,BOM_No=0, SalRecv_Sno=0, DiscountEntry_Id=0, RemovedItemId=0,CounterSettleDrawerId=0, BeginCashDrawId=0, ResetDrawerId=0, EndOfDayId=0
update VoucherNo_Table set Vch_Billno=1
update User_table set Active='False'

truncate table additionalinfo
truncate table Addons_Data
truncate table Addons_master
truncate table AddonSel_data
truncate table adjmas_table
truncate table Annexure1
truncate table Annexure1A
truncate table Annexure2
truncate table Annexure3
truncate table Annexure4Export
truncate table Annexure4Import
truncate table AreaMas_table
truncate table backup_Table
truncate table BarCode_table
truncate table BatchMaster
truncate table BatchTran
truncate table beginCashDrawer_table
truncate table BeginCashDrawerActive_table
truncate table BillNo_DailyTable
truncate table BillNo_MonthlyTable
truncate table BillNo_Table
truncate table BillPrint_Master
truncate table BillPrint_Tran
truncate table Bills_Master
truncate table BOMissu_Table
truncate table BOMMas_Table
truncate table Brand_table
truncate table CashDrawerSetting_table
truncate table CashReceipt_Table
truncate table ChequePrint_table
truncate table ChkType_gridValue
truncate table ClosingStk_table
truncate table colour_table
truncate table Commodity_Table 
truncate table Company_table
truncate table complaint_table
--truncate table Control_table
truncate table counter_table
truncate table Countergroup_Monthly_table
--truncate table countergroup_table
truncate table counterSettle_table
truncate table Courier_table
truncate table CreditCard_Table
truncate table CrystalReportPrinterList
truncate table CurrencyTable
truncate table Custom_text
truncate table Customer_Grouptable
truncate table Customer_Table
truncate table CustomerDisplay_table
truncate table Dcmas_table
truncate table Delivery_Table
truncate table Denomination_table
truncate table Discount_Settings 
truncate table DiscountDetail_table
truncate table DiscountSetting_Table
truncate table EndOfDay_table
truncate table Exchange_Table
truncate table Free_service
truncate table FreeItem_table
truncate table G_Set
truncate table GiftItem_table
truncate table Godown_table
truncate table Grbal_table
truncate table InvPrn_Master
-- truncate table InvPrn_Tran
truncate table Inward_table
truncate table Item_Grouptable
truncate table Item_seltable
truncate table Item_stocktable
truncate table Item_table
truncate table ItemSupplier_table
truncate table Jobcard_master
truncate table Jobcard_Trans
truncate table JobcardPaymentTable
truncate table Jrnl_table
truncate table jtbedone_table
truncate table LabCharges_table
truncate table Labour_Grouptable
truncate table ledger_table
truncate table Ledsel_table
truncate table margin_table
truncate table Model_Grouptable
truncate table Model_table
truncate table Modelcolour_Table
truncate table NumberTable
truncate table Observation_table
truncate table Ordercancel_table
truncate table ordtrn_table
truncate table Outward_table
truncate table Outwork_table
truncate table Ow_Grouptable
truncate table Ow_table
truncate table PreSentStock_table
truncate table PriceMaster 
truncate table PriceTran
truncate table Printer_Table
truncate table Pur_HideUnhide_Table
truncate table PurDiscount_Table
truncate table purmas_table
truncate table PurOrdAck_table
truncate table purOrder_table
truncate table PurQuotation_table
truncate table PurQuotationTrn_table
truncate table PurType_Table
truncate table QueryDes_Table 
truncate table QuotJobcard_master
truncate table QuotJobcard_Trans
truncate table Quotmas_table
truncate table Rack_table
truncate table ReceiptPrintSettings_table
truncate table Recv_table
truncate table Remarks_table
truncate table RemoveItemDetail_table
truncate table RepWiseOpening_Table
truncate table ResetDrawer_table
truncate table Rights_table
truncate table Rptset
truncate table SalesDiscount_Table
truncate table SalFav_Table
truncate table SalHold_table 
truncate table salMas_table
truncate table SalOrder_table
truncate table Salrecv_table
truncate table Sel_table
truncate table Sent_table
truncate table Serchargemas_Table
truncate table Serchargetrn_Table
truncate table service_details
truncate table service_register
truncate table Service_table
truncate table Settings_table
truncate table StkBal_table
truncate table StkGrBal_table 
truncate table Stktrn_table
truncate table Stockadjmas_table
truncate table Supplier_table
truncate table Tax_table
truncate table Temp_ItemStock
truncate table Temp_Itemtable
truncate table TodayOffer_table
truncate table Top10_table
truncate table Transport_table
truncate table Type_gridValue
truncate table unit_table
truncate table unitconv_table
truncate table User_table

truncate table vch_table
truncate table Vchsettings 
truncate table Vehicle_table
truncate table VehInvTran_Table
truncate table Vehmodel_table
truncate table VehTax_table
truncate table Voucher_Remarks
truncate table VoucherNo_DailyTable
truncate table VoucherNo_MonthlyTable
truncate table VoucherNo_Table
truncate table vtable
truncate table warrantymas_table
truncate table warrantytran_table
truncate table WeightScale_table
truncate table Wscontrol_table
truncate table Wtymas_Table
truncate table Wtytrn_table

truncate table tempsalMas_table
truncate table tempSalrecv_table
truncate table tempStktrn_table
truncate table tempvch_table
truncate table tempDiscountDetail_table
Truncate table PaymentDetail_table
truncate table dtSingleFreeHoldInsert
truncate table FreeItemDetail_table
truncate table FreeItemMaster_table
truncate table SalFreeItemDetail_table

INSERT INTO AreaMas_table ([AreaMas_no],[AreaMas_name],[AreaMas_mtname],[AreaMas_level],[AreaMas_under],[AreaMas_gno],[AreaMas_flag],[AreaMas_Pos],[Std_Group],[GroupPos]) VALUES (1,'Primary','PRIMARY',0,0,0,0,0,'True',0)


insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,1,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,2,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,3,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,4,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,9,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,10,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,11,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,13,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,14,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,16,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,17,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,18,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,19,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,20,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,21,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,29,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,30,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,31,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,32,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,37,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,39,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,46,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,47,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,49,1,1)
insert into BillNo_Table (ctr_grpno,ctr_TranType,ctr_cashbillno,ctr_creditbillno) values(1,50,1,1)

insert into Brand_table (Brand_no,Brand_name,Brand_mtname,Brand_level,Brand_under,Brand_gno,Brand_flag,Std_Group,GroupPos) values (1,'Primary','PRIMARY',0,0,0,0,'False',0)

INSERT INTO CashDrawerSetting_table ([Enable],[Interface],[Action],[PaperCut],[DrawOpen],[CutAndOpen],[Counter]) VALUES ('No','Printer Driven','Open','29,86,66,0','27,112,48,55,121','29,86,66,0,27,112,0,64,240',1)

insert into Commodity_Table (Commodity_No,Commodity_Name,Commodity_MtName) values (1,'Direct','DIRECT');

insert into Company_table (comp_no,comp_name,comp_printname,comp_add1,comp_add2,comp_add3,comp_add4,comp_Country,comp_Prest,comp_st,comp_cst,comp_Tin,comp_PrePh1,comp_PrePh2,comp_PrePh3,comp_PrePh4,comp_Ph1,comp_Ph2,comp_Ph3,comp_Ph4,comp_from,comp_bfrom,comp_to,comp_selname,comp_mtselname,comp_pass,Key_Pass,MasterKey_Pass,Data_Path) values (1,'Microspace Infotech','MICROSPACE INFOTECH','30 Kallang Pudding Rd#03-04','Valiant Industrial Building','Singapore - 349312','','Singapore','Tngst :','','','','Phone:','','Cell  :','','+65 62912345','','','',GETDATE(),GETDATE(),GETDATE(),'' ,'','','','','')

insert into complaint_table (Complaint_no,Complaint_name,Complaint_mtname,Complaint_level,Complaint_under,Complaint_gno,Complaint_flag,Row_no,Std_Group,GroupPos) values (1,'Primary Group','PRIMARYGROUP',0,0,0,0,0,0,0)



insert into counter_table (ctr_no,ctr_name,ctr_mtname,ctr_grpno,ctr_header,ctr_footer,ctr_cashhead,ctr_credhead,ctr_cashrethead,ctr_credrethead,ctr_Itemperpage,ctr_Nooflineskip,ctr_Linespace,ctr_updtac	,ctr_showstk,	ctr_salesroundto,	ctr_TxSaleledger	,ctr_NtSaleledger,	ctr_TxretSaleledger,	ctr_NtretSaleledger	,ctr_purcledger,	ctr_Retpurcledger,	Ctr_Cashledger,	Ctr_roundledger,	Ctr_labourac,	Ctr_labourTaxAc,	Ctr_LabourEcessAc,	Ctr_LabourSHEcessAc,	Ctr_outPaidac,	Ctr_outRecac,	Ctr_lessspares,	Ctr_lesslabour,	Ctr_lessoutwork,	Ctr_WtyAc,	Ctr_RejtAc,	Ctr_WtySalesAc,	Ctr_WtySendAc,	Ctr_outTaxAc,	Ctr_ratediff,	Group_no,	brand_no,	model_no	,rack_no,	Area_No,	Ctr_colsetting,	Ctr_stkitemonly,	Ctr_noofdecimal	,Jrnl_ColSetting,	Saleret_setting,	Ctr_RVoucher,	Ctr_PyVoucher,	Ctr_SVoucher,	Ctr_PVoucher,	Ctr_CoVoucher,	Ctr_JVoucher,	Ctr_CrVoucher,	Ctr_DrVoucher,	Ctr_OtVoucher,	ctr_Mainctr	,Ctr_TaxNo,	Ctr_Removebill) Values (1,'Counter','COUNTER',1,'','','Cash Bill','Invoice','','',	0,0,0,0,0,100,4,	4,	4,	4,	3,	3,	5,	6,	7,	1,	0,	0,	1,	1,	1,	1,	1,	1,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	'',	0,	0,	'','',	10,	11,	12,	13,	14,	15,	16,	17,	18,	0,	0,	0)								

Insert into CrystalReportPrinterList (PrinterName) values ('Microsoft XPS Document Writer')
Insert into CrystalReportPrinterList (PrinterName) values ('Send To OneNote 2007')
Insert into CrystalReportPrinterList (PrinterName) values ('Send To OneNote 2010')

insert into CurrencyTable( Currency_No,Currency_Name,Currency_MtName,Printing_Name) values (1,'Rupees','RUPEES','Rupees')

insert into Custom_text (Describ,prop) values ('Receipt Number','BILL NO :')
insert into Custom_text (Describ,prop) values ('Delivery Charge Text','DELIVERY')
insert into Custom_text (Describ,prop) values ('Amount Tendered','AMOUNT TENDERED')
insert into Custom_text (Describ,prop) values ('Bottom Line 1','')
insert into Custom_text (Describ,prop) values ('Bottom Line 2','OPEN 24 HOURS')
insert into Custom_text (Describ,prop) values ('Bottom Line 3','THANK YOU! COME AGAIN')
insert into Custom_text (Describ,prop) values ('Bottom Line 4','')
insert into Custom_text (Describ,prop) values ('Bottom Line 5','')
insert into Custom_text (Describ,prop) values ('Change Due','CHANGE DUE')
insert into Custom_text (Describ,prop) values ('Customer Copy','CUSTOMER COPY')
insert into Custom_text (Describ,prop) values ('Customer Information','CUSTOMER INFORMATION')
insert into Custom_text (Describ,prop) values ('Item Count','TOTAL ITEMS:')
insert into Custom_text (Describ,prop) values ('Order Number','YOUR ORDER NUMBER IS:')
insert into Custom_text (Describ,prop) values ('Pay This Amount','TOTAL AMOUNT :') 
insert into Custom_text (Describ,prop) values ('Subtotal','SUBTOTAL') 
insert into Custom_text (Describ,prop) values ('Top Line1','MICROSPACE INFOTECH')
insert into Custom_text (Describ,prop) values ('Top Line2','30 Kallang Pudding Rd#03-04') 
insert into Custom_text (Describ,prop) values ('Top Line3','Valiant Industrial Building')
insert into Custom_text (Describ,prop) values ('Top Line4','Singapore - 349312')
insert into Custom_text (Describ,prop) values ('Top Line5','')	
insert into Custom_text (Describ,prop) values ('Total Due','TOTAL DUE')

Insert into Customer_Grouptable (Customer_groupno,Customer_groupname,Customer_groupmtname,Customer_grouplevel,Customer_groupunder,Customer_groupgno,Customer_groupflag,Std_Group,GroupPos) values (1,'Primary','PRIMARY',0,	0,1,0,-1,0)

insert into Customer_Table (Customer_No,Customer_Code,Customer_Name,Customer_mtName,Customer_Add1,Customer_Add2,Customer_Add3,Customer_Add4,Customer_gNo,Point_Open,Point_Add,Point_Less) values (1,1,'Direct','DIRECT','',	'','','',1,0,0,0)



Insert into CustomerDisplay_table ([Enable],[PortName],[BaudRate],[HandShake],[Parity],[DataBits] ,[StopBits] ,[Counter],[HomeLine1] ,[HomeLine2] ,[DeviceName] ) values ('No', 'COM5','9600','None', 'None' , '8','None', '1', 'Save your money', 'With MSPOS','BIXOLON BCD-1100')
select * from CustomerDisplay_table

insert into G_set (Describ,Property) values ('Enable This Device*','No');
insert into G_set (Describ,Property) values ('Printer Name*','Receipt')
insert into G_set (Describ,Property) values ('Printer Type*','Windows Drivers')
insert into G_set (Describ,Property) values ('Print Copies*','1 Copy')
insert into G_set (Describ,Property) values ('Characters Per Line*','40')
insert into G_set (Describ,Property) values ('Font size*','29')
insert into G_set (Describ,Property) values ('Font Name*','Arial')

insert into Godown_table (Godown_no,Godown_name,Godown_mtname,Godown_level,Godown_under,Godown_gno,Godown_flag,Std_Group,GroupPos) values (1,'Primary','PRIMARY',0,0,0,0,'False',0)
insert into Godown_table (Godown_no,Godown_name,Godown_mtname,Godown_level,Godown_under,Godown_gno,Godown_flag,Std_Group,GroupPos) values (2,'Main','MAIN',1,1,0,0,'False',0)

insert into InvPrn_Master ( InvPrn_Sno,Report_Name,Report_MtName,BackGroundFile,Report_Height,Report_Width,Starting_Row,Item_Starting_row,Item_Lines,Item_Row,Item_Detail,ReportGroup,MtReportGroup,Voucher,Entry_No,Inv_Style,SkipingLines,ReverseLines,Noofcopies,UseAmtFormat,ItemGap) values (1,'Receipt','RECEIPT','',36,90,1,0,	0,	0,	0,	'MS POS','MSPOS','False',	8,'False',0,0,	0,	0,	0)
insert into InvPrn_Master ( InvPrn_Sno,Report_Name,Report_MtName,BackGroundFile,Report_Height,Report_Width,Starting_Row,Item_Starting_row,Item_Lines,Item_Row,Item_Detail,ReportGroup,MtReportGroup,Voucher,Entry_No,Inv_Style,SkipingLines,ReverseLines,Noofcopies,UseAmtFormat,ItemGap) values (2,'Payment','PAYMENT','',36,	90,	1,	0,	0,	0,	0,	'MS POS',	'MSPOS','False',9,'False',	0,0,0,0,0)

insert into Item_Grouptable (Item_groupno,Item_groupname,Item_groupmtname,Item_grouplevel,Item_groupunder,Item_Commodity,Item_groupgno,Item_groupflag,Std_Group,GroupPos,ImageVisibility) values ( 1,'Primary','PRIMARY',0,0,'',0,0,'False',0,'False')

insert into jtbedone_table ([jtbedone_no],[jtbedone_name],[jtbedone_mtname],[jtbedone_level],[jtbedone_under],[jtbedone_gno],[jtbedone_flag],[Std_Group],[GroupPos]) values ( 1,'Primary Group', 'PRIMARYGROUP', 0,0, 0, 0,'False',0)

INSERT INTO Labour_Grouptable ([Labour_groupno],[Labour_groupname],[Labour_groupmtname],[Labour_grouplevel],[Labour_groupunder],[Labour_groupgno],[Labour_groupflag],[Std_Group],[GroupPos]) values (1,'Primary','PRIMARY',0,0,1,0,'True',0)
INSERT INTO Labour_Grouptable ([Labour_groupno],[Labour_groupname],[Labour_groupmtname],[Labour_grouplevel],[Labour_groupunder],[Labour_groupgno],[Labour_groupflag],[Std_Group],[GroupPos]) values (2,'Labour Charges','LABOURCHARGES',1,1,2,0,'True',0)
INSERT INTO Labour_Grouptable ([Labour_groupno],[Labour_groupname],[Labour_groupmtname],[Labour_grouplevel],[Labour_groupunder],[Labour_groupgno],[Labour_groupflag],[Std_Group],[GroupPos]) values (3,'Service Charges','SERVICECHARGES',1,1,3,0,'True',0)

insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (1,203,	0,0,'Direct','DIRECT',30,0,'False','','01/01/9999',0,0,	0,0,0,0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,		0,	0,	0,	0,0)
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (2,202,	0,0,	'Cash Sales','CASHSALES',32,	0,'False','Cash Sales','01/01/9999',0,	0,	0,	0,	0	,0,	0,	0,	0,	0,	0,	2,	24,	24,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (3,	105,0,	0,	'Purchase A/c','PURCHASEAC',28,	0,'False','','01/01/9999',0	,0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (4,	106	,	0, 0,'Sales A/c','SALESAC'	,29,	0,'False','','01/01/9999',	0,	0,	0,	0,	0, 0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	,0,	0,	0,	0,	0,	0,	0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (5,	32	,	0,	0,'Cash A/c','CASHAC',	6,	0,'False','','01/01/9999',	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (6,	101	,	0,	0,'Rounded A/c','ROUNDEDAC',24,	0,'False','','01/01/9999',0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (7,	104	,	0,	0,	'Labour Charges A/c','LABOURCHARGESAC',	27,	0,'False','','01/01/9999',0,	0,	0,			0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,		0,	0,	0,	0,	0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (8,	201	,	0, 0,	'Cash Purchase','CASHPURCHASE',31,0,'False','','01/01/9999',0,	0,	0,			0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,		0,	0,	0,	0,	0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (9,	90	,	0,	0,	'Profit And Loss Account','PROFITANDLOSSACCOUNT',22,	0,'False','','01/01/9999',	0,	0,	0,			0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (10,106	,	0, 0,	'14.5% Sales A/c','145SALESAC',29,	0,	'False','','01/01/9999',	0,	0,	0,			63,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,		0,	0,	0,	0,		0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (11,106	,	0, 0,	'5% Sales A/c','5SALESAC',29,	0,'False','','01/01/9999',	0,	0,	0,			66,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,		0,	0,	0,	0,	0)
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (12,41	,	0, 0,	'14.5% Sales Collection','145SALESCOLLECTION',12,	0,'False','','01/01/9999',0,0,0,64,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,		0,	0,	0,	0,	0			)
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (13,41	,	0,	0,	'5% Sales Collection','5SALESCOLLECTION',12,0,'False','','01/01/9999',	0,	0,	0,			67,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,		0,	0,	0,	0,	0)			
insert into ledger_table (Ledger_no,Ledger_gno,Prty_No,Ledger_Code,	Ledger_name,Ledger_mtname,Ledger_groupno,Area_no,Ledger_baltype,Ledger_Add1,DOB,Mechanic_Commi,	Sman_Commi,	Mechanic_CommiTx,Ledger_VAT,Tax_Open,ledger_open,ledger_openOrg,ledger_openSus,	Ledger_clos,Ledger_closOrg,	Ledger_closSus,	ledger_Type,ledger_pcost,ledger_scost,ledger_paddless,ledger_saddless,Limit_Days,Limit_Bills,Limit_Amount,ref_no,Update_flag,Ledger_flag,Cash_Type,Ledger_Pos,Ledger_BillLimits) values (14,31	,	0,	0,	'NETS','NETS',5,1,'False','NETS','01/01/9999',0,0,0,0,0,0,0,0,0,0,0,0,	24,	24,	0	,0,	0,	0,	0,	0,		0,	0,	0,	0,0)


insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (10,'14.5% Sales A/c','145SALESAC',106,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (12,'14.5% Sales Collection','145SALESCOLLECTION',41,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (11,'5% Sales A/c','5SALESAC',106,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (13,'5% Sales Collection','5SALESCOLLECTION',41,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (5,'Cash A/c','CASHAC',32,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (8,'Cash Purchase','CASHPURCHASE',201,1)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (2,'Cash Sales','CASHSALES',202,2)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (1,'Direct','DIRECT',203,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (7,'Labour Charges A/c','LABOURCHARGESAC',104,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (14,'NETS','NETS',31,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (9,'Profit & Loss Account','PROFITLOSSACCOUNT',90,	1)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (3,'Purchase A/c','PURCHASEAC',105,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (6,'Rounded A/c','ROUNDEDAC',101,0)
insert into Ledsel_table (Ledger_no,Ledsel_name,Ledsel_mtname,Ledger_Gno,Ledger_Type) values (4,'Sales A/c','SALESAC',106,0)

insert into Margin_table (Margin_no,Margin_name,Margin_mtname,Margin_ratio,Margin_Cost,Margin_Mrsp,Margin_Special,Margin_Special2,Margin_Special3) values (1,'Nil','NIL',0,	9999,	9999,	9999,	9999,	9999)

insert into Model_Grouptable (Model_groupno,	Model_groupname,	Model_groupmtname,	Model_grouplevel,	Model_groupunder,	Model_groupgno,	Model_groupflag,	Std_Group,	GroupPos) values (1,'Primary','PRIMARY',0,0,1,0,'False',0)

insert into Model_table (Model_no,Model_name,	Model_mtname,	Model_level,	Model_under,	Model_gno,	Model_flag,	Row_no,	Std_Group,	GroupPos)values (1,'Primary','PRIMARY',	0,	0,	0,	0,	0,'False',0)

insert into Observation_table (Observation_no,Observation_name,Observation_mtname,Observation_level,Observation_under,Observation_gno,Observation_flag,Std_Group,GroupPos) values (1,'Primary Group','PRIMARYGROUP',0,0,0,0,0,0)

insert into Ow_Grouptable (Ow_groupno,Ow_groupname,Ow_groupmtname,Ow_grouplevel,Ow_groupunder,Ow_groupgno,Ow_groupflag,Std_Group,GroupPos)values (1,'Primary Group','PRIMARYGROUP',0,	0,	0,	0,	0,	0)


insert into PriceMaster (Prlist_No,	UserNo,	PrList_PurSal,Prlist_Name,Prlist_Mtname,Prlist_Type,Party_No,Prlist_Date,Basic_Rate,Change_Rate,Remarks) values (18,0,	0,	'Special - 2','SPECIAL2',0,	0,	'01/01/9999',0,	0,''	)
insert into PriceMaster (Prlist_No,	UserNo,	PrList_PurSal,Prlist_Name,Prlist_Mtname,Prlist_Type,Party_No,Prlist_Date,Basic_Rate,Change_Rate,Remarks) values (19,	0,	0,	'Special - 3','SPECIAL3',0,	0,	'01/01/9999',0,0,'')	
insert into PriceMaster (Prlist_No,	UserNo,	PrList_PurSal,Prlist_Name,Prlist_Mtname,Prlist_Type,Party_No,Prlist_Date,Basic_Rate,Change_Rate,Remarks) values (20,0,	0,	'Ndp','NDP',0,	0,'01/01/9999',0,0,'')	
insert into PriceMaster (Prlist_No,	UserNo,	PrList_PurSal,Prlist_Name,Prlist_Mtname,Prlist_Type,Party_No,Prlist_Date,Basic_Rate,Change_Rate,Remarks) values (21,	0,	0,	'Cost','COST',0,0,'01/01/9999',0,0,'')	
insert into PriceMaster (Prlist_No,	UserNo,	PrList_PurSal,Prlist_Name,Prlist_Mtname,Prlist_Type,Party_No,Prlist_Date,Basic_Rate,Change_Rate,Remarks) values (22,	0,	0,	'Mrsp','MRSP',0,	0,	'01/01/9999',0,0,'')	
insert into PriceMaster (Prlist_No,	UserNo,	PrList_PurSal,Prlist_Name,Prlist_Mtname,Prlist_Type,Party_No,Prlist_Date,Basic_Rate,Change_Rate,Remarks) values (23,	0,	0,	'Special - 1','SPECIAL1',0,0,'01/01/9999',0,0,'')	
insert into PriceMaster (Prlist_No,	UserNo,	PrList_PurSal,Prlist_Name,Prlist_Mtname,Prlist_Type,Party_No,Prlist_Date,Basic_Rate,Change_Rate,Remarks) values (24,	0,	0,	'Default','DEFAULT',0,0,'01/01/9999',0,0,'')	

insert into PurType_Table (PurType_No,PurType_Name,PurType_MTName,PurType_level,PurType_Under,PurType_Gno,PurType_flag,Std_Group,GroupPos) values (1,'Primary','PRIMARY',0,0,1,	0,'False',0)
insert into PurType_Table (PurType_No,PurType_Name,PurType_MTName,PurType_level,PurType_Under,PurType_Gno,PurType_flag,Std_Group,GroupPos) values (2,'Local Purchase','LOCALPURCHASE',1,	1,	2,	0,	'False',0)
insert into PurType_Table (PurType_No,PurType_Name,PurType_MTName,PurType_level,PurType_Under,PurType_Gno,PurType_flag,Std_Group,GroupPos) values (3,'Inter State Purchase','INTERSTATEPURCHASE',1,1,3,0,'False',0)

Insert into Rack_table (Rack_no,Rack_name,Rack_mtname,Rack_level,Rack_under,Rack_gno,Rack_flag,Std_Group,GroupPos) values (1,'Primary','PRIMARY',0,0,0,0,'False',0)

INSERT INTO ReceiptPrintSettings_table ([Enable_This_Device] ,[Printer_Name] ,[Printer_Type] ,[Print_Copies] ,[Characters_Per_Line] ,[Counter]) VALUES        ('No','Receipt','Windows Drivers','1 Copy',40,1)

insert into Rptset (Rdesc,Rprop) values ('Round','10cent')
insert into Rptset (Rdesc,Rprop) values ('Print Time','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Date','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Qunatity and Rate','Yes')
insert into Rptset (Rdesc,Rprop) values ('Cut Paper','Yes')
insert into Rptset (Rdesc,Rprop) values ('Auto Print','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Bottom Line 1','No')
insert into Rptset (Rdesc,Rprop) values ('Print Bottom Line 2','No')
insert into Rptset (Rdesc,Rprop) values ('Print Bottom Line 3','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Bottom Line 4','No')
insert into Rptset (Rdesc,Rprop) values ('Print Bottom Line 5','No')
insert into Rptset (Rdesc,Rprop) values ('Print Bottom Time','No')
insert into Rptset (Rdesc,Rprop) values ('Print Header','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Subtotal','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Top Line 1','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Top Line 2','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Top Line 3','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Top Line 4','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Top Line 5','No')
insert into Rptset (Rdesc,Rprop) values ('Print Line Below Logo','Single Line')
insert into Rptset (Rdesc,Rprop) values ('Print Line Below Top Text','Single Line')
insert into Rptset (Rdesc,Rprop) values ('Print Line Below Header','Single Line')
insert into Rptset (Rdesc,Rprop) values ('Print line Above Total','Single Line') 
insert into Rptset (Rdesc,Rprop) values ('Print Line Below Total','Single Line')
insert into Rptset (Rdesc,Rprop) values ('Print Line Above Bottom Text','Single Line')
insert into Rptset (Rdesc,Rprop) values ('Print Line Below Bottom Text','Single Line')
insert into Rptset (Rdesc,Rprop) values ('Print Tax','No')
insert into Rptset (Rdesc,Rprop) values ('Display Tax Type','NoTax')
insert into Rptset (Rdesc,Rprop) values ('Print Counter Name','No')
insert into Rptset (Rdesc,Rprop) values ('Print User Name','No')
insert into Rptset (Rdesc,Rprop) values ('Print Bill Type','No')
insert into Rptset (Rdesc,Rprop) values ('Print Logo','No')
insert into Rptset (Rdesc,Rprop) values ('Receipt Header Left Align','Yes')
insert into Rptset (Rdesc,Rprop) values ('Print Payment Mode','No')
insert into Rptset (Rdesc,Rprop) values ('Print Pay This Amount Right Align','No')
insert into Rptset (Rdesc,Rprop) values ('Print Printer Item Name','No')
insert into Rptset (Rdesc,Rprop) values ('Print Receipt Qty Center Position','No')

insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (1,'Purchase','PURCHASE',1,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (2,'Sales','SALES',	1,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (3,'Both','BOTH',	1,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (61,'Receipt','RECEIPT',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (62,'Payment','PAYMENT',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (63,'Sales','SALES',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (64,'Purchase','PURCHASE',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (65,'Contra','CONTRA',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (66,'Journal','JOURNAL',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (67,'Cr Note','CRNOTE',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (68,'Dr Note','DRNOTE',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (69,'Others','OTHERS',	4,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (80,'Normal','NORMAL',	8,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (81,'Serial','SERIAL',	8,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (140,'Free','FREE',	13,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (141,'Paid','PAID',13,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (142,'Coupon Paid','COUPONPAID',13,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (143,'Bonus','BONUS',13,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (144,'OutWork','OUTWORK',13,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (145,'Accident','ACCIDENT',13,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (146,'Engine Job','ENGINEJOB',13,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (163,'Normal','NORMAL',	15,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (164,'Standing','STANDING',15,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (165,'VOR','VOR',	15,'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (183,'Manual','MANUAL',	18,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (184,'Automatic','AUTOMATIC',	18,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (185,'None','NONE',	18,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (186,'Daily','DAILY',	19,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (187,'Monthly','MONTHLY',	19,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (188,'Never','NEVER',	19,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (189,'No','NO',	20,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (190,'Yes','YES',20,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (191,'After Confirm','AFTERCONFIRM',20,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (167,'Ledger','LEDGER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (168,'Sales','SALES',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (169,'Purchase','PURCHASE',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (170,'Sales Order','SALESORDER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (171,'Purchase Order','PURCHASEORDER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (172,'Sales Return','SALESRETURN',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (173,'Purchase Return','PURCHASERETURN',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (174,'Vehicle','VEHICLE',16,'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (201,'Service Charges','SERVICECHARGES',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (180,'Jobcard','JOBCARD',16,'True')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (181,'Dc','DC',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (182,'Quotation','QUOTATION',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (183,'WarrentySent','WARRENTYSENT',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (200,'Quotation Jobcard','QUOTATIONJOBCARD',16,'True')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (202,'GRN','GRN',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (203,'Sales Vehicle','SALESVEHICLE',16,'True')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (204,'Delivery Vehicle','DELIVERYVEHICLE',16,'True')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (205,'Sales Voucher','SALESVOUCHER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (206,'Purchase Voucher','PURCHASEVOUCHER',16,'True')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (207,'Receipt Voucher','RECEIPTVOUCHER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (208,'Payment Voucher','PAYMENTVOUCHER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (209,'Cr Note Voucher','CRNOTEVOUCHER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (210,'Dr Note Voucher','DRNOTEVOUCHER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (211,'Journal Voucher','JOURNALVOUCHER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (212,'Others Voucher','OTHERSVOUCHER',16,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (213,'Contra Voucher','CONTRAVOUCHER',16,'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (175,'Text','TEXT',17,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (176,'Numeric','NUMERIC',17,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (177,'Date','DATE',17,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (178,'Logical','LOGICAL',17,	'False')
insert  into Sel_table (sel_no,Sel_name,Sel_mtname,sel_type,sel_Wshop) values (179,'Selection','SELECTION',17,	'False')

insert into Settings_Table (Itemcode_cap,	Itemcode_Dis,	Itemname_cap,	Itemname_Dis,	Printname_Dis,	AliasName_cap,	Aliasname_Dis,	Unit_cap,	Unit_Dis,	PurUnit_cap,	PurUnit_Dis	,Itemgroup_cap,	ItemGroup_Dis,	Model_cap,	Model_Dis	,Rack_cap,	Rack_Dis,	brand_cap,	Brand_Dis,	Stock_Type,	StockType_Cap,	UseExpiryDate,	TaxOpn_Qty,	NtOpn_Qty,	RatePrint,	StopatQty,	StopatRate,	Stockval_Dis,	Taxtype_cap,	TaxType_Dis,	Warranty,	Remarks,	Margin_Cap,	Margin_Dis,	Ndp_cap,	Ndp_Dis,	Cost_cap,	Cost_Dis,	Mrsp_cap,	Mrsp_Dis,	Special1_cap,	Special1_Dis,	Special2_cap,	Special2_Dis,	Special3_cap,	Special3_Dis,	Currency_Dis,	Min_cap	,Min_Dis,	Max_cap,	Max_Dis	,Critical_cap,	Critical_Dis,	Reorder_cap,	Reorder_Dis	,Avgsale_cap,	Avgsale_Dis,	Commission_Dis,LoginSecurity) values ('Code','True','Name','True','True','Alias Name','True','Unit','True','P.Unit','False','Group','True','Model','True','Rack','True','Brand','True','False','','False','False','True','False','False','False','True','','True','True','True','Margin','True','P.Rate','True','Cost','True','Mrp','True','Special - 1','True','Special - 2','False','Special - 3','False','False','Min Stock','True','Max Stock','True','Critical','True','MinOrdQty','True','Avg Sale','True','False','False')


insert into Tax_table(Tax_no,Tax_name,Tax_mtname,PEd_percent,PCess_percent,PSHECess_percent,Ed_percent,Cess_percent,SHECess_percent,tax_percent,CST_percent,Ptax_percent,PCST_percent,Sur_percent,PSur_percent,Nt_percent,Ledger_no,RetLedger_no,CSTSales_Ledger,CSTRet_Ledger,CSTTax_Ledger,CSTRetTax_Ledger,CSTPurc_Ledger,CSTPurcRet_Ledger,CSTPurcTax_Ledger,CSTPurcRetTax_Ledger,STPurc_Ledger,STPurcRet_Ledger,STPurcTax_Ledger,STPurcRetTax_Ledger,NtRetLedger_no,NtLedger_no,SurRetLedger_no,SurLedger_no,Sales_no,NtSales_no,SalesRet_no,NtSalesRet_no,EDLedger_no,EDRetLedger_no,ECessLedger_no,ECessRetLedger_no,SHECessLedger_no,SHECessRetLedger_no) values (1,	'Nil','NIL',	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0)
insert into Tax_table(Tax_no,Tax_name,Tax_mtname,PEd_percent,PCess_percent,PSHECess_percent,Ed_percent,Cess_percent,SHECess_percent,tax_percent,CST_percent,Ptax_percent,PCST_percent,Sur_percent,PSur_percent,Nt_percent,Ledger_no,RetLedger_no,CSTSales_Ledger,CSTRet_Ledger,CSTTax_Ledger,CSTRetTax_Ledger,CSTPurc_Ledger,CSTPurcRet_Ledger,CSTPurcTax_Ledger,CSTPurcRetTax_Ledger,STPurc_Ledger,STPurcRet_Ledger,STPurcTax_Ledger,STPurcRetTax_Ledger,NtRetLedger_no,NtLedger_no,SurRetLedger_no,SurLedger_no,Sales_no,NtSales_no,SalesRet_no,NtSalesRet_no,EDLedger_no,EDRetLedger_no,ECessLedger_no,ECessRetLedger_no,SHECessLedger_no,SHECessRetLedger_no) values (2,	'14.5%','145',	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	14.5,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	12,	12,	0,	0,	0,	10,	0,	10,	0,	0,	0,	0,	0,	0)
insert into Tax_table(Tax_no,Tax_name,Tax_mtname,PEd_percent,PCess_percent,PSHECess_percent,Ed_percent,Cess_percent,SHECess_percent,tax_percent,CST_percent,Ptax_percent,PCST_percent,Sur_percent,PSur_percent,Nt_percent,Ledger_no,RetLedger_no,CSTSales_Ledger,CSTRet_Ledger,CSTTax_Ledger,CSTRetTax_Ledger,CSTPurc_Ledger,CSTPurcRet_Ledger,CSTPurcTax_Ledger,CSTPurcRetTax_Ledger,STPurc_Ledger,STPurcRet_Ledger,STPurcTax_Ledger,STPurcRetTax_Ledger,NtRetLedger_no,NtLedger_no,SurRetLedger_no,SurLedger_no,Sales_no,NtSales_no,SalesRet_no,NtSalesRet_no,EDLedger_no,EDRetLedger_no,ECessLedger_no,ECessRetLedger_no,SHECessLedger_no,SHECessRetLedger_no) values (3,	'5%','5',	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	5,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0 , 0,	0,	13,	13,	0,	0,	0,	11,	0,	11,	0,	0,	0,	0,	0,	0)

INSERT INTO unit_table  ([unit_no] ,[unit_name] ,[unit_printname],[unit_mtname] ,[unit_alias] ,[unit_flag] ,[unit_Decimals] ,[WeightScale]) VALUES(1,'Nos','','NOS','False','False',0,'False')

INSERT INTO User_table ([User_no],[User_name] ,[User_type] ,[User_mtname] ,[User_Pass] ,[Alter_Days],[Print_Bills],[Ctr_no],[Active] ,[DiscountRange]) VALUES (1,'Admin',0,'ADMIN',123,0,'False',1,'True',10.00)

insert into Vchsettings (Vchnumbering,CrDr,Quick,NilEntry) values (0,0,0,0)


insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (10,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (11,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (12,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (13,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (14,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (15,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (16,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (17,	1)
insert into VoucherNo_Table (Vch_Type,Vch_Billno) values (18,	1)


insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (1,'Receipt','RECEIPT','Receipt',	0,	0,	0,	0,	0,'','',	0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (2	,'Payment','PAYMENT','Payment',	0,	0,	0,	0,	0,'','',			0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (3	,'Sales','SALES','Sales',	0,	0,	0,	0,	0,	'','',		0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (4	,'Purchase','PURCHASE','Purchase',	0,	0,	0,	0,	0,'','',			0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (5	,'Contra','CONTRA','Contra',	0,	0,	0,	0,	0,''	,'',		0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (6	,'Journal','JOURNAL','Journal',	0,	0,	0,	0,	0,''	,'',		0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (7	,'Cr Note','CRNOTE','Cr Note',	0,	0,	0,	0,	0,''	,'',		0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (8	,'Dr Note','DRNOTE','Dr Note',	0,	0,	0,	0,	0,''	,'',		0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (9	,'Others','OTHERS','Others',	0,	0,	0,	0,	0,''	,'',		0,	0,	0,	0,	0,	0)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (10	,'Receipt','RECEIPT','Receipt',	1,	184,	0,	0,	1,'','',			188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (11	,'Payment','PAYMENT','Payment',	2,	184,	0,	0,	1,'','',			188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (12	,'Sales','SALES','Sales',	3,	184,	0,	0,	1,''	,'',		188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (13	,'Purchase','PURCHASE','Purchase',	4,	184,	0,	0,'','',	1,			188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (14	,'Contra','CONTRA','Contra',	5,	184,	0,	0,	1,'','',			188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (15	,'Journal','JOURNAL','Journal',	6,	184,	0,	0,	1,'','',			188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (16	,'Cr Note','CRNOTE','Cr Note',	7,	184,	0,	0,	1,'','',			188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (17	,'Dr Note','DRNOTE','Dr Note',	8,	184,	0,	0,	1,'','',			188,	0,	0,	0,	0,	189)
insert into Vtable (Vt_Sno,Vt_name,Vt_mtname,Vt_shortname,Vt_groupno,Vt_Numbering,Vt_Duplicate,Vt_TypeChange,Vt_StartNo,Vt_Prefix,Vt_Suffix,Vt_Restart,Vt_Width,Vt_Zero,Vt_Narration,Vt_SingleEntry,Vt_Print) values (18	,'Others','OTHERS','Others',	9,	184,	0,	0,	1,'','',			188,	0,	0,	0,	0,	189)


INSERT INTO WeightScale_table ([Enable] ,[PortName] ,[BaudRate],[HandShake] ,[Parity] ,[DataBits] ,[StopBits] ,[Counter]) VALUES ('No','COM5',9600,'None','None',8,'',1)

Insert into Wscontrol_table (Ctl_no,Ctl_version,Ctl_sendno,Ctl_Recvno,Ctl_mechinlabwork,Ctl_labourTaxAc,ctl_SepDeli,Ctl_labourTaxper,Ctl_LabEcess,Ctl_LabSHECess,Ctl_OutTaxper,Ctl_OutEcess,Ctl_Remainder,FreeServiceAsPaid,Ctl_InOut,Ctl_UpdateAc,Ctl_UpdateAt,Ctl_Labworkheading,Ctl_Outworkheading,CarryJobcard,RemainSecondWty,AllowMultyVehicle,DefDeliveryMode,RemainderSMS,VehicleReadySMS,InsuranceSMS,DealerCode,DealerAdd1,DealerAdd2,DealerAdd3,DealerAdd4,jobmethod)
Values (1,	0,	1,	1,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	'','','',0,	0,	0,'','','','','','','','','',0)

insert into NumberTable (ItemNo,	LedgerNo,	VoucherNo,	StrnSno,	StrnNo,	Currencyno,	Exchangeno,	ChSNo,	VehInvSno,	BillPrnSno,	VehSno,	FreeSno	,ClrSchemeId,	JobcardID,	DeliveryID,	UnitID,	UnitConvID,	TaxID,	PRList_No,	SerChargeMasID,	SerChargeTRNID,	RemarksID	,Courier_no	,TRansport_no,	Item_groupno,	Godown_No,	Model_no,	Brand_no,	Rack_no	,Supplier_No,	Customer_No	,Customer_groupNo,	AreaMas_no,	Ledger_groupno,
	PurType_No,	jtbedone_no,	Complaint_no,	Observation_no,	Labour_groupno,	Ow_groupno,	Model_groupno,	AddonID,	AddondataID,	AddonSelID,	User_No,	BOM_No,	PQuotSNo,	Margin_no,	ctr_no,	ctr_grpSno,	QuotJobcard_sno,	QuotJobTRN_sno,	JobPymtNo,	Service_No,	Servicedet_ID,	Labcharges_Sno,	Outwork_Sno,	SOrder_No,	POrder_No,	Wmas_no,	Sent_Sno,	Recv_sno,	Vt_Sno,	VoucherSno,	VehicleModelNo,	Wtrn_sno,	PAck_Sno,	OrdCancel_Sno,	Colour_no,	Labour_no,	Ow_No,	VTax_No,	Otrn_sno,	Outward_Sno,	Inward_Sno,	Commodity_No,	printer_No,	InvPrn_Sno,	Free_no,	faileditem_SNO,	claimSNo,	Result_SNo,	Result_groupno,	Gift_sno,	SalFav_no,	PriorityNo,	VehBookSNo,	BookingNumber,	VehPurcMas,	VehPurcNumber,	VehPurcReturn,	VehPurcRetNumber,	VehAllotSno	,VehAllotNumber,	VehDlySno,	DeliveryNumber,	VehRcptsno,	VehicleInvoiceNo,	VehicleInvTaxNo,	MultiDly_SNo,	MultiDlyTrn_SNo,	MultiDlyDisSno,	HPSNo,	HPNumber,	ExVehModel_No,	ExVehColour_No,	ExVehSNo,	ExVehNumber,	HpRcptSNo,	HpPymtSNo,	HpPymtNumber,	RcvdDocSNo,	RcvdDocNumber,	SaleVehSNo,	SaleVehNumber,	ExVehRcptSNo,	ExVehRcptNumber,	RegSno,	Regnumber,	RegnNoSNo,	RegnNoNumber,	RcbookSNo,	RcbookNumber,	QuotSno,	Quotnumber,	MechPymt_SNo,	MechPymt_Number,	DealerBill_SNo,	ProfMas_no,	RegnAreaNo,	ASCTransferSNo,	ASCTransferNumber	,RcBkSno,	RcBkIssSno,	RcBkIssnumber,	VehInvRetSno,	VehicleInvRetNo,	RegnSNo,	RegnNumber,	Representative,	InsSNo,	IssDocSNo,	IssDocNumber,	InsPymtSNo,	InsPymtNumber,	RefundSNo,	RefundNumber,	scheme_no,	Card_no,	salesTrn_no,	sales_no,	SalRecv_Sno,	QueryDes_No,[BeginCashDrawId] ,[EndOfDayId] ,[ResetDrawerId] ,[DiscountEntry_Id] ,[CounterSettleDrawerId] ,[RemovedItemId]) values (
1,14,0,0,0,1,1,0,0,0,1,1,0,1,1,1,1,3,24,1,1,1,0,0,1,2,1,1,1,0,	1,	0,1,	50,	3,	1,	1,1,3,1,1,1,1,1,1,1,0,1,1,25,1,1,0,1,1,1,1,1,1,	1,1,	1,	18,	0,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	1,	0,	2,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0,	0	,0,	0,0,0,0,0,0,0)

truncate table useractivity_table

END

GO

CREATE PROCEDURE [dbo].[sp_Rack_Update]
(
@tRack_name as varchar(200),
@tRack_mtname as varchar(200),
@tRack_Name2 as varchar(200)
)
as
DECLARE @TranCounter INT;

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
 
 UPDATE Rack_table set Rack_name=@tRack_name,Rack_mtname= @tRack_mtname WHERE Rack_name=@tRack_Name2  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_Rack_Insert]
(

@tRackName as varchar(200),
@chk as bit OUT

)
as
DECLARE @TranCounter INT;
DECLARE @rno varchar(200);
DECLARE @grpos varchar(200);
DECLARE @RNameUpper varchar(200)
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
  Select @rno=max(Rack_no)+1 from Numbertable
  select @grpos=max(GroupPos)+1 from Rack_table
  
  set @RNameUpper=UPPER(@tRackName)
  
  BEGIN
  IF NOT EXISTS(Select * from Rack_table where Rack_name=@tRackName)
  
  BEGIN
   INSERT INTO DBO.Rack_table (Rack_no,Rack_name,Rack_mtname,Rack_level,Rack_under,Rack_gno,Rack_flag,Std_Group,GroupPos) 
  VALUES(@rno ,@tRackName ,@RNameUpper ,'0','0','0','0','0',@grpos);
  set @chk=0
  
  END
  
  ELSE
 set @chk=1
  END
  
  
  update NumberTable set Rack_no=Rack_no+1  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_Qtyupdate]
(
@temp_Table type_StockAdjCreate READONLY
)
as
DECLARE @TranCounter INT;
DECLARE @vOldpurqty numeric(18,2)=0;
DECLARE @ItemCode varchar(100),@ItemName Varchar(100), @Unit varchar(100),@LessQty numeric(18,2),@AddQty numeric(18,2),@Rate numeric(18,2),@Amount numeric(18,2)
DECLARE c1 CURSOR LOCAL READ_ONLY FOR SELECT ItemCode,ItemName,Unit,LessQty,AddQty,Rate,Amount FROM @temp_Table
DECLARE @vIName varchar(100);
DECLARE @vNt_opnqty numeric(18,2)=0;
DECLARE @vNt_PurVal numeric(18,2)=0;
DECLARE @vNt_Salval numeric(18,2)=0;
DECLARE @vNt_salqty numeric(18,2)=0;
DECLARE @vNewsalqty numeric(18,2)=0;
DECLARE @vStckaddval numeric(18,2)=0;
DECLARE @vPurclosestk numeric(18,2)=0;
DECLARE @vNewpurqty numeric(18,2)=0;
DECLARE @vStcklessval numeric(18,2)=0;
DECLARE @vNewsalsqty numeric(18,2)=0;
DECLARE @vNt_cloqty numeric(18,2)=0;
DECLARE @vSalclosestk numeric(18,2)=0;
DECLARE @vSalesstk numeric(18,2)=0;

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
   open c1
   fetch from c1 into @ItemCode,@ItemName,@Unit,@LessQty,@AddQty,@Rate,@Amount
   while @@FETCH_STATUS=0
   begin
   set @vIName=@ItemName;
   select @vOldpurqty=nt_purqty from Item_table where Item_name=@vIName;
   select @vNt_opnqty=nt_opnqty from Item_table where Item_name=@vIName;		
   select @vNt_PurVal=Nt_PurVal from Item_table where Item_name=@vIName;			
   select @vNt_Salval=Nt_Salval from Item_table where Item_name=@vIName;
   select @vNt_salqty=nt_salqty from Item_table where Item_name=@vIName;
   set @vNewsalqty=@AddQty
   
   if @LessQty=0
   begin
   set @vStckaddval=@Amount+@vNt_PurVal;   
   update Item_table set Nt_PurVal=@vStckaddval where Item_name=@vIName;
   set @vPurclosestk=@vNt_opnqty+@vOldpurqty+@AddQty-@vNt_salqty
   set @vNewpurqty=@AddQty+@vOldpurqty
   update Item_table set nt_purqty=@vNewpurqty,nt_cloqty=@vPurclosestk where Item_name=@vIName
   
   end
   
   if @AddQty=0
   begin
   set @vStcklessval=@Amount+@vNt_Salval;
   update Item_table set Nt_Salval=@vStcklessval where Item_name=@vIName
   set @vNewsalsqty=@LessQty
   select @vNt_salqty=nt_salqty from Item_table where Item_name=@vIName
   select @vNt_cloqty=nt_cloqty from Item_table where Item_name=@vIName
   set @vSalclosestk=@vNt_cloqty-@vNewsalsqty;
   set @vSalesstk=@vNt_salqty+@vNewsalsqty;
   update Item_table set nt_salqty=@vSalesstk,nt_cloqty=@vSalclosestk where Item_name=@vIName
   
   end
   fetch next from c1 into @ItemCode,@ItemName,@Unit,@LessQty,@AddQty,@Rate,@Amount
   end
   close c1
   deallocate c1
   
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[SP_PurchaseEntry]
(@Count_values as varchar(100),@SupplierName as Varchar(100),@BillNo as Varchar(20),@InvoiceNo varchar(50),@InvoiceDate as Datetime2,@Dates as datetime2,@PurchaseType as Varchar(100),@OrderNo as varchar(100),@CashNumber as Varchar(50),@Total as varchar(30),@NetAmount as varchar(30),@InvoiceAmount as varchar(30),@dt_gridload SP_PurchaseGridEntry READONLY,@Return as Varchar(20) OUTPUT,@Address1 as varchar(50),@Address2 as varchar(50),@Address3 as varchar(50),@Address4 as varchar(50),@DgDiscount_Table DgDiscountTable READONLY,@tTotalQty numeric(18,0),@Additions Numeric(18,2),@tDiscountAmt numeric(18,2))
as
SET NOCOUNT ON 
DECLARE @TranCounter INT; 
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   declare @number_serious varchar(100),@number_seroius_strn_Sno varchar(100)
   select @number_serious=(max(StrnNo)+1) from NumberTable
   select @number_seroius_strn_Sno=(max(StrnSno)+1) from NumberTable
   declare @purchase_type_number as varchar(100)
   select  @purchase_type_number=(PurType_No)  from PurType_Table where PurType_Name=@PurchaseType
   
   declare @CounterNo varchar(20)
   --if  IS NOT NULL
   if @Count_values is not null and @Count_values <> ''
   begin
        select @CounterNo=(ctr_no) from counter_table where ctr_name=@Count_values;
   End
   declare @LedgerNo varchar(20);
   select @LedgerNo=(ledger_no) from ledger_table where  ledger_name=@SupplierName 
   Declare @tTypes varchar(100) ,@tDetails varchar(100),@tPreQty numeric(18, 2),@tPercent numeric(18, 2),@tAmount numeric(18, 2),@Counts int=1 
   Declare @tAddtionAmt_tot numeric(18,2)
   declare @tDiscountAmt_tot numeric(18,2),@tDiscountAmt_tot1 numeric(18,2),@Tpurchaset_tot numeric(18,2)
  Declare @PurchaseRateTF as varchar(20),@ActualCostTF as Varchar(20),@CostTF as Varchar(20),@MrpTF as Varchar(20),@Spcial1_RateTF as Varchar(20),@Spcial2_RateTF as Varchar(20),@Spcial3_RateTF as Varchar(20)
  --Condition Apply
   declare @ickh int=0;
    select @ickh=(count(*)) from  @dt_gridload;
    if @ickh>0
        begin
        insert into purmas_table(pmas_sno,pmas_VoucherNo,pmas_no,pmas_billno,pmas_days,pmas_type,PurType,Grn_no,Order_no,Godown_no,Ctr_no,UserNo,Party_no,Update_stock,pmas_DlrPer,PurLed_no,CashLed_no,pmas_name,pmas_add1,pmas_add2,pmas_add3,pmas_add4,Pmas_St,Pmas_Cst,pmas_cashmode,pmas_saltype,pmas_gross,pmas_netamount,pmas_addled1,pmas_addled2,pmas_addled3,pmas_addled4,pmas_AlD1,pmas_AlD2,pmas_AlD3,pmas_AlD4,pmas_ALP1,pmas_ALP2,pmas_ALP3,pmas_ALP4,pmas_ALA1,pmas_ALA2,pmas_ALA3,pmas_ALA4,pmas_ALq1,pmas_ALq2,pmas_ALq3,pmas_ALq4,pmas_ALPr1,pmas_ALPr2,pmas_ALPr3,pmas_ALPr4,Pmas_OL1,Pmas_OL2,Pmas_OL3,Pmas_OL4,pmas_OP1,pmas_OP2,pmas_OP3,pmas_OP4,pmas_OA1,pmas_OA2,pmas_OA3,pmas_OA4,pmas_Oq1,pmas_Oq2,pmas_Oq3,pmas_Oq4,pmas_value,pmas_cancel,pmas_cremark,pmas_returnno,pmas_remark,update_flag,Pmas_columns,PurcVchNo,pmas_date,pmas_billdate,pmas_VoucherPrefix,pmas_VoucherSuffix,pmas_time,CommodityNo,pmas_Dlramt,VoucherSno )values(@number_serious,@BillNo,@BillNo,@InvoiceNo,'0','0',@purchase_type_number,'',@OrderNo,'',@CounterNo,@CounterNo,@LedgerNo,'','','0',@CashNumber,@SupplierName,@Address1,@Address2,@Address3,@Address4,'','','0','0',@Total,@NetAmount,'0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@InvoiceAmount,'0','','0','','0','1','0',convert(Date,@Dates),convert(Date,@InvoiceDate),'','','','','','')
   --update NumberTable:
   update NumberTable set StrnSno= @number_seroius_strn_Sno,StrnNo=@number_serious
		 declare @itemCode1 as varchar(200),@ItemName1 as varchar(200),@Quantity as numeric(18,0),@Rate as numeric(18,2), @Amount1 as numeric(18,2),@DicountPerSentage1 as numeric(18,2),@DiscountAmount1 as numeric(18,2),@MrpRate as numeric(18,2),@TotalAmount1 as numeric(18,2),@itemnumber1 as varchar(20),@MarginNo as varchar(20),@TaxNumber as varchar(20),@unitNumber as varchar(20),@number_seroius_strn_Sno1 as varchar(20),@number_serious1 as varchar(20),@Dates1 datetime,@Counters1 as varchar(200),@CounterNext int=0,@TaxRate as Varchar(20),@TaxName as Varchar(100),@TaxPer as numeric(18,2),@TaxAmt as numeric(18,2),@PurSpecial_1 numeric(18,2),@PurSpecial_2 numeric(18,2),@PurSpecial_3 numeric(18,2)
        	declare c Cursor Local Read_only for select itemCode,ItemName,Quantity,Rate,Amount,DicountPerSentage,DiscountAmount,MrpRate,TotalAmount,Dates,Counters,TaxRate,TaxName,TaxPer,TaxAmt,Special_1,Special_2,Special_3 from @dt_gridload 
              open c
        		 fetch from c into @itemCode1,@ItemName1,@Quantity,@Rate,@Amount1,@DicountPerSentage1,@DiscountAmount1,@MrpRate,@TotalAmount1,@Dates1,@Counters1,@TaxRate,@TaxName,@TaxPer,@TaxAmt,@PurSpecial_1,@PurSpecial_2,@PurSpecial_3
        		 	while @@FETCH_STATUS=0
        		 		begin
        		 			
        		 			update Item_table set nt_purqty=nt_purqty+@Quantity,nt_purval=nt_purval+(@TotalAmount1),nt_cloqty=nt_cloqty+@Quantity where item_name =@ItemName1
        		 			
        		 			
								 Set @Tpurchaset_tot=(@tTotalQty*@Rate)/@tTotalQty
							     select @PurchaseRateTF=UpdatePurchaseRate from control_table
							   if @PurchaseRateTF='1' or @PurchaseRateTF='Yes'  
							   	   begin
										 update Item_table set Item_ndp=@Rate where item_name =@ItemName1 
								   End
								     
							   Else --Purchase Gentral Setting Else part:
							  
							      Select @PurchaseRateTF=UpdatePurchaseRateGRN from control_table 
							     if @PurchaseRateTF='1' or @PurchaseRateTF='Yes'  
							       Begin
							       		 update Item_table set Item_ndp=@Rate where item_name =@ItemName1 
							       End 	   
								--Update MrpRate Same Values Here: 
							  select  @MrpTF=UpdateMrpRate from Control_table  
							  if  @MrpTF='1' or @MrpTF='Yes'
								Begin
										 update Item_table set item_mrsp=@MrpRate where item_name =@ItemName1 
								End
								
							  Else--Update Purchase Genral Setting Mrp Rate Same Values: 
							  Set @MrpTF=''
							   select @MrpTF=UpdateMrpRateGRN from Control_table  
							   if @MrpTF ='1' or @MrpTF='Yes'
							      begin
							           update Item_table set item_mrsp=@MrpRate where item_name =@ItemName1 
							       End	
							    
								--Update Special Rate1
							  select  @Spcial1_RateTF=UpdateSpecial1Rate from Control_table  
							  if  @Spcial1_RateTF='1' or @Spcial1_RateTF='Yes'
								Begin
										 update Item_table set Item_special1=@PurSpecial_1 where item_name=@ItemName1 
								End
								
								--Update Purchase Genral Setting:
							   Else 
							       select  @Spcial1_RateTF=UpdateSpecial1RateGRN from Control_table
							       if  @Spcial1_RateTF='1' or @Spcial1_RateTF='Yes'
								Begin
										 update Item_table set Item_special1=@PurSpecial_1 where item_name=@ItemName1 
								End
							   
							   
								--Update Special Rate2
								  select  @Spcial2_RateTF=UpdateSpecial2Rate from Control_table  
							  if  @Spcial1_RateTF='1' or @Spcial1_RateTF='Yes'
								Begin
										 update Item_table set Item_special2=@PurSpecial_2 where item_name=@ItemName1 
								End
								--Update Purchase Genral Settings:
						     Else
						          select  @Spcial2_RateTF=UpdateSpecial2RateGRN from Control_table  
							  if  @Spcial2_RateTF='1' or @Spcial2_RateTF='Yes'
								Begin
										 update Item_table set Item_special2=@PurSpecial_2 where item_name=@ItemName1 
								End		
								
								
								--Update Special Rate3
								select  @Spcial3_RateTF=UpdateSpecial3Rate  from Control_table  
							  if @Spcial1_RateTF='1' or @Spcial3_RateTF='Yes'
								Begin
										 update Item_table set Item_special3=@PurSpecial_3 where item_name=@ItemName1 
								End	
							     --Update purchase Genral Settings:	
							     select  @Spcial2_RateTF=UpdateCost  from Control_table  
							   if @Spcial2_RateTF='1' or @Spcial2_RateTF='Yes'
								Begin
										 update Item_table set Item_special3=@PurSpecial_3 where item_name=@ItemName1 
								End
							select @itemnumber1=(item_no) from Item_table where item_name =@ItemName1
							select @MarginNo=(Margin_no) from Item_table where item_name =@ItemName1
							select @TaxNumber=(Tax_no) from Item_table where item_name =@ItemName1
							select @unitNumber=(Unit_no) from Item_table where item_name =@ItemName1
							select @number_seroius_strn_Sno1=(max(StrnSno)+1) from NumberTable
							select @number_serious1=(max(StrnNo)+1) from NumberTable
							update NumberTable set StrnSno=@number_seroius_strn_Sno1
							select @CounterNext=ctr_no from counter_table where ctr_name=@Counters1
							Insert into stktrn_table(strn_sno,strn_no,strn_date,item_no,nt_qty,Rate,Amount,tot_amt,Net_amt,Cost,Mrsp,Margin_No,Srate,Tax_No,Disc_per,Disc_Amt,Unit_no,Unit_Ratio,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,Other_Exp,BillOther_Exp,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,Disc_PerQty,CurrencyValue,CurrencyNo,Tax_Rate,QtyDetails,Invtx_qty,Invnt_qty,rtx_qty,rnt_qty,Short_qty,tx_qty,QtyInPieces,godown_no,ctr_no,Dc_no,OrderSno,StrnParty_no,Godown_BillNo,strn_rtno,strn_type,Grn_no) values(@number_seroius_strn_Sno1,@number_serious,convert(Date,@Dates1),@itemnumber1,@Quantity,@Rate,@Amount1,@Amount1,@MrpRate,@MrpRate,@MrpRate,@MarginNo,@MrpRate,@TaxNumber,@DicountPerSentage1,@DiscountAmount1,@unitNumber,@unitNumber,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@TaxRate,'','0','0','0','0','0','0','0','0',@CounterNext,'0','0','8','0','0','3','0')
							declare @ItemTaxNo varchar(10)
							select @ItemTaxNo=(Tax_no) from tax_table where tax_name=@TaxName 
							Update stktrn_table set Tax_no=@ItemTaxNo,tax_per=@TaxPer,tax_amt=@TaxAmt,tot_amt=@TotalAmount1 Where strn_sno=@number_seroius_strn_Sno1 and strn_no=@number_serious
							
						select @ActualCostTF=UpdatePurActualCost from control_table
						if @ActualCostTF='Yes'
						Begin	  
							declare @ickh1 int=0;
							select @ickh1=(count(*)) from  @dt_gridload;
						if @ickh1>0 
							 Begin
								
								declare c1 Cursor Local Read_only for select [Types],[Details],[PreQty],[Percent],[Amount] from @DgDiscount_Table 
							      open c1
									   fetch from c1 into  @tTypes ,@tDetails,@tPreQty,@tPercent,@tAmount 
									   While @@FETCH_STATUS=0
									   Begin
											if @tTypes='Additions'
											  Begin
												 if @tPreQty>0
												   Begin
												    Set @tAddtionAmt_tot=0.00
												    Set @tAddtionAmt_tot=((@tTotalQty*@Rate)+@Additions-@tDiscountAmt)/@tTotalQty 
												    Update item_table set Item_cost=@tAddtionAmt_tot where item_name =@ItemName1
												   End
												   else if @tPercent>0
												    Begin
												        Set @tDiscountAmt_tot=0.00
												        Set @tDiscountAmt_tot1=0.00
												        Set @tDiscountAmt_tot=(@tTotalQty*@Rate)
												        set @tDiscountAmt_tot1=(@tDiscountAmt_tot*@tPercent)/100
												        Set @tDiscountAmt_tot=((@tDiscountAmt_tot1-@tDiscountAmt)+(@tTotalQty*@Rate))/@tTotalQty
												        Update item_table set Item_cost=@tDiscountAmt_tot where item_name =@ItemName1
												    End	
											   End 
											      fetch next from c1 into  @tTypes ,@tDetails,@tPreQty,@tPercent,@tAmount        
									    End 
							      Close c1	    
							   End
							  
							Else  
							     begin
													Set @tAddtionAmt_tot=0.00
												    Set @tAddtionAmt_tot=((@tTotalQty*@Rate)+(@Additions-@tDiscountAmt))/@tTotalQty 
												    Update item_table set Item_cost=@tAddtionAmt_tot where item_name =@ItemName1
												   
							     End    
					    End		
							fetch next from c into @itemCode1,@ItemName1,@Quantity,@Rate,@Amount1,@DicountPerSentage1,@DiscountAmount1,@MrpRate,@TotalAmount1,@Dates1,@Counters1,@TaxRate,@TaxName,@TaxPer,@TaxAmt,@PurSpecial_1,@PurSpecial_2,@PurSpecial_3
							SET @Return='1'
					End
						SELECT @Return;
				close c
		End
		
	declare @ickh12 int=0;
    select @ickh12=(count(*)) from  @dt_gridload;
    if @ickh12>0 
    Begin
       
        declare c1 Cursor Local Read_only for select [Types],[Details],[PreQty],[Percent],[Amount] from @DgDiscount_Table 
              open c1
               fetch from c1 into  @tTypes ,@tDetails,@tPreQty,@tPercent,@tAmount 
               While @@FETCH_STATUS=0
               Begin
               declare @tLedgerNo varchar(10),@tDiscountType varchar(10),@tledgno varchar(10)
               select @tLedgerNo=(ledger_no) from Ledsel_table where Ledsel_name=@SupplierName 
               select @tDiscountType=(ledger_no) from Ledsel_table where Ledsel_name=@tDetails 
			   select @tledgno=(ledger_no) from ledger_table  where Ledger_name=@tDetails 
			   declare @PmasDicountType varchar(10)
			   select @PmasDicountType=max(pmas_sno) from purmas_table
			   
               insert into PurDiscount_Table(PmasType,PmasSno,DiscSNo,DiscType,LedgerNo,PerQty,[Percent],Amount)values(@tLedgerNo,@PmasDicountType,@Counts,@tTypes,@tledgno,@tPreQty,@tPercent,@tAmount) 
               Set @Counts=@Counts+1
               fetch next from c1 into  @tTypes ,@tDetails,@tPreQty,@tPercent,@tAmount 
               End
              Close c1
    End
  
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE PROCEDURE [dbo].[SP_PurchaseAlter] (@Counter As Varchar(200),@Cash As Varchar(200),@VoucherNo as varchar(100),@InvoiceNo as varchar(500),@OrderNumber as Varchar(500),@SupplierName as Varchar(200),@Gst as varchar(200),@RegistationNo as varchar(100),@GrossAmount as varchar(50),@CurrentDate datetime,@dt_gridload SP_PurchaseItemAlter READONLY,@gload1 SP_PurchaseTypeAlter ReadOnly,@DgDiscount_Table DgDiscountTable READONLY,@ReturnResult1 as varchar(20) OUTPUT,@Address1 as varchar(50),@Address2 as varchar(50),@Address3 as varchar(50),@Address4 as varchar(50),@Dates as Date ,@InvoiceDate as Date)
as
SET NOCOUNT ON 
DECLARE @TranCounter INT; 
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
BEGIN TRY
		 Declare  @CounterNo as Varchar(50),@CashNu as varchar(100)
	BEGIN
		 select @CounterNo=(ctr_no) from counter_table where ctr_name=@Counter
		 END
		 if @Cash='Cash'
		 Begin
		 SET @CashNu='5'
		 End
		 Else if @Cash<>'Cash'
		 Begin
		 SET @CashNu='8'
	End
BEGIN	 
		   update purmas_table set pmas_billno=@InvoiceNo,order_no=@OrderNumber,Ctr_no=@CounterNo,PurLed_no='3',CashLed_no=@CashNu,pmas_name=@SupplierName,Pmas_St=@Gst,Pmas_Cst=@RegistationNo,pmas_gross=@GrossAmount,pmas_netamount=@GrossAmount,pmas_value=@GrossAmount,pmas_add1=@Address1,pmas_add2=@Address2,pmas_add3=@Address3,pmas_add4=@Address4,pmas_date=convert(Date,@Dates),pmas_billdate=convert(Date,@InvoiceDate)  where Pmas_sno=@VoucherNo	
		   declare @ickh int=0;
		   declare @item_no as Varchar(20),@Margin_no as Varchar(20),@Tax_no as varchar(20),@Unit_no as varchar(20);
		   declare @strn_sno as varchar(20) ,@strn_no as varchar(20),@ite_no as varchar(20),@nt_qty as varchar(20),@Amount  as varchar(20),@UpTaxName as Varchar(50),@UpTaxPer numeric(18,2),@UpTaxAmt Numeric(18,2)
		   declare @ItemCode1 as varchar(200),@ItemName1 as varchar(200),@Remarks1 as varchar(500),@Unit1 as varchar(20),@Qtuantity1 as numeric(18,2),@Rate1 as numeric(18,2),@Amount1 as numeric(18,2), @TaxRate1 as numeric(18,2),@Discount1 as numeric(18,2),@DiscountAmount1 as numeric(18,2),@MrpRate1 as numeric(18,2),@Special11 as varchar(100),@Special22 as varchar(100),@Special33 as varchar(100),@TotalAmount1 as numeric(18,2),@Ex1 as varchar(20),@number_seroius_strn_Sno as varchar(20),@StrnNo as varchar(20),@StrnSno as varchar(20)
		   select @ickh=(count(*)) from  @dt_gridload;
		   if @ickh>0
		   begin
			declare c Cursor Local Read_only for select strn_sno,strn_no,ite_no,nt_qty,Amount from @dt_gridload 
				Open c
				  fetch from c into @strn_sno ,@strn_no ,@ite_no,@nt_qty,@Amount 
				  while @@FETCH_STATUS=0
        		 		begin	
        		 			if @strn_sno <>'' and @strn_no <>'' 
        		 			Begin
							update Item_table set nt_purqty=nt_purqty-(@nt_qty),nt_cloqty=nt_cloqty-(@nt_qty),nt_purval=nt_purval-(@Amount)  where Item_no =@ite_no
							fetch next from c into @strn_sno ,@strn_no ,@ite_no,@nt_qty,@Amount
							End
					    End
				Close c
				Deallocate c
		   End
		   delete from stktrn_table where   strn_no=@VoucherNo and strn_type='3' and StrnParty_no='8'
		   Set @ickh=0;
		   select @ickh=(count(*)) from  @gload1; 
		  if @ickh>0 
			
		  Begin
			declare c1 Cursor Local Read_only for select ItemCode,ItemName,Remarks,Unit,Qty,Rate,TaxRate,Amount,Discount,DiscountAmount,MrpRate,Special1,Special2,Special3,TotalAmount,Ex,StrnNo,StrnSno,TaxName,TaxPer,TaxAmt from @gload1 
			  Open c1
			 
			     fetch from c1 into @ItemCode1,@ItemName1 ,@Remarks1,@Unit1,@Qtuantity1,@Rate1, @TaxRate1,@Amount1, @Discount1 ,@DiscountAmount1 ,@MrpRate1 ,@Special11 ,@Special22 ,@Special33 ,@TotalAmount1 ,@Ex1,@StrnNo,@StrnSno,@UpTaxName,@UpTaxPer,@UpTaxAmt
			      while @@FETCH_STATUS=0
        		 		begin	
        		 		 
        		 		    select @number_seroius_strn_Sno=(max(StrnSno)+1) from NumberTable
        		 					 select @item_no=item_no, @Margin_no=Margin_no,@Tax_no=Tax_no,@Unit_no=Unit_no  from item_table where item_name=@ItemName1	
        		 				     update NumberTable set StrnSno=@number_seroius_strn_Sno
        		 					 update Item_table set nt_purqty=nt_purqty+@Qtuantity1,nt_purval=nt_purval+@TotalAmount1,nt_cloqty=nt_cloqty+@Qtuantity1  where item_name =@ItemName1
        		 					 Insert into stktrn_table(strn_sno,strn_no,strn_date,item_no,nt_qty,Rate,Amount,tot_amt,Net_amt,Cost,Mrsp,Margin_No,Srate,Tax_No,Disc_per,Disc_Amt,Unit_no,Unit_Ratio,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,Other_Exp,BillOther_Exp,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,Disc_PerQty,CurrencyValue,CurrencyNo,Tax_Rate,QtyDetails,Invtx_qty,Invnt_qty,rtx_qty,rnt_qty,Short_qty,tx_qty,QtyInPieces,godown_no,ctr_no,Dc_no,OrderSno,StrnParty_no,Godown_BillNo,strn_rtno,strn_type,Grn_no) values(@number_seroius_strn_Sno,@VoucherNo,convert(Date,@CurrentDate),@item_no,@Qtuantity1,@Rate1,@Amount1,@TotalAmount1,@MrpRate1,@MrpRate1,@MrpRate1,@Margin_no,@MrpRate1,@Tax_no,@Discount1,@DiscountAmount1,@Unit_no,@Unit_no,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@TaxRate1,'','0','0','0','0','0','0','0','0',@CounterNo,'0','0','8','0','0','3','0')
        		 					 
        		 					 Declare @taxnoPur Varchar(10)
        		 					 	   select @taxnoPur=Tax_no from tax_table where Tax_name=@UpTaxName
        		 		         
        		 		             
        		 		             
        		 		             Update stktrn_table set Tax_No=@taxnoPur,tax_per=@UpTaxPer,tax_amt=@UpTaxAmt where strn_sno=@number_seroius_strn_Sno and strn_no=@VoucherNo
        		 		         
        		 					 
        		 					 fetch next from c1 into @ItemCode1,@ItemName1 ,@Remarks1,@Unit1,@Qtuantity1,@Rate1, @TaxRate1,@Amount1, @Discount1 ,@DiscountAmount1 ,@MrpRate1 ,@Special11 ,@Special22 ,@Special33 ,@TotalAmount1 ,@Ex1,@StrnNo,@StrnSno,@UpTaxName,@UpTaxPer,@UpTaxAmt 
        		 		    
        		 					 Set @ReturnResult1='1' 		
        		 		End
			  Close c1
		  End 
		  
		  
		  
	declare @ickh12 int=0;
	Declare @tTypes varchar(100),@tDetails varchar(100),@tPreQty numeric(18, 2),@tPercent numeric(18, 2),@tAmount numeric(18, 2),@Counts int=1 
    select @ickh12=(count(*)) from  @dt_gridload
    if @ickh12>0 
    Begin
        delete from PurDiscount_Table where PmasSno=@VoucherNo
        declare c2 Cursor Local Read_only for select [Types],[Details],[PreQty],[Percent],[Amount] from @DgDiscount_Table 
              open c2
               fetch from c2 into  @tTypes ,@tDetails,@tPreQty,@tPercent,@tAmount 
               While @@FETCH_STATUS=0
               Begin
               declare @tLedgerNo varchar(10),@tDiscountType varchar(10),@tledgno varchar(10)
               select @tLedgerNo=(ledger_no) from Ledsel_table where Ledsel_name=@SupplierName 
               select @tDiscountType=(ledger_no) from Ledsel_table where Ledsel_name=@tDetails 
			   select @tledgno=(ledger_no) from ledger_table  where Ledger_name=@tDetails 
			   declare @PmasDicountType varchar(10)
			   select @PmasDicountType=max(pmas_sno) from purmas_table
			   
               insert into PurDiscount_Table(PmasType,PmasSno,DiscSNo,DiscType,LedgerNo,PerQty,[Percent],Amount)values(@tLedgerNo,@VoucherNo,@Counts,@tTypes,@tledgno,@tPreQty,@tPercent,@tAmount) 
               Set @Counts=@Counts+1
               fetch next from c2 into  @tTypes ,@tDetails,@tPreQty,@tPercent,@tAmount 
               End
              Close c2
    End 
    End
   IF @TranCounter = 0           
	COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
      
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO

CREATE procedure [dbo].[SP_SaleSelectQuery](@ActionType as varchar(100),@ItemCode as varchar(100),@ItemName as varchar(100),@GroupName as varchar(100)) 
AS Begin

		IF @ActionType='ItemName'
		Begin
			select * from Item_table where Item_name=@ItemName
		End
		IF @ActionType='FillGrid'
		Begin
			select Item_table.Item_code as ItemCode,Item_table.Item_name as ItemName,Group_table.Group_name as GroupName,Item_table.NQty as NewOpenQty,Item_table.UQty as UsedOpenQty,Item_table.NLow_Rate as NewLowRate,Item_table.NMedium_Rate as NewMediumRate,Item_table.NHigh_Rate as NewHighRate,Item_table.NOther_Rate as NewSpecialRate,Item_table.ULow_Rate as UsedLowRate,Item_table.UMedium_Rate as UsedMediumRate,Item_table.UHigh_Rate as UsedHighRate,Item_table.UOther_Rate as UsedSpecialRate,Item_table.NClose_Qty as NewCloseQty,Item_table.UClose_Qty as UsedCloseQty,Item_table.TotClose_Qty as TotalCloseQty from Item_table,Group_table where Item_table.Group_no=Group_table.Group_id order by Item_table.Item_no asc
		End
		IF @ActionType='GroupName'
		Begin
			Select * from Group_table where Group_name like @GroupName+'%'
		End
		IF @ActionType='ItemCodetoNum'
		BEGIN
			Select * from Item_table where Item_name=@ItemName
		END
		If @ActionType='ItemNo'
		Begin
			Select * from Item_table where Item_no=@ItemCode
		End
		If @ActionType='SearchItemCode'
		Begin
			select Item_table.Item_code as ItemCode,Item_table.Item_name as ItemName,Group_table.Group_name as GroupName,Item_table.NQty as NewOpenQty,Item_table.UQty as UsedOpenQty,Item_table.NLow_Rate as NewLowRate,Item_table.NMedium_Rate as NewMediumRate,Item_table.NHigh_Rate as NewHighRate,Item_table.NOther_Rate as NewSpecialRate,Item_table.ULow_Rate as UsedLowRate,Item_table.UMedium_Rate as UsedMediumRate,Item_table.UHigh_Rate as UsedHighRate,Item_table.UOther_Rate as UsedSpecialRate,Item_table.NClose_Qty as NewCloseQty,Item_table.UClose_Qty as UsedCloseQty,Item_table.TotClose_Qty as TotalCloseQty from Item_table,Group_table where Item_table.Group_no=Group_table.Group_id and  item_code like @ItemCode+'%' order by Item_table.Item_no asc		
		End
		If @ActionType='SearchItemName'
		Begin
			select Item_table.Item_code as ItemCode,Item_table.Item_name as ItemName,Group_table.Group_name as GroupName,Item_table.NQty as NewOpenQty,Item_table.UQty as UsedOpenQty,Item_table.NLow_Rate as NewLowRate,Item_table.NMedium_Rate as NewMediumRate,Item_table.NHigh_Rate as NewHighRate,Item_table.NOther_Rate as NewSpecialRate,Item_table.ULow_Rate as UsedLowRate,Item_table.UMedium_Rate as UsedMediumRate,Item_table.UHigh_Rate as UsedHighRate,Item_table.UOther_Rate as UsedSpecialRate,Item_table.NClose_Qty as NewCloseQty,Item_table.UClose_Qty as UsedCloseQty,Item_table.TotClose_Qty as TotalCloseQty from Item_table,Group_table where Item_table.Group_no=Group_table.Group_id and Item_name like @ItemName+'%' order by Item_table.Item_no asc		
		End
		IF @ActionType='ListGroupName'
		Begin
			Select distinct Group_name from Group_table
		End
		IF @ActionType='ItemCode'
		Begin
			select * from Item_table where Item_code=@ItemCode
		End
		
		IF @ActionType='Invoice_no'
		Begin
			Select MAX(Invoice_no) as InvoiceNumber from SalesInvoiceMaster_table
		End
		
END


GO
CREATE PROCEDURE [dbo].[sp_SalesCreationStockDisplay] (@tItemName varchar(max),@tResult varchar(400) OUT)
as
DECLARE @TranCounter INT; 
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY      
   Select @tResult=Item_name+' Stock : '+CONVERT(varchar,nt_cloqty) from Item_Table where Item_name=@tItemName;
      
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO
CREATE PROCEDURE [dbo].[sp_SalesCreationSelectSingle](@tValue varchar(300),@tActionType varchar(100))
AS
BEGIN
	Declare @tCtr_rsrate numeric(18,0)=(Select Ctl_rsRate from Control_table)
SET NOCOUNT ON 
	if @tActionType='GROUPITEM'
	select * from Item_GroupTable where item_groupname=@tValue;
	if @tActionType='GROUPITEMFIRST1'
	select Top 35 * from Item_Table where Item_Active=1 and item_groupNo=@tValue and Item_name not in (Select Top 0 Item_name from Item_Table where item_groupNo=@tValue order by Item_possition ASC) order by Item_possition ASC
	if @tActionType='GROUPITEMFIRST'
	Select * from Item_Table where Item_Active=1 and item_groupNo=@tValue order by Item_possition ASC	
	IF @tActionType='TXTBOXVALUE'
	Select item_name from Item_table where Item_Active=1 and Item_name Like @tValue OR Item_Code Like @tValue
	IF @tActionType='ITEMNAME'
	Select * from Item_Table where Item_Active=1 and Item_Name=@tValue;
	IF @tActionType='ITEMCODE'
	Begin
	select  (case when(@tCtr_rsrate=18) Then Item_table.Item_special2 when(@tCtr_rsrate=19) Then Item_table.Item_special3 when(@tCtr_rsrate=20) Then Item_table.Item_ndp when(@tCtr_rsrate=21) Then Item_table.Item_cost when(@tCtr_rsrate=22) Then Item_table.item_mrsp when(@tCtr_rsrate=23) Then Item_table.Item_special1 when(@tCtr_rsrate=24) Then Item_table.Item_mrsp End) as Item_mrsp,Item_table.Item_name from Item_Table where Item_Active=1 and Item_code=@tValue;
	End
	IF @tActionType='lblCashSalesTotal'
	Select sum(SalRecv_table.SalRecv_Amt) as Amt from SalRecv_table,SalMas_Table where  Smas_cancel<>1 and Smas_rtno=0 and ctr_no=( select Ctr_no from User_table where User_no=@tValue) and SalRecv_table.SalRecv_Led='5' and SalRecv_table.SalRecv_Salno=SalMas_Table.smas_billno and smas_billdate =(Select convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)) group by SalRecv_table.SalRecv_Led
	
	
	IF @tActionType='lblNETSSalesTotal'
	select Distinct (Strn_no) from stktrn_table,salmas_table where stktrn_table.strn_type=1 and  stktrn_table.strn_rtno<>1 and  stktrn_table.strn_no=salmas_table.smas_no and stktrn_table.strn_date=(Select convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where  Id=(select EndOfDayId from NumberTable))
	
	
	
	
	IF @tActionType='TotItemQtyReport'
	select stktrn_table.item_no,SUM(nt_qty-rnt_qty) as Qty,Rate  from stktrn_table  where strn_type='1' and  strn_Date like @tValue+'%' group by stktrn_table.item_no,stktrn_table.Rate
	IF @tActionType='GETITEMNAME'
	Select item_Name from Item_table where item_no=@tValue
    IF @tActionType='TOTCASHSALES' 
	Select sum(smas_netAmount) as Amt,Count(*) from SalMas_Table where party_no='2' and Smas_cancel='0' and smas_billdate like @tValue+'%'
	 IF @tActionType='TOTNETSSALES'
	Select sum(smas_netAmount) as Amt,Count(*) from SalMas_Table where party_no='14' and Smas_cancel='0' and smas_billdate like @tValue+'%'
	 IF @tActionType='TOTAMT'
	select count(tot_Amt) as Count,sum(tot_Amt) as Grand,sum(Amount) as SubTot,sum(Disc_Amt) as Discount from stktrn_table  where Strn_Cancel<>1 and strn_type=1 and  strn_Date like @tValue+'%'
	IF @tActionType='ITEMNAMEWITHUNIT'
	Begin
  
	select  (case when(@tCtr_rsrate=18) Then Item_table.Item_special2 when(@tCtr_rsrate=19) Then Item_table.Item_special3 when(@tCtr_rsrate=20) Then Item_table.Item_ndp when(@tCtr_rsrate=21) Then Item_table.Item_cost when(@tCtr_rsrate=22) Then Item_table.item_mrsp when(@tCtr_rsrate=23) Then Item_table.Item_special1 when(@tCtr_rsrate=24) Then Item_table.Item_mrsp End) as Item_mrsp,Item_table.Item_name,unit_table.unit_Decimals, unit_table.WeightScale from Item_table,unit_table where Item_table.Item_Active=1 and Item_table.Unit_no=unit_table.unit_no and Item_name=@tValue;
	End
	if @tActionType='ACTIVENEW'
	Select * from beginCashDrawerActive_table where Ctr_no=(select Ctr_no from User_table where User_no=@tValue);
	IF @tActionType='ACTIVENEWMAIN'
	Select * from BeginCashDrawer_table where Ctr_no=(Select Ctr_no from User_table where User_no=@tValue) and  Date=(Select CONVERT(date,Dateadd(day,1,EndOfDay),103) from EndOfDay_Table where Id=(Select EndOfDayId from NumberTable))
	if @tActionType='lblStartAmt'
	BEGIN

    
     DECLARE @tCount numeric(18,0);
    DECLARE @tDate Date;
    DECLARE @tCount1 numeric(18,0);
    select @tCount1=COUNT(*) from EndOfDay_Table; 
     if @tCount1=1
    SELECT @tDate=CONVERT(date,DATEADD(day,1,MAX(endofday))) from EndOfDay_Table
    ELSE
    SELECT @tDate=CONVERT(date,DATEADD(day,1,MAX(endofday))) from EndOfDay_Table
   
    
    
     Select @tCount=Count(*) from ResetDrawer_table where id=(Select MAX(id) from ResetDrawer_table where BeginCashDraw_Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select ctr_no from user_table where User_no=@tValue) and Date=@tDate))
     
     If @tCount=0
     Begin
        
     Select * from BeginCashDrawer_table where Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select Ctr_no from User_table where User_no=@tValue) and Date=@tDate);     
     END
      Else
      Select * from ResetDrawer_table where id=(Select MAX(id) from ResetDrawer_table where BeginCashDraw_Id=(select Max(Id) from BeginCashDrawer_table where Ctr_no=(select Ctr_no from User_table where User_no=@tValue) and Date=@tDate))
     END
	
	if @tActionType='BEGINDRAWERCHECK'
	Select * from BeginCashDrawerActive_table where Ctr_no=(select Ctr_no from User_table where User_no=@tValue)
	if @tActionType='ACTIVE'
	Select * from beginCashDrawerActive_table where Ctr_no=(select Ctr_no from User_table where User_no=@tValue);
	if @tActionType='CashInDrawer'
	BEGIN
	DECLARE @tBeginDate date;
	DECLARE @tEndDate date;
	select @tBeginDate=Date from beginCashDrawer_table where id=(select max(id) from BeginCashDrawer_table where Ctr_no=(Select ctr_no from user_table where user_no=1))
    select @tEndDate=CONVERT(date,EndOfDay,103) from EndOfDay_Table where Id=(select EndOfDayId from NumberTable)
    if @tBeginDate<>@tEndDate    
	Select Sum(PreviousDrawerCash) as PreviousDrawerCash from ResetDrawer_table where BeginCashDraw_Id=(select max(id) from BeginCashDrawer_table where Ctr_no=(Select ctr_no from user_table where user_no=@tValue))	
	END
END

GO
CREATE PROCEDURE [dbo].[sp_SalesCreationSelectAll](@tActionType varchar(100))
AS
BEGIN
	if @tActionType='GROUPCOUNT'
	SELECT distinct(Item_table.Item_groupno) FROM Item_table INNER JOIN Item_Grouptable ON item_table.item_Groupno =Item_Grouptable.Item_groupno ;
	if @tActionType='GROUPNAME'
	SELECT distinct(Item_Grouptable.Item_groupname),Item_Grouptable.GroupPos,Item_Grouptable.Font_Color,Item_Grouptable.Group_Color  FROM Item_table INNER JOIN Item_Grouptable ON item_table.item_Groupno =Item_Grouptable.Item_groupno where Item_Grouptable.Group_visibility='True' order by GroupPos;
	if @tActionType='GROUPIMAGE'
	SELECT Item_Grouptable.Items_Image  FROM Item_table INNER JOIN Item_Grouptable ON item_table.item_Groupno =Item_Grouptable.Item_groupno where Item_Grouptable.Group_visibility='True' order by GroupPos;
	if @tActionType='PREVIOUSBILL'
	select count(*) from SalMas_table
	if @tActionType='GSET'
	Select Describ as Describ,Property as Property from G_set
	if @tActionType='RPTSET'
	Select RDesc As Describ,RProp as Property from rptset
	if @tActionType='CUSTOMTEXT'
	Select Describ as Describ,Prop as Property from Custom_Text
	if @tActionType='HOLDCHK'
	Select * from SalHold_Table
	if @tActionType='GETHOLDNO'
	Select Distinct(Hold_No) from SalHold_Table
	if @tActionType='ENDOFDAY'
	Select CONVERT(date,EndOfDay,108) as EndOfDay from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
	if @tActionType='ENDOFDAYCOUNT'
	Select EndOfDay from EndOFday_Table where Id=(select (MAX(id)) from EndOfDay_Table)
		if @tActionType='ENDOFDAYROWCOUNT'
	Select EndOfDay from EndOFday_Table 
	if @tActionType='lblStartAmt'
	Select * from BeginCashDrawer_table where Id=(select Max(Id) from BeginCashDrawer_table)
	if @tActionType='ACTIVE'
	Select * from beginCashDrawerActive_table
	if @tActionType='BEGINCASHDRAWER'
	Select * from BeginCashDrawer_table
	if @tActionType='UserActivity'
	Select Date,RIGHT(CONVERT(CHAR(20),time, 22), 11) as Time,ActionType from Useractivity_table where Date=convert(date,GETDATE(),103)
	if @tActionType='COMPANYNAME'
	Select * from Company_table	
	if @tActionType='CUSTOMERDISPLAY'
	Select * from CustomerDisplay_table
END

GO
CREATE PROCEDURE [dbo].[sp_SalesCreationNewBtnGroupItem] (@tItemName varchar(max),@tResult NUMERIC(18,2) OUT,@tUnitDigit NUMERIC(18,0) OUT,@tWeightScale bit OUT)
as
DECLARE @TranCounter INT; 
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY      
   Declare @tCtr_rsrate numeric(18,0)=(Select Ctl_rsRate from Control_table)  
  Select @tResult=(case when(@tCtr_rsrate=18) Then Item_table.Item_special2 when(@tCtr_rsrate=19) Then Item_table.Item_special3 when(@tCtr_rsrate=20) Then Item_table.Item_ndp when(@tCtr_rsrate=21) Then Item_table.Item_cost when(@tCtr_rsrate=22) Then Item_table.item_mrsp when(@tCtr_rsrate=23) Then Item_table.Item_special1 when(@tCtr_rsrate=24) Then Item_table.Item_mrsp End) from Item_Table where Item_name=@tItemName;
   select @tUnitDigit=unit_Decimals,@tWeightScale=WeightScale from unit_table where unit_no=(select Unit_no from Item_table where Item_name=@tItemName);
      select * from Item_table
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_SalesCreation_StopAtQtyAndRate] (@tItemName varchar(400),@tStopAtQty VARCHAR(100) OUT,@tStopAtRate VARCHAR(100) OUT)
AS
BEGIN
Select @tStopAtQty=StopAtQty,@tStopAtRate=StopAtRate from Item_table where Item_name=@tItemName;
END

GO
CREATE PROCEDURE [dbo].[sp_SalesAlterationSelectSingle](@tActionType varchar(100),@tValue varchar(400))
AS
BEGIN
SET NOCOUNT ON 
IF @tActionType='CASHTYPE'
select smas_name from salmas_table where smas_billno=@tValue and smas_rtno=0;
IF @tActionType='CASHTYPERETURN'
select smas_name from salmas_table where smas_billno=@tValue and smas_rtno<>0;
IF @tActionType='COUNTERNAME'
select ctr_name from counter_table where ctr_no=(select ctr_no from salmas_table where smas_billno=@tValue and smas_rtno=0);
IF @tActionType='COUNTERNAMERETURN'
select ctr_name from counter_table where ctr_no=(select ctr_no from salmas_table where smas_billno=@tValue and smas_rtno<>0);
IF @tActionType='SALESNAME'
select (CASE WHEN smas_saltype='True' THEN 'Whole Sales' ELSE 'Retail Sales' END) as SalesType from salmas_table where smas_billno=@tValue;
IF @tActionType='DONO'
select dc_no from salmas_table where smas_billno=@tValue;
IF @tActionType='CASHORNETS'
select (CASE WHEN smas_cashmode='True' THEN 'Cash' ELSE 'Credit' END) as CASH from salmas_table where smas_billno=@tValue AND smas_rtno=0;
IF @tActionType='CASHORNETSRETURN'
select (CASE WHEN smas_cashmode='True' THEN 'Cash' ELSE 'Credit' END) as CASH from salmas_table where smas_billno=@tValue and smas_rtno<>0;

IF @tActionType='ORDERNO'
select order_no from salmas_table where smas_billno=@tValue and smas_rtno=0;
IF @tActionType='ITEMDETAIL'
select Item_name,Item_code,convert(numeric(18,2),Item_mrsp) as Item_mrsp from Item_table where Item_Active=1 order by Item_name ASC
IF @tActionType='SALMASNO'
select smas_no from salmas_table where smas_billno=@tValue
IF @tActionType='ITEMFILL'
Select Item_table.Item_code,Item_table.Item_name,stktrn_table.nt_qty ,CONVERT(numeric(18,2), stktrn_table.Rate) as Rate,CONVERT(numeric(18,2),stktrn_table.Amount) as Amount,stktrn_table.strn_sno as Id from stktrn_table,Item_table where Item_table.Item_no=stktrn_table.item_no and stktrn_table.strn_no=(select smas_no from salmas_table where smas_billno=@tValue and smas_rtno=0)
IF @tActionType='ITEMFILLRETURN'
Select Item_table.Item_code,Item_table.Item_name,stktrn_table.rnt_qty as nt_Qty , CONVERT(numeric(18,2), stktrn_table.Rate) as Rate,convert(numeric(18,2),(stktrn_table.rnt_qty * stktrn_table.Rate))as Amount,stktrn_table.strn_sno as Id from stktrn_table,Item_table where Item_table.Item_no=stktrn_table.item_no and stktrn_table.strn_no=(select smas_no from salmas_table where strn_rtno=0 and smas_no=(Select smas_rtno from salmas_table where smas_billno=@tValue and smas_rtno<>0))

IF @tActionType='LEDGERLIKE'
Select Ledger_name from Ledger_table where Ledger_name like @tValue+'%';
IF @tActionType='COUNTERNAMELIKE'
Select ctr_name from counter_table where ctr_name like @tValue+'%';
IF @tActionType='ITEMDETAILWITHCODE'
select Item_name,Item_code,convert(numeric(18,2),Item_mrsp) as Item_mrsp from Item_table where Item_code=@tValue;
IF @tActionType='ITEMDETAILWITHNAME'
select Item_code,convert(numeric(18,2),Item_mrsp) as Item_mrsp from Item_table where Item_name=@tValue
IF @tActionType='ITEMNO'
select Item_no from Item_table where Item_code=@tValue;
IF @tActionType='SEARCHBYCUSTOMERNO'
Select  Item_table.Item_code,Item_table.Item_name, sum(stktrn_table.nt_qty)as nt_qty ,convert(numeric(18,2),sum(stktrn_table.Amount)) as Amount from stktrn_table,Item_table where Item_table.Item_no=stktrn_table.item_no and stktrn_table.StrnParty_no=@tValue group by Item_table.Item_no,Item_table.Item_code,Item_table.Item_name 
IF @tActionType='SEARCHLEDGERNO'
select Distinct(Ledger_no) from Ledger_table where Ledger_name=@tValue
IF @tActionType='BRAND'
Select Brand_name from Brand_table where Brand_name like @tValue+'%';
IF @tActionType='GROUP'
Select Item_groupname from Item_Grouptable where Item_groupname like @tValue+'%';
IF @tActionType='COUNTER'
select ctr_name from counter_table where ctr_name like @tValue+'%';
IF @tActionType='MODEL'
select Model_name from Model_table where Model_name like @tValue+'%';
IF @tActionType='ITEMNAME'
select Item_no from Item_table where Item_name=@tValue;
IF @tActionType='ITEMNAMEALL'
Select * from Item_seltable where Item_selname like @tValue+'%' Order by Item_selname;
IF @tActionType='SALMASNOCHANGE'
select smas_no from salmas_table where smas_billno=@tValue and smas_rtno=0
IF @tActionType='SALMASNOCHANGERETURN'
select smas_no from salmas_table where smas_billno=@tValue and smas_rtno<>0
IF @tActionType='TaxCal'
select Nt_percent from Tax_table where Tax_no=(select Tax_no from Item_table where Item_name=@tValue);
IF @tActionType='DISCOUNTVALUE'
SELECT Amount FROM DiscountDetail_table where Bill_no=@tValue
IF @tActionType='SALESRETURNNO'
SELECT (count(*)+1) as ReturnNo FROM salmas_table where smas_rtno<>0

IF @tActionType='SALESRETURNITEMRETURNQTY'
SELECT Item_table.Item_name,stktrn_table.nt_qty,CONVERT(numeric(18,2),stktrn_table.Rate) as Rate,convert(numeric(18,2),(stktrn_table.nt_qty*stktrn_table.Rate)) as Amount,stktrn_table.strn_rtno as Id FROM stktrn_table,Item_table where Item_table.Item_no=stktrn_table.item_no and strn_no=@tValue and strn_rtno<>0
IF @tActionType='BARCODECHECKNO'
SELECT ITEM_NO FROM BarCode_table WHERE BarCode=@tValue
End

GO
CREATE procedure [dbo].[SP_SelectQuery](@ActionType as varchar(100),@ItemCode as varchar(100),@itemName as Varchar(200))
AS Begin
SET NOCOUNT ON 
		IF @ActionType='ItemCode'
		Begin
			select * from item_table where item_code=RTRIM(LTRIM(@ItemCode))
		End
		Else IF @ActionType='ItemName'
		Begin
		   select * from item_table where Item_name=RTRIM(LTRIM(@itemName)) or item_code=@itemName or Item_no=(select Item_no from BarCode_table where BarCode=@itemName)
		End
		Else IF @ActionType='SpplierName'
		Begin
		select Ledsel_name from Ledsel_table where ledger_Type=1  and Ledsel_name like @itemName+'%'
		End
		Else IF @ActionType='PurchaseLs'
		Begin
		select  PurType_Name from PurType_Table where PurType_Name like @itemName+'%'
		End
		Else IF @ActionType='CounterType'
		Begin
		select  ctr_name from Counter_table where ctr_name like @itemName+ '%'
		End
		Else IF @ActionType='SelectItems'
		Begin 
		select Item_name from Item_table
		End
		Else IF @ActionType='LedgerType'
		Begin
		select Ledsel_name from Ledsel_table where ledger_Type=1 order by Ledsel_name ASC
		End
		Else IF @ActionType ='Commodity'
		BEGIN
		select Commodity_Name from Commodity_Table order by Commodity_Name ASC
		END
		Else IF @ActionType='PurchaseType'
		BEGIN	
		select  PurType_Name from PurType_Table order by PurType_Name  ASC
		END
		ELSE IF @ActionType='COUNTERTYPE'
		BEGIN
		select ctr_name  from counter_table order by ctr_name  ASC
		END
		Else IF @ActionType='Barcode'
		BEGIN
		select * from barcode_table where barcode=RTRIM(LTRIM(@ItemCode))
		END
		ELSE IF @ActionType='LikeItemName'
		BEGIN 
		 select item_selname from item_seltable  where item_selname like @itemName+'%'
		END
		ELSE IF @ActionType='ItemSelName'
		Begin
		select distinct item_no from item_seltable where item_selname=RTRIM(LTRIM(@itemName))
		End
		ELSE IF @ActionType='Selectstrn'
		Begin
		select * from stktrn_table where strn_no=@itemName
		End
		ELSE IF @ActionType='PurchasmassValue'
		Begin
		select * from purmas_table where Pmas_Sno=@itemName
		End
		ELSE IF @ActionType='TextAddValues'
		Begin
		SELECT PurType_Table.PurType_Name FROM purmas_table INNER JOIN PurType_Table ON purmas_table.PurType = PurType_Table.PurType_No where purmas_table.pmas_Sno=@itemName
		End
		ELSE IF @ActionType='LedgerNumber'
		BEGIN
		select * from Ledsel_table where  ledger_no=@itemName
		END
		ELSE IF @ActionType='CounterName'
		BEGIN
		select * from counter_table where ctr_no=@itemName
		END
		ELSE IF @ActionType='UnitNo'
		BEGIN
		select * from unit_table where unit_no=@itemName
		END
		ELSE IF @ActionType='ItemNo'
		BEGIN
		select * from item_table where item_no=@itemName
		END
		ELSE IF @ActionType='SelectPurchaseMasTb'
		BEGIN
		SELECT distinct purmas_table.pmas_date, purmas_table.pmas_billno, purmas_table.pmas_billdate, purmas_table.pmas_name, Ledger_table.Ledger_name, Convert(numeric(18,2),purmas_table.pmas_netamount) as pmas_netamount, purmas_table.Pmas_sno FROM (purmas_table INNER JOIN stktrn_table ON purmas_table.Pmas_sno = stktrn_table.strn_no) INNER JOIN Ledger_table ON purmas_table.CashLed_no = Ledger_table.Ledger_no
		END
		Else IF @ActionType='LegderName'
		Begin
		select ledger_no from Ledger_table where ledger_name=@itemName
		End
		ELSe IF @ActionType='ModelGroupTable'
		Begin
		
		select item_groupname from Item_Grouptable where Item_groupname like @itemName+'%'
		End
		ELSE IF @ActionType='BrandTable'
		Begin
		select Brand_name from Brand_table where Brand_name Like @itemName+'%'
		End
		ELSE IF @ActionType='ModelTable'
		Begin
		select * from model_table where Model_name Like @itemName+'%'
		End
		Else IF @ActionType='UnitTable'
		Begin
		Select * from unit_table where unit_name like @itemName+'%'
		End
		Else IF @ActionType='BrandNo'
		Begin
		select  Brand_no from Brand_table where Brand_name=(LTrim(RTrim(@itemName)))
		End
		Else IF @ActionType='ItemGroupNo'
		Begin
		select *  from item_grouptable where  item_groupname=@itemName
		End
		Else IF @ActionType='ModelNo'
		Begin
		select  Model_no   from Model_table where  Model_name=@itemName
		End
		Else IF @ActionType='ItemGroupSelect'
		Begin
		select item_groupname from Item_Grouptable order by item_groupno ASC
		End
		Else IF @ActionType='ModelSelect'
		Begin
		select  Model_name  from Model_table order by model_no ASC
		End
		Else IF @ActionType='BrandSelect'
		Begin
		select  Brand_name  from Brand_table order by Brand_no ASC
		End
		Else IF @ActionType='Unitnametonumber'
		Begin
		select * from unit_table where unit_name=@itemName
		End
		Else IF @ActionType='UnitSelect'
		Begin
		select unit_name  from unit_table order by unit_no ASC
		End
		Else IF @ActionType='Action'
		Begin
		select * from item_table where Item_code=@ItemCode or item_no=(select item_no from BarCode_table where BarCode=@ItemCode) or Item_name=@itemName
		End
		Else IF @ActionType='ItemSelNameChk'
		Begin
		select item_selname from item_seltable  where item_selname like  @itemName+'%'
		End
		Else IF @ActionType='ItemNameLike'
		Begin
		Select * from item_table where item_name like @itemName+'%'
		End
		Else IF @ActionType='SlectBOM'
		Begin
		select BOM_No,BOM_name from BOMMas_Table group by BOM_No,BOM_name
		End
		Else IF @ActionType='SelectBOM_name'
		Begin
		Select distinct BOM_name from BOMMas_Table where BOM_name Like RTRIM(LTRIM(@itemName+'%'))
		End
		Else IF @ActionType='SelectBomNo'
		Begin
		Select BOM_No from BOMMas_Table where BOM_name=RTRIM(LTRIM(@itemName))
		End
		Else IF @ActionType='SelectBomValues'
		Begin
		SELECT dbo.Item_table.Item_code, dbo.Item_table.Item_name, dbo.unit_table.unit_name, dbo.BOMMas_Table.BOM_name,(case when dbo.BOMMas_Table.Type=1 Then 'Output' else 'Input' End) as Typess, dbo.BOMMas_Table.tx_Qty, dbo.BOMMas_Table.nt_qty, dbo.BOMMas_Table.Rate, dbo.BOMMas_Table.Amount, dbo.BOMMas_Table.LabourAmount FROM  dbo.Item_table INNER JOIN dbo.BOMMas_Table ON dbo.Item_table.Item_no = dbo.BOMMas_Table.Item_No INNER JOIN dbo.unit_table ON dbo.BOMMas_Table.Unit_No = dbo.unit_table.unit_no where BOMMas_Table.BOM_No=@itemName
		End
		Else IF @ActionType='SelectReport'
		Begin
		declare @query as varchar(max)
		select @query=@itemName
		Exec(@query)
		End	
		Else IF @ActionType='SelectGridLoadValues'
		Begin
		SELECT dbo.Item_table.Item_code, dbo.Item_table.Item_name, dbo.unit_table.unit_name,dbo.BOMMas_Table.BOM_No, dbo.BOMMas_Table.BOM_name,(case when dbo.BOMMas_Table.Type=1 Then 'Output' else 'Input' End) as Typess, dbo.BOMMas_Table.tx_Qty, dbo.BOMMas_Table.nt_qty, dbo.BOMMas_Table.Rate, dbo.BOMMas_Table.Amount, dbo.BOMMas_Table.LabourAmount FROM  dbo.Item_table INNER JOIN dbo.BOMMas_Table ON dbo.Item_table.Item_no = dbo.BOMMas_Table.Item_No INNER JOIN dbo.unit_table ON dbo.BOMMas_Table.Unit_No = dbo.unit_table.unit_no  order by BOM_No
		End
		Else IF @ActionType='Ledsel_tableSelect'
		Begin
		Select * from Ledsel_table where Ledger_Type='2'
		End
		Else IF @ActionType='SelectBOmName'
		Begin
		select distinct (BOM_name) from BOMMas_Table
		End
		Else IF @ActionType='BOMIssueselect'
		Begin
		SELECT       dbo.Item_table.Item_code,dbo.Item_table.Item_name, (case when dbo.BOMMas_Table.Type=1 Then 'Output' else 'Input' End) as Typess,dbo.unit_table.unit_name, dbo.BOMMas_Table.tx_Qty, dbo.BOMMas_Table.nt_qty, dbo.BOMMas_Table.Rate, 
                      dbo.BOMMas_Table.Amount,  dbo.BOMMas_Table.BOM_No, dbo.BOMMas_Table.LabourAmount, dbo.BOMMas_Table.BOM_name FROM dbo.BOMMas_Table INNER JOIN dbo.Item_table ON dbo.BOMMas_Table.Item_No = dbo.Item_table.Item_no INNER JOIN dbo.unit_table ON dbo.BOMMas_Table.Unit_No = dbo.unit_table.unit_no where BOMMas_Table.BOM_name=@itemName order by BOMMas_Table.BOM_No 
		End
		Else IF @ActionType='SelectBomLike'
		Begin
		select distinct (BOM_name) from BOMMas_Table where BOM_name Like RTRIM(LTRIM(@itemName+'%'))
		--Select * from Ledsel_table where Ledger_Type='2' and Ledsel_name=@itemName
		End
		Else IF @ActionType='Ledsel_tableSelectLike'
		Begin
		Select Ledsel_name from Ledsel_table where Ledger_Type='2' and Ledsel_name like RTRIM(LTRIM(@itemName+'%'))
		End
		Else IF @ActionType='BOmissuedisplay'
		Begin
		select distinct BOMissu_Table.BOM_no as [No],Convert(Varchar(10),BOMissu_Table.BOM_Date,111) as [Date],BOMMas_Table.BOM_name as [Bom Name],BOMissu_Table.Qty as [Issue Qty] from BOMissu_Table,BOMMas_Table where bomMas_table.BOM_No=BOMissu_Table.Bom_No
		End
		Else IF @ActionType='SelectLedType'
		Begin
		Select * from PurType_Table
		End
		Else IF @ActionType='SelectLedTypeNos'
	    Begin
	    Select * from PurType_Table where PurType_Name=(LTrim(RTrim(@itemName)))
	    End
	    Else IF @ActionType='Selectlikepurtype'
	    Begin
	    Select * from PurType_Table where PurType_Name Like @itemName+'%'
	    End
	    Else IF @ActionType='SedTypeNos'
	    Begin
	    Select * from PurType_Table where PurType_Name=(LTrim(RTrim(@itemName)))
	    End
	     Else IF @ActionType='UpdateImageItem'
	    Begin
	    Declare @ItemNo as varchar(20)
	    --Select @ItemNo=(Item_no) from item_table Where Item_name=@itemName
	    update Item_table set ItemPicture=@ItemCode where Item_no=(Select Item_no from item_table Where Item_name=@itemName)
	    End
	    Else IF @ActionType='COUNTERSETEL'
	    Begin
	    Select * from [ReceiptPrintSettings_table] where Counter=@itemName
	    End
	    Else IF @ActionType='BarcodePrintSelect'
	    Begin
	    select item_table.Item_name,Item_table.Item_code,Item_table.Item_Printname,Item_table.Item_ndp,Item_table.item_cost,Item_table.item_mrsp,Item_table.item_special1,unit_table.unit_name from Item_table,unit_table where  unit_table.unit_no=Item_table.Unit_no and  Item_No=(Select Item_no from BarCode_table where BarCode=@ItemCode)
	    End
	     Else IF @ActionType='BarcodePrintSelectName'
	    Begin
	    select item_table.Item_name,Item_table.Item_code,Item_table.Item_Printname,Item_table.Item_ndp,Item_table.item_cost,Item_table.item_mrsp,Item_table.item_special1,unit_table.unit_name from Item_table,unit_table where  unit_table.unit_no=Item_table.Unit_no and  Item_No=(Select Item_no from Item_table where Item_name=@itemName)
	    End
	    Else IF @ActionType='CheckItemcode'
	    Begin
	    select item_table.Item_name,Item_table.Item_code,Item_table.Item_Printname,Item_table.Item_ndp,Item_table.item_cost,Item_table.item_mrsp,Item_table.item_special1,unit_table.unit_name from Item_table,unit_table where  unit_table.unit_no=Item_table.Unit_no and Item_code=@ItemCode 
	    End
	     Else IF @ActionType='DuplicateFind'
	    Begin
	    select * from BOMMas_Table where BOM_name=@itemName
	    End

            Else IF @ActionType='LedgerGroupSelection'
	    Begin
	    Select Ledger_name from Ledger_table where Ledger_groupno='5'
	    End
	    Else IF @ActionType='DuplicateLedgerName'
	    Begin
			select * from CreditCard_Table where Card_Name=@itemName
	    End
	    Else IF @ActionType='SelectledgerLike'
	    Begin
		Select Ledger_name from Ledger_table where Ledger_name like @itemName+'%'
	    End
	    else IF @ActionType='BarcodeITemSearch'
	    Begin
	    select Item_no As item_no from Item_table where  item_name =@itemName or Item_no=(select Item_no from Item_seltable where Item_selname=@itemName)
	    End
	    Else if @ActionType ='BarcodeNoSearch'
	    Begin 
	    Select * from BarCode_table where BarCode=@itemName
	    End
	    
End

GO
CREATE PROCEDURE [dbo].[sp_SalesSummarySelectSingle](@tActionType varchar(400),@tValue varchar(400))
AS
BEGIN
IF @tActionType='COUNTER'
select ctr_no from counter_table where ctr_name=@tValue
IF @tActionType='COUNTERNAME'
Select ctr_name from counter_table where ctr_name like @tValue+'%'
IF @tActionType='LEDGERNAME'
Select Ledger_name from Ledger_table where Ledger_name like @tValue+'%'
IF @tActionType='USERNAME'
Select User_name from User_table where User_name like @tValue+'%'
END

GO

CREATE PROCEDURE [dbo].[sp_SalesSummaryDetail](@tActionType varchar(400),@tPartyName varchar(400),@tCounterName varchar(400),@tSalesType varchar(100),@tCashType varchar(100),@tDate date)
AS
SET NOCOUNT ON 
DECLARE @tLedgerNo varchar(100);
DECLARE @tCounterNo varchar(100);
DECLARE @tSalesTypeNo varchar(100);
DECLARE @tCashTypeNo varchar(100);
DECLARE @tQuery varchar(100);

BEGIN
IF @tPartyName<>'All'
select @tLedgerNo=Ledger_no from Ledger_table where Ledger_name=@tPartyName;
Else
SET @tLedgerNo='All';
if @tCounterName<>'All'
select @tCounterNo=ctr_no from counter_table where ctr_name=@tCounterName;
ELSE
SELECT @tCounterNo='All'
IF @tSalesType='Retail Sales'
SET @tSalesTypeNo='False';
IF @tSalesType='Whole Sales'
SET @tSalesTypeNo='True';
IF @tCashType='Cash'
SET @tCashTypeNo='True';
IF @tCashType='Credit'
SET @tCashTypeNo='0';

IF (@tSalesType='All') AND (@tCashType='All')
 BEGIN 
 SELECT @tQuery=(CASE WHEN @tLedgerNo='All' AND @tCounterNo='All' THEN 'STEP1'   
   WHEN @tLedgerNo<>'All' AND @tCounterNo='All' THEN 'STEP2'
   WHEN @tLedgerNo='All' AND @tCounterNo<>'All' THEN 'STEP3'
   ELSE 'STEP4' END)
END
IF (@tSalesType<>'All') AND (@tCashType='All')
BEGIN 
 SELECT @tQuery=(CASE WHEN @tLedgerNo='All' AND @tCounterNo='All' THEN 'STEP5'   
   WHEN @tLedgerNo<>'All' AND @tCounterNo='All' THEN 'STEP6'
   WHEN @tLedgerNo='All' AND @tCounterNo<>'All' THEN 'STEP7'
   ELSE 'STEP8' END)
END
IF (@tSalesType='All') AND (@tCashType<>'All')
BEGIN 
 SELECT @tQuery=(CASE WHEN @tLedgerNo='All' AND @tCounterNo='All' THEN 'STEP9'   
   WHEN @tLedgerNo<>'All' AND @tCounterNo='All' THEN 'STEP10'
   WHEN @tLedgerNo='All' AND @tCounterNo<>'All' THEN 'STEP11'
   ELSE 'STEP12' END)
END
IF (@tSalesType<>'All') AND ( @tCashType<>'All')
BEGIN 
 SELECT @tQuery=(CASE WHEN @tLedgerNo='All' AND @tCounterNo='All' THEN 'STEP13'   
   WHEN @tLedgerNo<>'All' AND @tCounterNo='All' THEN 'STEP14'
   WHEN @tLedgerNo='All' AND @tCounterNo<>'All' THEN 'STEP15'
   ELSE 'STEP16' END)
END

if @tQuery='STEP1'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and smas_billdate =@tDate
if @tQuery='STEP2'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and smas_billdate =@tDate
if @tQuery='STEP3'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and ctr_no=@tCounterNo and smas_billdate =@tDate
if @tQuery='STEP4'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and ctr_no=@tCounterNo and smas_billdate =@tDate 

if @tQuery='STEP5'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and smas_billdate =@tDate and smas_saltype=@tSalesTypeNo 
if @tQuery='STEP6'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and smas_billdate =@tDate and smas_saltype=@tSalesTypeNo 
if @tQuery='STEP7'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and ctr_no=@tCounterNo and smas_billdate =@tDate and smas_saltype=@tSalesTypeNo 
if @tQuery='STEP8'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and ctr_no=@tCounterNo and smas_billdate =@tDate and smas_saltype=@tSalesTypeNo 

if @tQuery='STEP9'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo 
if @tQuery='STEP10'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo 
if @tQuery='STEP11'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and ctr_no=@tCounterNo and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo 
if @tQuery='STEP12'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and ctr_no=@tCounterNo and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo 

if @tQuery='STEP13'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo and smas_saltype=@tSalesTypeNo 
if @tQuery='STEP14'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo and smas_saltype=@tSalesTypeNo 
if @tQuery='STEP15'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and ctr_no=@tCounterNo and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo and smas_saltype=@tSalesTypeNo 
if @tQuery='STEP16'
Select smas_billno as Bill_No,CONVERT(date,smas_billdate,103) as Bill_Date ,smas_name As Particulars, smas_name as Cash_Recd,(CASE WHEN @tActionType = 'GROSSAMT' THEN convert(numeric(18,2),smas_Gross) ELSE convert(numeric(18,2),smas_NetAmount) END) as Amount,(CASE WHEN smas_rtno=0 THEN 'NORETURN' ELSE 'RETURN' END) as Type from salmas_table where smas_Cancel<>1 and party_no=@tLedgerNo and ctr_no=@tCounterNo and smas_billdate =@tDate and smas_cashmode=@tCashTypeNo and smas_saltype=@tSalesTypeNo 


END

GO
CREATE PROCEDURE [dbo].[sp_SalesReturnAlteration]
(@tOldBillNo numeric(18,2),@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue5 Readonly,@tUserno numeric(18,0), @tCounter numeric(18,0),@ReturnDate date,@ReturnCounter varchar(100),@ReturnCash varchar(100),@ReturnRecieved numeric(18,4))
AS 
SET NOCOUNT ON 
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tReturnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tsmas_name varchar(100);
DECLARE @tSmas_cashmode varchar(100);
DECLARE @tSmas_cashmodeNew varchar(100);
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @tSalesVchNo NUMERIC(18,0)=0;
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tOldStrnSno Numeric(18,0)=0;
DECLARE @tDiscount NUMERIC(18,2)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2), @Id numeric(18,2);
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tCashMode NUMERIC(18,0);
DECLARE @tPartyNo NUMERIC(18,0);
DECLARE @tOldSoldQty NUMERIC(18,4);
DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Id FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Id FROM @tempTable
DECLARE @tNewOldStrnSno NUMERIC(18,0);
DECLARE @tCOunterNew varchar(100);
DECLARE @tTotTaxValue numeric(18,2)=0;
DECLARE @tNetSalRetAmt numeric(18,2)=0;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
select @tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt,@Id
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Rate*@Qty);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt,@Id
end
close c2
deallocate c2
	Set @Profit=0;
    set @Profit=@tTotItemRate-@tTotItemCost;
	SELECT @tReturnNo=smas_no,@tsmas_name=smas_name,@tSmas_cashmode=smas_name  from salmas_table where smas_billno=@tOldBillNo and smas_rtno<>0;
	select @tSalesVchNo=(count(*)+1) from salmas_table  where smas_rtno=@tReturnNo;
	Select @tBillNo=(count(*)+1) from SalMas_table where smas_rtno<>0;
	select @tCurrentDate=convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
	select @tCurrentTime=convert(time,GETDATE(),100); 
	select @tCOunterNew=ctr_no from counter_table where ctr_name=@ReturnCounter;
	if @tBillNo is null
	SET @tBillNo=1;
	if @tSmas_cashmode='Cash Sales'
	SET @tPartyNo=2	
	ELSE
	Select @tPartyNo=Ledger_no from Ledger_table where Ledger_name=@tSmas_cashmode
	   if @tCOunterNew is null
  set @tCounter=@tCounter
  else
  set @tCounter=@tCOunterNew
   if @tUserno is null
  set @tUserno=1
  DECLARE @tPartyNonew numeric(18,0)=2;

	
   update salmas_table set smas_billdate=@ReturnDate, smas_billtime=@tCurrentTime,ctr_no=@tCounter,smas_Gross=@tGrossAmt,smas_GrossAmount=@tNetAmt,smas_NetAmount=@tNetAmt,smas_rcvdamount=@ReturnRecieved, VoucherSno=@tVoucherNo, SalesVchNo=@tSalesVchNo, Profit=0, smas_paidAmt='0.00', smas_TotalCash='0.00' where smas_no=@tOldBillNo
    

open c
fetch from c into @ItemName,@Qty,@Rate,@Amt,@Id
while @@fetch_status=0
begin



  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName; 
  
  select @tNewOldStrnSno=strn_rtno from stktrn_table where item_no=@tItemNo and strn_no=@tOldBillNo and strn_rtno<>0 and strn_type=2;
  select @tOldStrnSno=strn_sno from stktrn_table where item_no=@tItemNo and strn_no=@tOldBillNo and strn_rtno<>0 and strn_type=2;
  
  DECLARE @tRemoveQty Numeric(18,4)=0;
  select @tRemoveQty=nt_qty from stktrn_table where strn_no=@tOldBillNo and strn_type=2 and strn_rtno<>0 and item_no=@tItemNo
  
  update stktrn_table set rnt_qty=rnt_qty-@tRemoveQty where strn_sno=@Id;
  update Item_Table set nt_salqty=nt_salqty+@tRemoveQty,nt_srtqty=nt_srtqty-@tRemoveQty,nt_cloqty=nt_cloqty-@tRemoveQty,Nt_Salval=@tNetSalAmt, Nt_SalRetval=@tNetSalRetAmt where Item_no=@tItemNo;
  
  delete from stktrn_table where strn_no=@tOldBillNo and strn_type=2 and strn_rtno<>0 and item_no=@tItemNo
  
    
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  SET @tTotTaxValue=@tTotTaxValue+@tTaxAmt;
  
  Update stktrn_table set rnt_qty=rnt_qty+@Qty where strn_sno=@Id;
  
  INSERT INTO stktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate) values
   (@tStrnSno,@tOldBillNo,@tNewOldStrnSno,'2', @ReturnDate,'0',@tPartyNo,'0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',(@Qty),'0','0','0','0','0','0','',@Rate,'0','0','0',(@Qty*@Rate),@tTaxNo,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0','0','0','0','0','0',((@Qty*@Rate)+@tTaxAmt),'0','0','0','0','0','0','0','0',((@Qty*@Rate)+@tTaxAmt),'0','0',' ','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
  update Numbertable set strnsno=strnsno+1;
  select @tNetSalAmt=sum(net_amt) from stktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from stktrn_table where item_no=@tItemNo and strn_type=2
  update Item_Table set nt_salqty=nt_salqty-@Qty,nt_srtqty=nt_srtqty+@Qty, nt_cloqty=nt_cloqty+@Qty,Nt_Salval=(@tNetSalAmt-@tNetSalRetAmt), Nt_SalRetval=@tNetSalRetAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt,@Id
  
  
end
close c
deallocate c
select * from Vch_table

delete from vch_table where ref_det=2 and ref_no=@tOldBillNo

Update NumberTable set SalRecv_Sno=SalRecv_Sno+1;

select @tSalesCount=(CASE WHEN max(vch_no)IS NULL THEN '1' ELSE max(vch_no)+1 END) from vch_table where ref_det=2

Select @tVchRefNo=(max(Ref_no)+1) from Vch_table
if @tVchRefNo is Null
Set @tVchRefNo=1;

if @tSmas_cashmode=1
SET @tCashMode=5
ELSE
Select @tCashMode=Ledger_no from Ledger_table where Ledger_name=@tSmas_cashmode

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11','5',@tLedgerNo1,'0',@tNetAmt,'','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

select @tDiscount=Amount from DiscountDetail_table where Bill_no=@tOldBillNo;




Set @tCHK=(@tNetAmt)-(@tGrossAmt+@tTotTaxValue);
if(@tCHK<0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK>0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from stktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11',@tLedgerNo1,'5',@tSingleTaxAmt,'0','','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11',@tLedgerNo1New,'5',@tSingleTaxAmtNew,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1 
  
   Update Numbertable set VoucherNo=VoucherNo+3;
   
	IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO

CREATE PROCEDURE [dbo].[sp_SalesReturn]
(@tOldBillNo numeric(18,2),@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue5 Readonly,@tUserno numeric(18,0), @tCounter numeric(18,0))
AS 
SET NOCOUNT ON 
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tReturnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tsmas_name varchar(100);
DECLARE @tSmas_cashmode varchar(100);
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @tSalesVchNo NUMERIC(18,0)=0;
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tOldStrnSno Numeric(18,0)=0;
DECLARE @tDiscount NUMERIC(18,2)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Id numeric(18,0);
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tCashMode NUMERIC(18,0);
DECLARE @tPartyNo NUMERIC(18,0);
DECLARE @tOldSoldQty NUMERIC(18,4);
DECLARE @tSmas_cashmodeNew Varchar(50);

DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Id FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Id FROM @tempTable
DECLARE @tTotTaxValue numeric(18,2)=0;
DECLARE @tNetSalRetAmt numeric(18,2)=0;
Declare @tRprop varchar(100)='NoTax';

Declare @tLabourCommiLedger numeric(18,0)=0;
Declare @tCommissionPercent Numeric(18,2)=0;
Declare @tCommissionAmt numeric(18,2)=0.00;
Select @tLabourCommiLedger=(case when LabourCommiLedger is null then 0 Else LabourCommiLedger End) from Control_table

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
select @tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt,@Id
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Rate*@Qty);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt,@Id
end
close c2
deallocate c2
	Set @Profit=0;
    set @Profit=@tTotItemRate-@tTotItemCost;
	SELECT @tReturnNo=smas_no,@tsmas_name=smas_name,@tSmas_cashmode=smas_name from salmas_table where smas_billno=@tOldBillNo and smas_rtno=0;
	select @tSalesVchNo=(count(*)+1) from salmas_table  where smas_rtno=@tReturnNo;
	Select @tBillNo=(count(*)+1) from SalMas_table where smas_rtno<>0;
	select @tCurrentDate=convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
	select @tCurrentTime=convert(time,GETDATE(),100); 
	if @tBillNo is null
	SET @tBillNo=1;
	if @tSmas_cashmode='Cash Sales'
	Begin
	Set @tSmas_cashmodeNew='1'
	SET @tPartyNo=2
	End
	ELSE
	Begin
	set @tSmas_cashmodeNew='0'
	Select @tPartyNo=Ledger_no from Ledger_table where Ledger_name=@tSmas_cashmode
	End
   if @tCounter is null
  set @tCounter=1
   if @tUserno is null
  set @tUserno=1
	Insert into SalMas_Table (smas_no,smas_slno,smas_rtno,smas_billprefix,smas_billsuffix,smas_billno,Smas_Bill,smas_billdate,smas_billtime,smas_days,Mechanic_no,MechCommi_Amt,MechCommi_Per,SmanCommi_Amt,SManCommi_Per,MechCommiTax_Per,Smas_SmanNo,dc_no,dc_date,order_no,reference_date,reference_no,Vehicle_no,Smas_Others1,Smas_others2,smas_others3,smas_others4,UserNo,ctr_no,Godown_no,party_no,Customer_no,smas_name,smas_add1,smas_add2,smas_add3,smas_add4,smas_add5,smas_st,smas_cst,smas_cashmode,Smas_salmode,smas_saltype,smas_ordertype,smas_addled1,smas_addled2,smas_addled3,smas_addled4,smas_adddet1,smas_adddet2,smas_adddet3,smas_adddet4,smas_adddisc1,smas_adddisc2,smas_adddisc3,smas_adddisc4,smas_adddiscr1,smas_adddiscr2,smas_adddiscr3,smas_adddiscr4,smas_addamt1,smas_addamt2,smas_addamt3,smas_addamt4,smas_Gross,smas_GrossAmount,BankCharge,smas_NetAmount,smas_rcvdamount,smas_remarks,smas_Cancel,smas_cremark,smas_rounded,CashReceived,Profit,Update_Flag,Tax_Refund,Print_no,smas_point,smas_issue,smas_paidAmt,smas_Touch,smas_TotalCash,smas_TotalCredit,smas_TotalNets,Loaditem,Smas_columns,VoucherSno,SalesVchNo,ReceiptVchNo,CrNoteVchNo,CardSno,CardNo) values 
	(@tStrnNo,'0',@tReturnNo,'','',@tBillNo,@tBillNo,@tCurrentDate,@tCurrentTime,'0','1','0','0','0','0','0','0','0','1999-01-01','','','','','','','','',@tUserno,@tCounter,'2',@tPartyNo,'0',@tsmas_name,'','','','','','','',@tSmas_cashmodeNew,'1','0','0','0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0',@tGrossAmt,@tGrossAmt,'0',@tNetAmt,@tNetAmt,'','0','',@RoundValue,'0','0','0','0','0','0','0','0','True','0','0','0','0','',@tVoucherNo,@tSalesVchNo,'0','0','0','')
   
    Select @tStrnNo=(max(strnno)+1) from Numbertable

open c
fetch from c into @ItemName,@Qty,@Rate,@Amt,@Id
while @@fetch_status=0
begin
  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName;
  
  select @tOldStrnSno=strn_sno,@tOldSoldQty=(nt_qty-rnt_qty) from stktrn_table where item_no=@tItemNo and strn_sno=@Id;
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;
  Set @tTaxAmt=(((@tOldSoldQty-@Qty)*@Rate)*(@tTaxPercent/100));
  SET @tTotTaxValue=@tTotTaxValue+@tTaxAmt;
  
   if @tLabourCommiLedger<>0
  begin
  Select @tCommissionPercent=(case when Commission is null then 0 else commission end) from Item_GroupTable where Item_groupno=(Select Item_groupno from Item_table where Item_no=@tItemNo)
  set @tCommissionAmt=((@Qty*@Rate)*@tCommissionPercent)/100;
  end
  
  Select @tRprop=Rprop from Rptset where Rdesc='Display Tax Type'
  if @tRprop='Exclusive'
  begin
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  End
  if @tRprop='Inclusive'
  begin
  Set @tTaxAmt=(@Qty*@Rate)- (((@Qty*@Rate)*100)/(100+@tTaxPercent));
  end
  if @tRprop='NoTax'
  begin
  Set @tTaxAmt=0
  set @tTaxNo=1
  set @tTaxPercent=0
  SET @tTotTaxValue=0
  end
  Update stktrn_table set rnt_qty=rnt_qty+(@tOldSoldQty-@Qty) where strn_sno=@Id and item_no=@tItemNo and strn_rtno=0 and strn_type=1;
  INSERT INTO stktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate) values
   (@tStrnSno,@tStrnNo,@tOldStrnSno,'2', @tCurrentDate,'0',@tPartyNo,'0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',(@tOldSoldQty-@Qty),'0','0','0','0','0','0','',@Rate,'0','0','0',((@tOldSoldQty-@Qty)*@Rate),@tTaxNo,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0',@tCommissionPercent,@tCommissionAmt,'0','0','0',(Case when @tRprop='Inclusive' then (((@tOldSoldQty-@Qty)*@Rate)) Else  (((@tOldSoldQty-@Qty)*@Rate)+@tTaxAmt) End),'0','0','0','0','0','0','0','0',(Case when @tRprop='Inclusive' then (((@tOldSoldQty-@Qty)*@Rate)) Else  (((@tOldSoldQty-@Qty)*@Rate)+@tTaxAmt) End),'0','0',@tRprop,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0');
  update Numbertable set strnsno=strnsno+1;
  select @tNetSalAmt=sum(net_amt) from stktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from stktrn_table where item_no=@tItemNo and strn_type=2
  update Item_Table set nt_salqty=nt_salqty-(@tOldSoldQty-@Qty),nt_srtqty=nt_srtqty+(@tOldSoldQty-@Qty), nt_cloqty=nt_cloqty+(@tOldSoldQty-@Qty),Nt_Salval=(@tNetSalAmt-@tNetSalRetAmt), Nt_SalRetval=@tNetSalRetAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt,@Id
end
close c
deallocate c
DECLARE @tGrossNew numeric(18,2)=0;
DECLARE @tNetAmtNew numeric(18,2)=0;
select @tGrossNew=SUM(Amount),@tNetAmtNew=SUM(Net_Amt) from stktrn_table where strn_no=@tStrnNo
Set @tCHK=(@tNetAmtNew)-(@tGrossNew+@tTotTaxValue);

update salmas_table set smas_Gross=@tGrossNew,smas_GrossAmount=@tGrossNew,smas_NetAmount=(@tNetAmtNew), smas_rcvdamount='0' where smas_no=@tStrnNo;
Update NumberTable set strnno=strnno+1;

select @tSalesCount=(CASE WHEN max(vch_no)IS NULL THEN '1' ELSE max(vch_no)+1 END) from vch_table where ref_det=2

Select @tVchRefNo=(max(Ref_no)+1) from Vch_table
if @tVchRefNo is Null
Set @tVchRefNo=1;

if @tSmas_cashmode='Cash Sales'
SET @tCashMode=5
ELSE
Select @tCashMode=Ledger_no from Ledger_table where Ledger_name=@tSmas_cashmode

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11','5',@tLedgerNo1,'0',@tNetAmtNew,'','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

select @tDiscount=Amount from DiscountDetail_table where Bill_no=@tOldBillNo;




Set @tCHK=(@tNetAmtNew)-(@tGrossNew+@tTotTaxValue);
if(@tCHK>0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK<0)
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from stktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11',@tLedgerNo1,'5',@tSingleTaxAmt,'0','','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into Vch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tCashMode,@tVchRefNo,'2',@tCurrentDate,'11',@tLedgerNo1New,'5',@tSingleTaxAmtNew,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1 
  
   Update Numbertable set VoucherNo=VoucherNo+3;
   
	IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_SalesGroupItemPrevious]( @tclickCountGroupItem numeric(18,2),@tbtnGroupItem1 varchar(300))
AS
DECLARE @ttempGroupNo VARCHAR(200);
DECLARE @ttempGroupColor VARCHAR(200);
DECLARE @ttempFontColor VARCHAR(200);
DECLARE @tItem_groupNo VARCHAR(200);
DECLARE @tGroup_Color VARCHAR(200)='DarkBlue';
DECLARE @tFont_Color VARCHAR(200)='White';
DECLARE @tNextRecords NUMERIC(18,0)=0;

DECLARE C1 CURSOR LOCAL READ_ONLY FOR select Item_groupNo,Group_Color,Font_Color from Item_GroupTable where item_groupname=@tbtnGroupItem1;
BEGIN
OPEN C1
FETCH FROM C1 INTO @ttempGroupNo,@tGroup_Color,@tFont_Color
while @@fetch_status=0
BEGIN
SET @ttempGroupColor='DarkBlue';
SET @ttempFontColor='White';
IF @tGroup_Color IS NOT NULL
SET @ttempGroupColor=@tGroup_Color;
IF @tFont_Color IS NOT NULL
FETCH NEXT FROM C1 INTO @ttempGroupNo,@tGroup_Color,@tFont_Color
END

SET @ttempFontColor=@tFont_Color;
SET @tclickCountGroupItem=@tclickCountGroupItem-1;
SET @tNextRecords=@tclickCountGroupItem*27;
IF @tclickCountGroupItem = 1
SET @tNextRecords=0;     

DECLARE @tStr VARCHAR(200)='Select Top @tNextRecords Item_no from Item_Table where item_groupNo=@ttempGroupNo order by Item_no ASC'
if @tclickCountGroupItem > 0
select Top 27 * from Item_Table where Item_name not in (Select Top(cast(@tNextRecords as int)) Item_name from Item_Table where item_groupNo=@ttempGroupNo order by Item_name ASC) and item_groupNo=@ttempGroupNo order by Item_name ASC                
                        
END

EXECUTE sp_SalesGroupItemPrevious 2,'New Item'

GO
CREATE Procedure [dbo].[SPPruchaseSalesDatewiseProfit](@RptType as varchar(20),@DatesType as Varchar(20),@startDate datetime,@endDate datetime)
As 
Begin
SET NOCOUNT ON 
if @RptType='PurRpt'
    Begin  
				select distinct item_table.Item_code As ItemCode,item_table.Item_name As ItemName,sum(nt_qty) As PurQty,Convert(numeric(18,2),Avg(stktrn_table.Rate)) As PurRate,Convert(Numeric(18,2),(Sum(stktrn_table.nt_qty)*(Avg(stktrn_table.Rate))))As TotalPur,'0.00' As SalesQty,'0.00' As SalesRate,'0.00' As SalesTot,sum(nt_qty) As TotalStock from stktrn_table,item_table where stktrn_table.item_no=item_table.item_no and (stktrn_table.strn_type=0 or stktrn_table.strn_type=3) and stktrn_table.strn_date between @startDate and @endDate group by stktrn_table.item_no,item_table.Item_code,item_table.Item_name order by item_name ASC 	    
    End		  
if Ltrim(@RptType)<>'PurRpt'
		Begin
		 
			select distinct item_table.Item_code As ItemCode,item_table.Item_name As ItemName,'0.00' As PurQty,'0.00' As PurRate,'0.00' As TotalPur,sum(nt_qty) As SalesQty,Convert(numeric(18,2),Avg(stktrn_table.Rate)) As SalesRate,Convert(numeric(18,2),(Sum(stktrn_table.nt_qty)*(Avg(stktrn_table.Rate)))) As SalesTot,sum(nt_qty) As TotalStock from stktrn_table,item_table where item_table.item_no=stktrn_table.item_no and   stktrn_table.strn_type=1 and strn_rtno<>1 and Strn_Cancel<>1 and  stktrn_table.strn_date between @startDate and @endDate group by stktrn_table.item_no,item_table.Item_code,item_table.Item_name order by item_name ASC 
			
   			End 	   
End

GO
CREATE PROCEDURE [dbo].[sp_Void](@tBillNo varchar(100),@tReason varchar(400))
AS
SET NOCOUNT ON 
DECLARE @tSmas_no numeric(18,0);
DECLARE @tItemNo NUMERIC(18,0);
DECLARE @tItemQty NUMERIC(18,4);
DECLARE @tNetAmt NUMERIC(18,2);
BEGIN
UPDATE salmas_table set smas_Cancel='True',smas_cremark=@tReason where smas_billno=@tBillNo and smas_rtno=0;
UPDATE stktrn_table set Strn_Cancel='True' where strn_no=(select smas_no from salmas_table where smas_billno=@tBillNo and smas_rtno=0);
UPDATE Vch_table set Vch_Cancel='True' where Vch_Sno=(select VoucherSno from salmas_table where smas_billno=@tBillNo and smas_rtno=0);
DECLARE c1 CURSOR LOCAL READ_ONLY FOR SELECT smas_no FROM salMas_table where smas_billno=@tBillNo and Smas_rtno=0;
open c1
fetch from c1 into @tSmas_no
while @@fetch_status=0
begin
  DECLARE c2 CURSOR LOCAL READ_ONLY FOR Select item_no,nt_qty,Net_Amt from stktrn_table where strn_no=@tSmas_no;    
  open c2
  fetch from c2 into @tItemNo,@tItemQty,@tNetAmt
  WHILE @@FETCH_STATUS=0
  begin
    UPDATE Item_table set nt_salqty=nt_salqty-@tItemQty, nt_cloqty=nt_cloqty+@tItemQty, Nt_Salval=Nt_Salval-@tNetAmt where Item_no=@tItemNo;
    fetch from c2 into @tItemNo,@tItemQty,@tNetAmt
    end
    close c2
    deallocate c2
    fetch next from c1 into @tSmas_no
end
close c1
deallocate c1
END
GO

CREATE PROCEDURE [dbo].[sp_SettleDiscount](@tDiscount NUMERIC(18,2),@tGrossAmt numeric(18,2))
  AS
  BEGIN  
  DECLARE @tDiscountId numeric(18,0);
  DECLARE @tCurrentDate Datetime;
  DECLARE @tBillNo NUMERIC(18,0);
  select @tDiscountId=(MAX(DiscountEntry_Id)+1) from NumberTable;
   Select @tBillNo=(count(*)+1) from SalMas_table where smas_rtno=0;
  select @tCurrentDate=DATEADD(day,1,EndOfDay) from EndOFday_Table where Id=(select EndOfDayId from NumberTable);
  INSERT INTO [dbo].[DiscountDetail_table]([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) VALUES
           (@tDiscountId,'Amount',@tCurrentDate,@tBillNo,@tDiscount,@tGrossAmt);
  Update Numbertable set DiscountEntry_Id=DiscountEntry_Id+1;      
  END

GO
CREATE PROCEDURE [dbo].[sp_User_Insert]
(
@tUserName as varchar(200),
@tUserType as varchar(100),
@tPassword as varchar(200),
@tCounter as VARCHAR(100),
@tDiscountRange as numeric(18,2),
@tResettle as varchar(50),
@tStopAtQty as varchar(50),@tStopAtRate as varchar(50),
@tAllowVoid as varchar(50),
@tAllowReturn as varchar(50),@tViewReport varchar(50),@LSystemName Varchar(Max))
as
DECLARE @TranCounter INT;
DECLARE @Uno varchar(200);
DECLARE @UNameUpper varchar(200);
DECLARE @vUserType int;
DECLARE @tCounterNo int;

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
  Select @Uno=max(User_No)+1 from Numbertable
      
      if @tUserType='Admin'
      begin
      set @vUserType=0
      end
      else if @tUserType='User'
      begin
      set @vUserType=1
      end
  set @UNameUpper=UPPER(@tUserName)
  Select @tCounterNo=Ctr_no from counter_table where ctr_name=@tCounter;
  BEGIN
    
  Begin
    INSERT INTO User_table(User_no,User_name,User_type,User_mtname,User_Pass,Alter_Days,Print_Bills,Ctr_no,DiscountRange,Resettle,StopatQty,StopatRate,AllowVoid,AllowReturn,ViewReport,LSystemName) 
    VALUES(@Uno ,@tUserName ,@vUserType,@UNameUpper,@tPassword ,'0','False',@tCounterNo,@tDiscountRange,@tResettle,@tStopAtQty,@tStopAtRate,@tAllowVoid,@tAllowReturn,@tViewReport,@LSystemName);
  End
 
END  
   update NumberTable set User_No=User_No+1  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO
CREATE Procedure [dbo].[sp_updateFirstEndOfday] (@tUserno Numeric(18,0),@tCounter numeric(18,0))
AS
DECLARE @tEndOfDayId numeric(18,0);
DECLARE @tCount numeric(18,0);
BEGIN
Select @tEndOfDayId=max(EndOfDayId)+1 from NumberTable
Select @tCount=count(*) from EndOfDay_Table where BeginCashDrawId is null
if @tCount=0 OR @tCount is Null
begin
if @tEndOfDayId=0
BEGIN
insert into EndOFDay_table (Id,EndOfDay,Coin_P05,Coin_P10,Coin_P20,Coin_P50,Coin_1,Coin_2,Coin_5,Coin_10,Coin_20,Coin_50,Coin_100,Coin_1000,Coin_P05amt,Coin_P10amt,Coin_P20amt,Coin_P50amt,Coin_1amt,Coin_2amt,Coin_5amt,Coin_10amt,Coin_20amt,Coin_50amt,Coin_100amt,Coin_1000amt,CoinTotCount,CoinTotAmt,Status,User_no,Ctr_no) values
('1',DATEADD(DAY,-1,getdate()),'0','0','0','0','0','0','0','0','0','0','0','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','Match',@tUserno,@tCounter)
UPDATE NumberTable set EndOfDayId=EndOfDayId+1;
END
ELSE
BEGIN
insert into EndOFDay_table (Id,EndOfDay,Coin_P05,Coin_P10,Coin_P20,Coin_P50,Coin_1,Coin_2,Coin_5,Coin_10,Coin_20,Coin_50,Coin_100,Coin_1000,Coin_P05amt,Coin_P10amt,Coin_P20amt,Coin_P50amt,Coin_1amt,Coin_2amt,Coin_5amt,Coin_10amt,Coin_20amt,Coin_50amt,Coin_100amt,Coin_1000amt,CoinTotCount,CoinTotAmt,Status,User_no,Ctr_no) values
(@tEndOfDayId,DATEADD(DAY,-1,getdate()),'0','0','0','0','0','0','0','0','0','0','0','0','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0.00','0','0.00','Match',@tUserno,@tCounter)
UPDATE NumberTable set EndOfDayId=EndOfDayId+1;
END
END
INSERT INTO BeginCashDrawerActive_table (Active,User_no,Ctr_no,EndOfDayDate) values (1,@tUserno,@tCounter,getdate());

END


GO

CREATE PROCEDURE [dbo].[sp_Unit_Update]
(
@unit_name as varchar(200),
@unit_mtname as varchar(200),
@unit_Decimals as varchar(200),
@unit_Name2 as varchar(200),
@tWeightScale as bit
)
as
DECLARE @TranCounter INT;
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
 UPDATE DBO.unit_table SET unit_name=@unit_name,unit_mtname= @unit_mtname,WeightScale=@tWeightScale,unit_Decimals =@unit_Decimals WHERE unit_name=@unit_Name2  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_Unit_Insert]
(

@tunit_name as varchar(200),
@tudecimal as float,
@tWeightScale as bit,
@chk as bit OUT
)
as
DECLARE @TranCounter INT;
DECLARE @uno varchar(200);
DECLARE @udec float;
DECLARE @UNameUpper varchar(200)
SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
  select @uno=max(UnitID)+1 from Numbertable
  
  set @UNameUpper=UPPER(@tunit_name)
  
  IF @tudecimal<>0
  BEGIN
  set @udec=@tudecimal
  END
  ELSE
  set @udec=0
  
  BEGIN
  IF NOT EXISTS(Select * from unit_table where unit_name=@tunit_name)
  
  BEGIN
   INSERT INTO DBO.unit_table(unit_no,unit_name,unit_printname,unit_mtname,unit_alias,unit_flag,WeightScale,unit_Decimals) 
  VALUES(@uno ,@tunit_name ,@UNameUpper,@UNameUpper ,'0','0',@tWeightScale,@udec);
  set @chk=0
  
  END
  
  ELSE
 set @chk=1
  END
  
  update NumberTable set UnitId=UnitId+1  
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_StockAdjCreate]
(
@tCtr_name varchar(200),
@tLedger_name varchar(200),
@temp_Table type_StockAdjCreate READONLY,
@tAdjNO INT,
@tDate DATETIME,
@tInnNo INT,
@tDt_inv DATETIME

)
as
DECLARE @TranCounter INT;
DECLARE @vCtr_no INT;
DECLARE @vLedger_no INT;
DECLARE @vCtr_no2 INT;
DECLARE @vStrnSno INT;
DECLARE @ItemCode varchar(100),@ItemName varchar(100),@Unit varchar(100),@LessQty numeric(18,2),@AddQty numeric(18,2),@Rate numeric(18,2),@Amount numeric(18,2);
DECLARE @vItemNo INT;
DECLARE @vTaxNo INT;
DECLARE @vNt_percent numeric(18,2);
DECLARE @vTaxValue numeric(18,2);
DECLARE @vUnitNo varchar(100);
DECLARE @vAmount numeric(18,2);
DECLARE c1 CURSOR LOCAL READ_ONLY FOR SELECT ItemCode,ItemName,unit,LessQty,AddQty,Rate,Amount FROM @temp_Table 

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
  select @vCtr_no=ctr_no from counter_table where ctr_name=@tCtr_name
  select @vLedger_no=Ledger_no from Ledger_table where Ledger_name=@tLedger_name
  select @vCtr_no2=ctr_no from counter_table where ctr_name=@tCtr_name
  
  open c1
  fetch from c1 into @ItemCode,@ItemName,@Unit,@LessQty,@AddQty,@Rate,@Amount
  while @@FETCH_STATUS=0
  begin 
   IF (@ItemCode<>'' or @ItemName<>'')
   BEGIN
     IF (@AddQty<>'0' or @LessQty<>'0')
     BEGIN
       select @vStrnSno=Max(StrnSno)+1 from NumberTable
       Update NumberTable set StrnSno=StrnSno + 1
	   select @vItemNo=Item_no from Item_table where Item_name=@ItemName
       select @vTaxNo=Tax_no from Item_table where Item_name=@ItemName
       select @vNt_percent=Nt_percent from Tax_table where Tax_no=@vTaxNo
  
       if @vNt_percent<>0
       begin
          set @vTaxValue=@vNt_percent
       end
       else
       begin
          set @vTaxValue=0
       end 
  
     select @vUnitNo=Unit_no from Item_table where Item_name=@ItemName
     set @vAmount=@Rate*@vTaxValue/100;
  
     IF @AddQty='0' and @LessQty<>0
     BEGIN
        INSERT INTO stktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,InvoiceNo,InvoiceDate)
                    VALUES(@vStrnSno,@tAdjNO,'0','11',@tDate,'0',@vLedger_no,'0','0','0',@vItemNo,@vCtr_no2,'2',@vUnitNo,'1','0',@LessQty,'0','0','0','0','0','0',@Rate,'0','0','0',@Amount,@vTaxNo,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',0,'0','0','0','0','0','0','0','0','0',@Amount,'0','0','0','0','0','0','0','0',@Amount,'0','0','',0,0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tInnNo,@tDt_inv)
	               
     END
  
  IF @LessQty='0' and @AddQty<>0
  begin
  INSERT INTO stktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,InvoiceNo,InvoiceDate)
                    VALUES(@vStrnSno,@tAdjNO,'0','12',@tDate,'0',@vLedger_no,'0','0','0',@vItemNo,@vCtr_no2,'2',@vUnitNo,'1','0',@AddQty,'0','0','0','0','0','0',@Rate,'0','0','0',@Amount,@vTaxNo,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',0,'0','0','0','0','0','0','0','0','0',@Amount,'0','0','0','0','0','0','0','0',@Amount,'0','0','',0,0,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tInnNo,@tDt_inv)
 
  end
  END
  END
  fetch next from c1 into @ItemCode,@ItemName,@Unit,@LessQty,@AddQty,@Rate,@Amount
  end
  close c1
  deallocate c1
  
   IF @TranCounter = 0          
      COMMIT TRANSACTION;
   END TRY
  
   BEGIN CATCH
   IF @TranCounter = 0        
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1       
         ROLLBACK TRANSACTION ProcedureSave;       
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;
 
      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();
 
      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_SettleNETSProcess1]
(@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tDiscount numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue Readonly,@DiscountType varchar(100),@tTxtAmount numeric(18,2),@tUserno numeric(18,0), @tCounter numeric(18,0),@tempFreeItem dtSingleFreeSales Readonly,@dt_gridload1 sp_funBtnDolorAlterTable  READONLY)
as
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Disc Numeric(18,2);
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tNetSalRetAmt NUMERIC(18,2);
DECLARE @tOpenItem varchar(50);
DECLARE @tOpenItemCount Numeric(18,0);
DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable

	Declare @tItemNameFree varchar(400);
	Declare @tQtyFree numeric(18, 4);
	Declare @tScannedQtyFree varchar(100);
	Declare @tMainItemNameFree varchar(400);
	Declare @tOfferNameFree varchar(400);
	Declare @tOfferFreeQtyFree numeric(18, 2);
	Declare @tTotSaleQtyFree numeric(18, 2);
	DECLARE c3 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,ScannedQty,MainItemName,OfferName,OfferFreeQty,TotSaleQty FROM @tempFreeItem
	DECLARE c7 CURSOR LOCAL READ_ONLY FOR SELECT Type1,RemaininbillAmt,ReceiverAmt,Types2 from @dt_gridload1 
declare @Type1 varchar(200),@RecRemBillAmt numeric(18,2),@RecAmt numeric(18,2),@Types2 as varchar(200);



SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt, @Disc
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Amt);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c2
deallocate c2

  
   if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
  Set @Profit=0;
   set @Profit=@tTotItemRate-@tTotItemCost;
   select @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
   
  
  if @tBillNo is Null
 Set @tBillNo=1
   
    open c7
  fetch from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  while @@FETCH_STATUS=0
  Begin
  
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,@Type1,@RecRemBillAmt,@RecAmt,'0')
   set @tSalRecv_Sno=@tSalRecv_Sno+1
   fetch Next from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  End
  close c7
  deallocate c7
  Update NumberTable set SalRecv_Sno=@tSalRecv_Sno;
   select @tCurrentDate=CONVERT(DATE,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
   select @tCurrentTime=convert(time,GETDATE(),100); 
      if @tCounter is null
  set @tCounter=1
   if @tUserno is null
  set @tUserno=1
   Insert into Tempsalmas_table (smas_no,smas_slno,smas_rtno,smas_billprefix,smas_billsuffix,smas_billno,Smas_Bill,smas_billdate,smas_billtime,smas_days,Mechanic_no,MechCommi_Amt,MechCommi_Per,SmanCommi_Amt,SManCommi_Per,MechCommiTax_Per,Smas_SmanNo,dc_no,dc_date,order_no,reference_date,reference_no,Vehicle_no,Smas_Others1,Smas_others2,smas_others3,smas_others4,UserNo,ctr_no,Godown_no,party_no,Customer_no,smas_name,smas_add1,smas_add2,smas_add3,smas_add4,smas_add5,smas_st,smas_cst,smas_cashmode,Smas_salmode,smas_saltype,smas_ordertype,smas_addled1,smas_addled2,smas_addled3,smas_addled4,smas_adddet1,smas_adddet2,smas_adddet3,smas_adddet4,smas_adddisc1,smas_adddisc2,smas_adddisc3,smas_adddisc4,smas_adddiscr1,smas_adddiscr2,smas_adddiscr3,smas_adddiscr4,smas_addamt1,smas_addamt2,smas_addamt3,smas_addamt4,smas_Gross,smas_GrossAmount,BankCharge,smas_NetAmount,smas_rcvdamount,smas_remarks,smas_Cancel,smas_cremark,smas_rounded,CashReceived,Profit,Update_Flag,Tax_Refund,Print_no,smas_point,smas_issue,smas_paidAmt,smas_Touch,smas_TotalCash,smas_TotalCredit,smas_TotalNets,Loaditem,Smas_columns,VoucherSno,SalesVchNo,ReceiptVchNo,CrNoteVchNo,CardSno,CardNo) values 
   (@tStrnNo,'0','0','','',@tBillNo,@tBillNo,@tCurrentDate,@tCurrentTime,'0','1','0','0','0','0','0','0','0','1999-01-01','','','','','','','','',@tUserno,@tCounter,'2','14','0','NETS','','','','','','','','0','0','0','0','0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0',@tGrossAmt,@tGrossAmt,'0',@tNetAmt,@tNetAmt,'','0','',@RoundValue,'0',@Profit,'0','0','0','0','1',@tNetAmt,'True','0','0',@tNetAmt,'0','',@tVoucherNo,@tBillNo,'0','0','0','')
   
   
   
 Select @tStrnNo=(max(strnno)+1) from Numbertable
Declare @tFreeSno Numeric(18,2)=0;
Declare @tCtl_FreeQty  bit=0;
Declare @tRprop varchar(100)='NoTax';
Declare @tLabourCommiLedger numeric(18,0)=0;
Declare @tCommissionPercent Numeric(18,2)=0;
Declare @tCommissionAmt numeric(18,2)=0.00;
Select @tLabourCommiLedger=(case when LabourCommiLedger is null then 0 Else LabourCommiLedger End) from Control_table

open c
fetch from c into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName;
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  
   if @tLabourCommiLedger<>0
  begin
  Select @tCommissionPercent=(case when Commission is null then 0 else commission end) from Item_GroupTable where Item_groupno=(Select Item_groupno from Item_table where Item_no=@tItemNo)
  set @tCommissionAmt=((@Qty*@Rate)*@tCommissionPercent)/100;
  end
  Select @tRprop=Rprop from Rptset where Rdesc='Display Tax Type'
  if @tRprop='Exclusive'
  begin
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  End
  if @tRprop='Inclusive'
  begin
  Set @tTaxAmt=(@Qty*@Rate)- (((@Qty*@Rate)*100)/(100+@tTaxPercent));
  end
  if @tRprop='NoTax'
  begin
  Set @tTaxAmt=0
  set @tTaxNo=1
  set @tTaxPercent=0
  end
     --Free Item Code Start
  Select @tCtl_FreeQty= Ctl_FreeQty from Control_table
  if @tCtl_FreeQty=1
  begin 
  if Exists (Select * from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  End
  Else  
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType<>'Item Price' and Item_Name=@ItemName)
  End
  if  @tFreeSno is null
  set @tFreeSno=0
  End
  -- Free Item Code End
  
  Select @tItemNo=Item_no,@tItemCost=Item_cost,@tOpenItem=OpenItem from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=(@tItemCost*@Qty);
    Set @tTotItemRate=(@Amt);  
    if @tOpenItem='True'
  select @tOpenItemCount=COUNT(*) from Tempstktrn_table where item_no=(select item_no from Item_table where Item_name=@ItemName) and strn_no=@tStrnNo  
  ELSE
  set @tOpenItemCount=0    
    
  INSERT INTO Tempstktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,OpenItem,OpenItemCount) values
   (@tStrnSno,@tStrnNo,'0','1', @tCurrentDate,'0','14','0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',@Qty,'0','0','0','0','0','0','',@Rate,'0','0','0',@Amt,@tTaxNo,'0','0',@Disc,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0',@tCommissionPercent,@tCommissionAmt,'0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0','0','0','0','0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0',@tRprop,'0','0','0','0','0','0','0','0','0','0','0','0',@tFreeSno,(@tTotItemRate-@tTotItemCost),'0','0','0',@tOpenItem,@tOpenItemCount);
  update Numbertable set strnsno=strnsno+1;
   select @tNetSalAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=2
    if @tNetSalAmt is null
  set @tNetSalAmt=0;
  if @tNetSalRetAmt is null
  set @tNetSalRetAmt=0;
  update Item_Table set nt_salqty=nt_salqty+@Qty,nt_cloqty=nt_cloqty-@Qty,Nt_Salval=(@tNetSalAmt-@tNetSalAmt),Nt_SalRetval=@tNetSalAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c
deallocate c
Update NumberTable set strnno=strnno+1;

Select @tSalesCount=(Max(Vch_BillNo)) from VoucherNo_table where Vch_type='10'


if exists (Select * from TempVch_table)
Select @tVchRefNo=(max(Ref_no)+1) from TempVch_table
else
Select @tVchRefNo=(max(Ref_no)+1) from Vch_table

if @tVchRefNo is Null
Set @tVchRefNo=1;

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK>0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from Tempstktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1

--Free Item Code Start   
open c3
Declare @tFreeItemNo numeric(18,0);
Declare @tFreeMainItemNo numeric(18,0);
Declare @tFreeOfferNo numeric(18,0);
fetch from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
while @@fetch_status=0
begin
Select @tFreeItemNo=Item_no from Item_table where Item_name=@tItemNameFree
Select @tFreeMainItemNo=Item_no from Item_table where Item_name=@tMainItemNameFree
select @tFreeOfferNo=FreeSno from FreeItemMaster_table where OfferName=@tOfferNameFree
INSERT INTO [dbo].[SalFreeItemDetail_table]([smas_no] ,[smas_billno],[FreeItem_no],[TotFreeQty],[TotScannedQty],[MainItem_no],[OfferNo],[OfferFreeQty],[TotSaleQty],[smas_BillDate],[Ctr_no])
VALUES(@tStrnNo,@tBillNo,@tFreeItemNo,@tQtyFree,@tScannedQtyFree,@tFreeMainItemNo,@tFreeOfferNo,@tOfferFreeQtyFree,@tTotSaleQtyFree,@tCurrentDate,@tCounter)
fetch Next from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
End
close c3
deallocate c3

   
   
   DECLARE @tDiscountId numeric(18,0);
   select @tDiscountId=(MAX(DiscountEntry_Id)+1) from NumberTable;
  INSERT INTO TempDiscountDetail_table([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) VALUES
           (@tDiscountId,@DiscountType,@tCurrentDate,@tBillNo,@tDiscount,@tGrossAmt);

   Update VoucherNo_table set Vch_BillNo=Vch_BillNo+1 where Vch_Type='10';
   Update Numbertable set VoucherNo=VoucherNo+3,DiscountEntry_Id=DiscountEntry_Id+1;
   
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO


CREATE PROCEDURE [dbo].[sp_SettleHouseACProcess1]
(@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tDiscount numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue Readonly,@DiscountType varchar(100),@tTxtAmount numeric(18,2),@tUserno numeric(18,0), @tCounter numeric(18,0),@tCreditCardName varchar(400), @tempFreeItem dtSingleFreeSales Readonly,@dt_gridload1 sp_funBtnDolorAlterTable  READONLY)
as
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Disc Numeric(18,2);
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tNetSalRetAmt NUMERIC(18,2);
DECLARE @tOpenItem varchar(50);
DECLARE @tOpenItemCount Numeric(18,0);
DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt, Disc FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt, Disc FROM @tempTable
DECLARE @tBankLedger_No Numeric(18,2);

	Declare @tItemNameFree varchar(400);
	Declare @tQtyFree numeric(18, 4);
	Declare @tScannedQtyFree varchar(100);
	Declare @tMainItemNameFree varchar(400);
	Declare @tOfferNameFree varchar(400);
	Declare @tOfferFreeQtyFree numeric(18, 2);
	Declare @tTotSaleQtyFree numeric(18, 2);
	DECLARE c3 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,ScannedQty,MainItemName,OfferName,OfferFreeQty,TotSaleQty FROM @tempFreeItem
DECLARE c7 CURSOR LOCAL READ_ONLY FOR SELECT Type1,RemaininbillAmt,ReceiverAmt,Types2 from @dt_gridload1 
declare @Type1 varchar(200),@RecRemBillAmt numeric(18,2),@RecAmt numeric(18,2),@Types2 as varchar(200);


SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   Select @tBankLedger_No=ledger_no from Ledger_Table where Ledger_name=@tCreditCardName
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt, @Disc
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Amt);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt, @Disc
end
close c2
deallocate c2
 
    if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
  Set @Profit=0;
   set @Profit=@tTotItemRate-@tTotItemCost;
   select @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
   
 
  if @tBillNo is Null
 Set @tBillNo=1
   
   open c7
  fetch from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  while @@FETCH_STATUS=0
  Begin
  
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,@Type1,@RecRemBillAmt,@RecAmt,'0')
   set @tSalRecv_Sno=@tSalRecv_Sno+1
   fetch Next from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  End
  close c7
  deallocate c7
  Update NumberTable set SalRecv_Sno=@tSalRecv_Sno;
   select @tCurrentDate=CONVERT(DATE,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
   select @tCurrentTime=convert(time,GETDATE(),100); 
      if @tCounter is null
  set @tCounter=1
   if @tUserno is null
  set @tUserno=1
   Insert into Tempsalmas_table (smas_no,smas_slno,smas_rtno,smas_billprefix,smas_billsuffix,smas_billno,Smas_Bill,smas_billdate,smas_billtime,smas_days,Mechanic_no,MechCommi_Amt,MechCommi_Per,SmanCommi_Amt,SManCommi_Per,MechCommiTax_Per,Smas_SmanNo,dc_no,dc_date,order_no,reference_date,reference_no,Vehicle_no,Smas_Others1,Smas_others2,smas_others3,smas_others4,UserNo,ctr_no,Godown_no,party_no,Customer_no,smas_name,smas_add1,smas_add2,smas_add3,smas_add4,smas_add5,smas_st,smas_cst,smas_cashmode,Smas_salmode,smas_saltype,smas_ordertype,smas_addled1,smas_addled2,smas_addled3,smas_addled4,smas_adddet1,smas_adddet2,smas_adddet3,smas_adddet4,smas_adddisc1,smas_adddisc2,smas_adddisc3,smas_adddisc4,smas_adddiscr1,smas_adddiscr2,smas_adddiscr3,smas_adddiscr4,smas_addamt1,smas_addamt2,smas_addamt3,smas_addamt4,smas_Gross,smas_GrossAmount,BankCharge,smas_NetAmount,smas_rcvdamount,smas_remarks,smas_Cancel,smas_cremark,smas_rounded,CashReceived,Profit,Update_Flag,Tax_Refund,Print_no,smas_point,smas_issue,smas_paidAmt,smas_Touch,smas_TotalCash,smas_TotalCredit,smas_TotalNets,Loaditem,Smas_columns,VoucherSno,SalesVchNo,ReceiptVchNo,CrNoteVchNo,CardSno,CardNo) values 
   (@tStrnNo,'0','0','','',@tBillNo,@tBillNo,@tCurrentDate,@tCurrentTime,'0','1','0','0','0','0','0','0','0','1999-01-01','','','','','','','','',@tUserno,@tCounter,'2',@tBankLedger_No,'0',@tCreditCardName,'','','','','','','','0','0','0','0','0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0',@tGrossAmt,@tGrossAmt,'0',@tNetAmt,@tNetAmt,'','0','',@RoundValue,'0',@Profit,'0','0','0','0','1',@tNetAmt,'True','0','0',@tNetAmt,'0','',@tVoucherNo,@tBillNo,'0','0','0','')
   
   
   
 Select @tStrnNo=(max(strnno)+1) from Numbertable
Declare @tFreeSno Numeric(18,2)=0;
Declare @tCtl_FreeQty  bit=0;
Declare @tRprop varchar(100)='NoTax';
Declare @tLabourCommiLedger numeric(18,0)=0;
Declare @tCommissionPercent Numeric(18,2)=0;
Declare @tCommissionAmt numeric(18,2)=0.00;
Select @tLabourCommiLedger=(case when LabourCommiLedger is null then 0 Else LabourCommiLedger End) from Control_table

open c
fetch from c into @ItemName,@Qty,@Rate,@Amt, @Disc
while @@fetch_status=0
begin
  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName;
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
   if @tLabourCommiLedger<>0
  begin
  Select @tCommissionPercent=(case when Commission is null then 0 else commission end) from Item_GroupTable where Item_groupno=(Select Item_groupno from Item_table where Item_no=@tItemNo)
  set @tCommissionAmt=((@Qty*@Rate)*@tCommissionPercent)/100;
  end
  Select @tRprop=Rprop from Rptset where Rdesc='Display Tax Type'
  if @tRprop='Exclusive'
  begin
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  End
  if @tRprop='Inclusive'
  begin
  Set @tTaxAmt=(@Qty*@Rate)- (((@Qty*@Rate)*100)/(100+@tTaxPercent));
  end
  if @tRprop='NoTax'
  begin
  Set @tTaxAmt=0
  set @tTaxNo=1
  set @tTaxPercent=0
  end
  
   --Free Item Code Start
  Select @tCtl_FreeQty= Ctl_FreeQty from Control_table
  if @tCtl_FreeQty=1
  begin 
  if Exists (Select * from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  End
  Else  
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType<>'Item Price' and Item_Name=@ItemName)
  End
  if  @tFreeSno is null
  set @tFreeSno=0
  End
  -- Free Item Code End
  
  Select @tItemNo=Item_no,@tItemCost=Item_cost,@tOpenItem=OpenItem from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=(@tItemCost*@Qty);
    Set @tTotItemRate=(@Rate*@Qty);  
    if @tOpenItem='True'
  select @tOpenItemCount=COUNT(*) from Tempstktrn_table where item_no=(select item_no from Item_table where Item_name=@ItemName) and strn_no=@tStrnNo  
  ELSE
  set @tOpenItemCount=0    
    
  INSERT INTO Tempstktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,OpenItem,OpenItemCount) values
   (@tStrnSno,@tStrnNo,'0','1', @tCurrentDate,'0',@tBankLedger_No,'0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',@Qty,'0','0','0','0','0','0','',@Rate,'0','0','0',@Amt,@tTaxNo,'0','0',@Disc,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0',@tCommissionPercent,@tCommissionAmt,'0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0','0','0','0','0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0',@tRprop,'0','0','0','0','0','0','0','0','0','0','0','0',@tFreeSno,(@tTotItemRate-@tTotItemCost),'0','0','0',@tOpenItem,@tOpenItemCount);
  update Numbertable set strnsno=strnsno+1;
   select @tNetSalAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=2
    if @tNetSalAmt is null
  set @tNetSalAmt=0;
  if @tNetSalRetAmt is null
  set @tNetSalRetAmt=0;
  update Item_Table set nt_salqty=nt_salqty+@Qty,nt_cloqty=nt_cloqty-@Qty,Nt_Salval=(@tNetSalAmt-@tNetSalAmt),Nt_SalRetval=@tNetSalAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt, @Disc
end
close c
deallocate c
Update NumberTable set strnno=strnno+1;

Select @tSalesCount=(Max(Vch_BillNo)) from VoucherNo_table where Vch_type='10'

if exists (Select * from TempVch_table)
Select @tVchRefNo=(max(Ref_no)+1) from TempVch_table
else
Select @tVchRefNo=(max(Ref_no)+1) from Vch_table
if @tVchRefNo is Null
Set @tVchRefNo=1;

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK>0)
Insert into TempVch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from Tempstktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Stktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into TempVch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1


--Free Item Code Start   
open c3
Declare @tFreeItemNo numeric(18,0);
Declare @tFreeMainItemNo numeric(18,0);
Declare @tFreeOfferNo numeric(18,0);
fetch from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
while @@fetch_status=0
begin
Select @tFreeItemNo=Item_no from Item_table where Item_name=@tItemNameFree
Select @tFreeMainItemNo=Item_no from Item_table where Item_name=@tMainItemNameFree
select @tFreeOfferNo=FreeSno from FreeItemMaster_table where OfferName=@tOfferNameFree
INSERT INTO [dbo].[SalFreeItemDetail_table]([smas_no] ,[smas_billno],[FreeItem_no],[TotFreeQty],[TotScannedQty],[MainItem_no],[OfferNo],[OfferFreeQty],[TotSaleQty],[smas_BillDate],[Ctr_no])
VALUES(@tStrnNo,@tBillNo,@tFreeItemNo,@tQtyFree,@tScannedQtyFree,@tFreeMainItemNo,@tFreeOfferNo,@tOfferFreeQtyFree,@tTotSaleQtyFree,@tCurrentDate,@tCounter)
fetch Next from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
End
close c3
deallocate c3

   
   
   DECLARE @tDiscountId numeric(18,0);
   select @tDiscountId=(MAX(DiscountEntry_Id)+1) from NumberTable;
  INSERT INTO TempDiscountDetail_table([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) VALUES
           (@tDiscountId,@DiscountType,@tCurrentDate,@tBillNo,@tDiscount,@tGrossAmt);

   Update VoucherNo_table set Vch_BillNo=Vch_BillNo+1 where Vch_Type='10';
   Update Numbertable set VoucherNo=VoucherNo+3,DiscountEntry_Id=DiscountEntry_Id+1;
   
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_SettleCreditCardProcess1]
(@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tDiscount numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue Readonly,@DiscountType varchar(100),@tTxtAmount numeric(18,2),@tUserno numeric(18,0), @tCounter numeric(18,0),@tCreditCardName varchar(400), @tempFreeItem dtSingleFreeSales Readonly,@dt_gridload1 sp_funBtnDolorAlterTable  READONLY)
as
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Disc Numeric(18,2);
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tNetSalRetAmt NUMERIC(18,2);
DECLARE @tOpenItem varchar(50);
DECLARE @tOpenItemCount Numeric(18,0);
DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt, Disc FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt, Disc FROM @tempTable
DECLARE @tBankLedger_No Numeric(18,2);

	Declare @tItemNameFree varchar(400);
	Declare @tQtyFree numeric(18, 4);
	Declare @tScannedQtyFree varchar(100);
	Declare @tMainItemNameFree varchar(400);
	Declare @tOfferNameFree varchar(400);
	Declare @tOfferFreeQtyFree numeric(18, 2);
	Declare @tTotSaleQtyFree numeric(18, 2);
	DECLARE c3 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,ScannedQty,MainItemName,OfferName,OfferFreeQty,TotSaleQty FROM @tempFreeItem
DECLARE c7 CURSOR LOCAL READ_ONLY FOR SELECT Type1,RemaininbillAmt,ReceiverAmt,Types2 from @dt_gridload1 
declare @Type1 varchar(200),@RecRemBillAmt numeric(18,2),@RecAmt numeric(18,2),@Types2 as varchar(200);

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
  
  Select @tBankLedger_No=Ledger_no from Ledger_table where Ledger_name=@tCreditCardName
  
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Amt);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt, @Disc
end
close c2
deallocate c2
 if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
  Set @Profit=0;
   set @Profit=@tTotItemRate-@tTotItemCost;
   select @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
   
   
   
  
  if @tBillNo is Null
 Set @tBillNo=1
   
   open c7
  fetch from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  while @@FETCH_STATUS=0
  Begin
   
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,@Type1,@RecRemBillAmt,@RecAmt,'0')
   set @tSalRecv_Sno=@tSalRecv_Sno+1
   fetch Next from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  End
  close c7
  deallocate c7
  Update NumberTable set SalRecv_Sno=@tSalRecv_Sno;
 
   
  
   select @tCurrentDate=CONVERT(DATE,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
   select @tCurrentTime=convert(time,GETDATE(),100); 
      if @tCounter is null
  set @tCounter=1
   if @tUserno is null
  set @tUserno=1
   Insert into Tempsalmas_table (smas_no,smas_slno,smas_rtno,smas_billprefix,smas_billsuffix,smas_billno,Smas_Bill,smas_billdate,smas_billtime,smas_days,Mechanic_no,MechCommi_Amt,MechCommi_Per,SmanCommi_Amt,SManCommi_Per,MechCommiTax_Per,Smas_SmanNo,dc_no,dc_date,order_no,reference_date,reference_no,Vehicle_no,Smas_Others1,Smas_others2,smas_others3,smas_others4,UserNo,ctr_no,Godown_no,party_no,Customer_no,smas_name,smas_add1,smas_add2,smas_add3,smas_add4,smas_add5,smas_st,smas_cst,smas_cashmode,Smas_salmode,smas_saltype,smas_ordertype,smas_addled1,smas_addled2,smas_addled3,smas_addled4,smas_adddet1,smas_adddet2,smas_adddet3,smas_adddet4,smas_adddisc1,smas_adddisc2,smas_adddisc3,smas_adddisc4,smas_adddiscr1,smas_adddiscr2,smas_adddiscr3,smas_adddiscr4,smas_addamt1,smas_addamt2,smas_addamt3,smas_addamt4,smas_Gross,smas_GrossAmount,BankCharge,smas_NetAmount,smas_rcvdamount,smas_remarks,smas_Cancel,smas_cremark,smas_rounded,CashReceived,Profit,Update_Flag,Tax_Refund,Print_no,smas_point,smas_issue,smas_paidAmt,smas_Touch,smas_TotalCash,smas_TotalCredit,smas_TotalNets,Loaditem,Smas_columns,VoucherSno,SalesVchNo,ReceiptVchNo,CrNoteVchNo,CardSno,CardNo) values 
   (@tStrnNo,'0','0','','',@tBillNo,@tBillNo,@tCurrentDate,@tCurrentTime,'0','1','0','0','0','0','0','0','0','1999-01-01','','','','','','','','',@tUserno,@tCounter,'2',@tBankLedger_No,'0',@tCreditCardName,'','','','','','','','0','0','0','0','0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0',@tGrossAmt,@tGrossAmt,'0',@tNetAmt,@tNetAmt,'','0','',@RoundValue,'0',@Profit,'0','0','0','0','1',@tNetAmt,'True','0','0',@tNetAmt,'0','',@tVoucherNo,@tBillNo,'0','0','0','')
   
   
   
 Select @tStrnNo=(max(strnno)+1) from Numbertable
Declare @tFreeSno Numeric(18,2)=0;
Declare @tCtl_FreeQty  bit=0;
Declare @tSaleQtyFrom numeric(18,2);
Declare @tFreeQtyCount int=0;
Declare @tRprop varchar(100)='NoTax';
Declare @tLabourCommiLedger numeric(18,0)=0;
Declare @tCommissionPercent Numeric(18,2)=0;
Declare @tCommissionAmt numeric(18,2)=0.00;
Select @tLabourCommiLedger=(case when LabourCommiLedger is null then 0 Else LabourCommiLedger End) from Control_table

open c
fetch from c into @ItemName,@Qty,@Rate,@Amt, @Disc
while @@fetch_status=0
begin
  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName;
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
   if @tLabourCommiLedger<>0
  begin
  Select @tCommissionPercent=(case when Commission is null then 0 else commission end) from Item_GroupTable where Item_groupno=(Select Item_groupno from Item_table where Item_no=@tItemNo)
  set @tCommissionAmt=((@Qty*@Rate)*@tCommissionPercent)/100;
  end
 Select @tRprop=Rprop from Rptset where Rdesc='Display Tax Type'
  if @tRprop='Exclusive'
  begin
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  End
  if @tRprop='Inclusive'
  begin
  Set @tTaxAmt=(@Qty*@Rate)- (((@Qty*@Rate)*100)/(100+@tTaxPercent));
  end
  if @tRprop='NoTax'
  begin
  Set @tTaxAmt=0
  set @tTaxNo=1
  set @tTaxPercent=0
  end
  
   --Free Item Code Start
  Select @tCtl_FreeQty= Ctl_FreeQty from Control_table
  if @tCtl_FreeQty=1
  begin 
   set @tFreeQtyCount=0;
  --set @tSaleQtyFrom=0;
  if Exists (Select * from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  Begin  
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType='Item Price' and Item_Name=@ItemName)
   Select @tSaleQtyFrom=SaleQtyFrom from tempView where FreeType='Item Price' and Item_Name=@ItemName
  set @tFreeQtyCount=@Qty/@tSaleQtyFrom;
    if @tFreeQtyCount=0
    set @tFreeSno=0
  End
  Else  
  Begin  
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType<>'Item Price' and Item_Name=@ItemName)
    Select @tSaleQtyFrom=SaleQtyFrom from tempView where FreeType<>'Item Price' and Item_Name=@ItemName
    set @tFreeQtyCount=@Qty/@tSaleQtyFrom;
    if @tFreeQtyCount=0
    set @tFreeSno=0
  End
  if  @tFreeSno is null
  set @tFreeSno=0
  End
  
  if @tFreeSno=0
  set @tFreeQtyCount=0
  -- Free Item Code End
 
  
  Select @tItemNo=Item_no,@tItemCost=Item_cost,@tOpenItem=OpenItem from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=(@tItemCost*@Qty);
    Set @tTotItemRate=(@Amt);  
    if @tOpenItem='True'
  select @tOpenItemCount=COUNT(*) from Tempstktrn_table where item_no=(select item_no from Item_table where Item_name=@ItemName) and strn_no=@tStrnNo  
  ELSE
  set @tOpenItemCount=0    
    
  INSERT INTO Tempstktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,OpenItem,OpenItemCount) values
   (@tStrnSno,@tStrnNo,'0','1', @tCurrentDate,'0',@tBankLedger_No,'0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',@Qty,'0','0','0','0','0','0','',@Rate,'0','0','0',@Amt,@tTaxNo,'0','0',@Disc,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0',@tCommissionPercent,@tCommissionAmt,'0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0','0','0','0','0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0',@tRprop,'0','0','0','0','0','0','0','0','0','0','0',@tFreeQtyCount,@tFreeSno,(@tTotItemRate-@tTotItemCost),'0','0','0',@tOpenItem,@tOpenItemCount);
  update Numbertable set strnsno=strnsno+1;
   select @tNetSalAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=2
    if @tNetSalAmt is null
  set @tNetSalAmt=0;
  if @tNetSalRetAmt is null
  set @tNetSalRetAmt=0;
  update Item_Table set nt_salqty=nt_salqty+@Qty,nt_cloqty=nt_cloqty-@Qty,Nt_Salval=(@tNetSalAmt-@tNetSalAmt),Nt_SalRetval=@tNetSalAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt, @Disc
end
close c
deallocate c
Update NumberTable set strnno=strnno+1;

Select @tSalesCount=(Max(Vch_BillNo)) from VoucherNo_table where Vch_type='10'

if exists (Select * from TempVch_table)
Select @tVchRefNo=(max(Ref_no)+1) from TempVch_table
else
Select @tVchRefNo=(max(Ref_no)+1) from Vch_table

if @tVchRefNo is Null
Set @tVchRefNo=1;

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into TempVch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK>0)
Insert into TempVch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from Tempstktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1',@tBankLedger_No,@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1


--Free Item Code Start   
open c3
Declare @tFreeItemNo numeric(18,0);
Declare @tFreeMainItemNo numeric(18,0);
Declare @tFreeOfferNo numeric(18,0);
fetch from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
while @@fetch_status=0
begin
Select @tFreeItemNo=Item_no from Item_table where Item_name=@tItemNameFree
Select @tFreeMainItemNo=Item_no from Item_table where Item_name=@tMainItemNameFree
select @tFreeOfferNo=FreeSno from FreeItemMaster_table where OfferName=@tOfferNameFree
INSERT INTO [dbo].[SalFreeItemDetail_table]([smas_no] ,[smas_billno],[FreeItem_no],[TotFreeQty],[TotScannedQty],[MainItem_no],[OfferNo],[OfferFreeQty],[TotSaleQty],[smas_BillDate], [Ctr_no])
VALUES(@tStrnNo,@tBillNo,@tFreeItemNo,@tQtyFree,@tScannedQtyFree,@tFreeMainItemNo,@tFreeOfferNo,@tOfferFreeQtyFree,@tTotSaleQtyFree,@tCurrentDate,@tCounter)
fetch Next from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
End
close c3
deallocate c3

   
   
   DECLARE @tDiscountId numeric(18,0);
   select @tDiscountId=(MAX(DiscountEntry_Id)+1) from NumberTable;
  INSERT INTO TempDiscountDetail_table([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) VALUES
           (@tDiscountId,@DiscountType,@tCurrentDate,@tBillNo,@tDiscount,@tGrossAmt);

   Update VoucherNo_table set Vch_BillNo=Vch_BillNo+1 where Vch_Type='10';
   Update Numbertable set VoucherNo=VoucherNo+3,DiscountEntry_Id=DiscountEntry_Id+1;
   
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO
CREATE Procedure [dbo].[sp_ManagerLoad](@tUserNo varchar(50),@tCounter varchar(50))
AS 
Begin
SET NOCOUNT ON 
if not exists (Select * from BeginCashDrawerActive_table where Ctr_no=(select Ctr_no from User_table where User_no=@tUserNo))
begin
exec sp_updateFirstEndOfday @tUserNo,@tCounter
end
(Select Describ as Describ,Property as Property from G_set) union (Select RDesc As Describ,RProp as Property from rptset) union (Select Describ as Describ,Prop as Property from Custom_Text)

end


GO
CREATE PROCEDURE [dbo].[sp_funBtnDolor1]
(@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tDiscount numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue Readonly,@DiscountType varchar(100),@tValue numeric(18,2),@tTxtAmount numeric(18,2),@tUserno numeric(18,0), @tCounter numeric(18,0), @tempFreeItem dtSingleFreeSales Readonly,@dt_gridload1 sp_funBtnDolorAlterTable  READONLY)
as
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Disc Numeric(18,2);
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTotRecvAmt numeric(18,2)=0;
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tNetSalRetAmt NUMERIC(18,2);
DECLARE @tOpenItem varchar(50);
DECLARE @tOpenItemCount Numeric(18,0);
DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable
DECLARE c7 CURSOR LOCAL READ_ONLY FOR SELECT Type1,RemaininbillAmt,ReceiverAmt,Types2 from @dt_gridload1 

	Declare @tItemNameFree varchar(400);
	Declare @tQtyFree numeric(18, 4);
	Declare @tScannedQtyFree varchar(100);
	Declare @tMainItemNameFree varchar(400);
	Declare @tOfferNameFree varchar(400);
	Declare @tOfferFreeQtyFree numeric(18, 2);
	Declare @tTotSaleQtyFree numeric(18, 2);
	DECLARE c3 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,ScannedQty,MainItemName,OfferName,OfferFreeQty,TotSaleQty FROM @tempFreeItem
    declare @Type1 varchar(200),@RecRemBillAmt numeric(18,2),@RecAmt numeric(18,2),@Types2 as varchar(200);

SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Amt);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c2
deallocate c2
  Set @Profit=0;
   set @Profit=@tTotItemRate-@tTotItemCost;
   select @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
  
   
 if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
  if @tBillNo is Null
 Set @tBillNo=1
 
 open c7
  fetch from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  while @@FETCH_STATUS=0
  Begin
   
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,@Type1,@RecRemBillAmt,@RecAmt,'0')
   set @tSalRecv_Sno=@tSalRecv_Sno+1
   fetch Next from c7 into @Type1,@RecRemBillAmt,@RecAmt,@Types2
  End
  close c7
  deallocate c7
  Update NumberTable set SalRecv_Sno=@tSalRecv_Sno;
  
   select @tTotRecvAmt=SUM(salrecv_amt+salrecv_refund) from TempSalRecv_table where SalRecv_Salno=@tBillNo;

   
   
   
   select @tCurrentDate=CONVERT(DATE,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
   select @tCurrentTime=convert(time,GETDATE(),100); 
   if @tCounter is null
  set @tCounter=1
   if @tUserno is null
  set @tUserno=1
   Insert into Tempsalmas_table (smas_no,smas_slno,smas_rtno,smas_billprefix,smas_billsuffix,smas_billno,Smas_Bill,smas_billdate,smas_billtime,smas_days,Mechanic_no,MechCommi_Amt,MechCommi_Per,SmanCommi_Amt,SManCommi_Per,MechCommiTax_Per,Smas_SmanNo,dc_no,dc_date,order_no,reference_date,reference_no,Vehicle_no,Smas_Others1,Smas_others2,smas_others3,smas_others4,UserNo,ctr_no,Godown_no,party_no,Customer_no,smas_name,smas_add1,smas_add2,smas_add3,smas_add4,smas_add5,smas_st,smas_cst,smas_cashmode,Smas_salmode,smas_saltype,smas_ordertype,smas_addled1,smas_addled2,smas_addled3,smas_addled4,smas_adddet1,smas_adddet2,smas_adddet3,smas_adddet4,smas_adddisc1,smas_adddisc2,smas_adddisc3,smas_adddisc4,smas_adddiscr1,smas_adddiscr2,smas_adddiscr3,smas_adddiscr4,smas_addamt1,smas_addamt2,smas_addamt3,smas_addamt4,smas_Gross,smas_GrossAmount,BankCharge,smas_NetAmount,smas_rcvdamount,smas_remarks,smas_Cancel,smas_cremark,smas_rounded,CashReceived,Profit,Update_Flag,Tax_Refund,Print_no,smas_point,smas_issue,smas_paidAmt,smas_Touch,smas_TotalCash,smas_TotalCredit,smas_TotalNets,Loaditem,Smas_columns,VoucherSno,SalesVchNo,ReceiptVchNo,CrNoteVchNo,CardSno,CardNo) values 
   (@tStrnNo,'0','0','','',@tBillNo,@tBillNo,@tCurrentDate,@tCurrentTime,'0','1','0','0','0','0','0','0','0','1999-01-01','','','','','','','','',@tUserno,@tCounter,'2','2','0','Cash Sales','','','','','','','','1','0','0','0','0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0',@tGrossAmt,@tGrossAmt,'0',@tNetAmt,@tTotRecvAmt,'','0','',@RoundValue,'0',@Profit,'0','0','0','0','1',@tNetAmt,'True',@tNetAmt,'0','0','0','',@tVoucherNo,@tBillNo,'0','0','0','')
   
   
   
 Select @tStrnNo=(max(strnno)+1) from Numbertable
Declare @tFreeSno Numeric(18,2)=0;
Declare @tCtl_FreeQty  bit=0;
Declare @tRprop varchar(100)='NoTax';
Declare @tLabourCommiLedger numeric(18,0)=0;
Declare @tCommissionPercent Numeric(18,2)=0;
Declare @tCommissionAmt numeric(18,2)=0.00;
Select @tLabourCommiLedger=(case when LabourCommiLedger is null then 0 Else LabourCommiLedger End) from Control_table
open c
fetch from c into @ItemName,@Qty,@Rate,@Amt, @Disc
while @@fetch_status=0
begin
  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName;
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  
  if @tLabourCommiLedger<>0
  begin
  Select @tCommissionPercent=(case when Commission is null then 0 else commission end) from Item_GroupTable where Item_groupno=(Select Item_groupno from Item_table where Item_no=@tItemNo)
  set @tCommissionAmt=((@Qty*@Rate)*@tCommissionPercent)/100;
  end
  
 Select @tRprop=Rprop from Rptset where Rdesc='Display Tax Type'
  if @tRprop='Exclusive'
  begin
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  End
  if @tRprop='Inclusive'
  begin
  Set @tTaxAmt=(@Qty*@Rate)- (((@Qty*@Rate)*100)/(100+@tTaxPercent));
  end
  if @tRprop='NoTax'
  begin
  Set @tTaxAmt=0
  set @tTaxNo=1
  set @tTaxPercent=0
  end
  
   --Free Item Code Start
  Select @tCtl_FreeQty= Ctl_FreeQty from Control_table
  if @tCtl_FreeQty=1
  begin 
  if Exists (Select * from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  End
  Else  
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType<>'Item Price' and Item_Name=@ItemName)
  End
  if  @tFreeSno is null
  set @tFreeSno=0
  End
  -- Free Item Code End
  
  
    Select @tItemNo=Item_no,@tItemCost=Item_cost,@tOpenItem=OpenItem from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=(@tItemCost*@Qty);
    Set @tTotItemRate=(@Amt);  
    if @tOpenItem='True'
  select @tOpenItemCount=COUNT(*) from Tempstktrn_table where item_no=(select item_no from Item_table where Item_name=@ItemName) and strn_no=@tStrnNo  
  ELSE
  set @tOpenItemCount=0     
    
  INSERT INTO Tempstktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,OpenItem,OpenItemCount) values
   (@tStrnSno,@tStrnNo,'0','1', @tCurrentDate,'0','2','0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',@Qty,'0','0','0','0','0','0','',@Rate,'0','0','0',@Amt,@tTaxNo,'0','0',@Disc,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0',@tCommissionPercent,@tCommissionAmt,'0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0','0','0','0','0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0',@tRprop,'0','0','0','0','0','0','0','0','0','0','0','0',@tFreeSno,(@tTotItemRate-@tTotItemCost),'0','0','0',@tOpenItem, @tOpenItemCount);
  update Numbertable set strnsno=strnsno+1;
   select @tNetSalAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=2
  if @tNetSalAmt is null
  set @tNetSalAmt=0;
  if @tNetSalRetAmt is null
  set @tNetSalRetAmt=0;
  update Item_Table set nt_salqty=nt_salqty+@Qty,nt_cloqty=nt_cloqty-@Qty,Nt_Salval=(@tNetSalAmt-@tNetSalRetAmt), Nt_SalRetval=@tNetSalRetAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c
deallocate c
Update NumberTable set strnno=strnno+1;

Select @tSalesCount=(Max(Vch_BillNo)) from VoucherNo_table where Vch_type='12'

if exists (Select * from TempVch_table)
Select @tVchRefNo=(max(Ref_no)+1) from TempVch_table
else
Select @tVchRefNo=(max(Ref_no)+1) from Vch_table
if @tVchRefNo is Null
Set @tVchRefNo=1;

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into TempVch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK>0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from Tempstktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1 

--Free Item Code Start   
open c3
Declare @tFreeItemNo numeric(18,0);
Declare @tFreeMainItemNo numeric(18,0);
Declare @tFreeOfferNo numeric(18,0);
fetch from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
while @@fetch_status=0
begin
Select @tFreeItemNo=Item_no from Item_table where Item_name=@tItemNameFree
Select @tFreeMainItemNo=Item_no from Item_table where Item_name=@tMainItemNameFree
select @tFreeOfferNo=FreeSno from FreeItemMaster_table where OfferName=@tOfferNameFree
INSERT INTO [dbo].[SalFreeItemDetail_table]([smas_no] ,[smas_billno],[FreeItem_no],[TotFreeQty],[TotScannedQty],[MainItem_no],[OfferNo],[OfferFreeQty],[TotSaleQty],[smas_BillDate],[Ctr_no])
VALUES(@tStrnNo,@tBillNo,@tFreeItemNo,@tQtyFree,@tScannedQtyFree,@tFreeMainItemNo,@tFreeOfferNo,@tOfferFreeQtyFree,@tTotSaleQtyFree,@tCurrentDate,@tCounter)
fetch Next from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
End
close c3
deallocate c3

   
   
   DECLARE @tDiscountId numeric(18,0);
   select @tDiscountId=(MAX(DiscountEntry_Id)+1) from NumberTable;
  INSERT INTO TempDiscountDetail_table([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) VALUES
           (@tDiscountId,@DiscountType,@tCurrentDate,@tBillNo,@tDiscount,@tGrossAmt);

   Update VoucherNo_table set Vch_BillNo=Vch_BillNo+1 where Vch_Type='12';
   Update Numbertable set VoucherNo=VoucherNo+3,DiscountEntry_Id=DiscountEntry_Id+1;
   
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH

GO
CREATE PROCEDURE [dbo].[sp_btnNETSSettleHome]
(@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tDiscount numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue Readonly,@DiscountType varchar(100),@tUserno numeric(18,0), @tCounter numeric(18,0), @tempFreeItem dtSingleFreeSales Readonly)
as
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Disc numeric(18,2);
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tNetSalRetAmt Numeric(18,2);
DECLARE @tOpenItem varchar(50);
DECLARE @tOpenItemCount Numeric(18,0);
DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable

	Declare @tItemNameFree varchar(400);
	Declare @tQtyFree numeric(18, 4);
	Declare @tScannedQtyFree varchar(100);
	Declare @tMainItemNameFree varchar(400);
	Declare @tOfferNameFree varchar(400);
	Declare @tOfferFreeQtyFree numeric(18, 2);
	Declare @tTotSaleQtyFree numeric(18, 2);
	DECLARE c3 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,ScannedQty,MainItemName,OfferName,OfferFreeQty,TotSaleQty FROM @tempFreeItem


SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Amt);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c2
deallocate c2

if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
 
  Set @Profit=0;
   set @Profit=@tTotItemRate-@tTotItemCost;
   select @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
   
   
 
 if @tBillNo is Null
 Set @tBillNo=1
   
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,'14',@tNetAmt,'0','0')
   
   --if(@tBillNo=0) 
   --set @tBillNo=1;
   select @tCurrentDate=CONVERT(DATE,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
   select @tCurrentTime=convert(time,GETDATE(),100); 
    if @tCounter is null
  set @tCounter=1
   if @tUserno is null
  set @tUserno=1
   Insert into Tempsalmas_table (smas_no,smas_slno,smas_rtno,smas_billprefix,smas_billsuffix,smas_billno,Smas_Bill,smas_billdate,smas_billtime,smas_days,Mechanic_no,MechCommi_Amt,MechCommi_Per,SmanCommi_Amt,SManCommi_Per,MechCommiTax_Per,Smas_SmanNo,dc_no,dc_date,order_no,reference_date,reference_no,Vehicle_no,Smas_Others1,Smas_others2,smas_others3,smas_others4,UserNo,ctr_no,Godown_no,party_no,Customer_no,smas_name,smas_add1,smas_add2,smas_add3,smas_add4,smas_add5,smas_st,smas_cst,smas_cashmode,Smas_salmode,smas_saltype,smas_ordertype,smas_addled1,smas_addled2,smas_addled3,smas_addled4,smas_adddet1,smas_adddet2,smas_adddet3,smas_adddet4,smas_adddisc1,smas_adddisc2,smas_adddisc3,smas_adddisc4,smas_adddiscr1,smas_adddiscr2,smas_adddiscr3,smas_adddiscr4,smas_addamt1,smas_addamt2,smas_addamt3,smas_addamt4,smas_Gross,smas_GrossAmount,BankCharge,smas_NetAmount,smas_rcvdamount,smas_remarks,smas_Cancel,smas_cremark,smas_rounded,CashReceived,Profit,Update_Flag,Tax_Refund,Print_no,smas_point,smas_issue,smas_paidAmt,smas_Touch,smas_TotalCash,smas_TotalCredit,smas_TotalNets,Loaditem,Smas_columns,VoucherSno,SalesVchNo,ReceiptVchNo,CrNoteVchNo,CardSno,CardNo) values 
   (@tStrnNo,'0','0','','',@tBillNo,@tBillNo,@tCurrentDate,@tCurrentTime,'0','1','0','0','0','0','0','0','0','1999-01-01','','','','','','','','',@tUserno,@tCounter,'2','14','0','NETS','','','','','','','','0','0','0','0','0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0',@tGrossAmt,(@tNetAmt+@RoundValue),'0',@tNetAmt,@tNetAmt,'','0','',@RoundValue,'0',@Profit,'0','0','0','0','1',@tNetAmt,'True','0','0',@tNetAmt,'0','',@tVoucherNo,@tBillNo,'0','0','0','')
   
   
   
 Select @tStrnNo=(max(strnno)+1) from Numbertable
Declare @tFreeSno Numeric(18,2)=0;
Declare @tCtl_FreeQty  bit=0;
Declare @tSaleQtyFrom numeric(18,2);
Declare @tFreeQtyCount int=0;
Declare @tRprop varchar(100)='NoTax';
Declare @tLabourCommiLedger numeric(18,0)=0;
Declare @tCommissionPercent Numeric(18,2)=0;
Declare @tCommissionAmt numeric(18,2)=0.00;
Select @tLabourCommiLedger=(case when LabourCommiLedger is null then 0 Else LabourCommiLedger End) from Control_table


open c
fetch from c into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName;
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  
  if @tLabourCommiLedger<>0
  begin
  Select @tCommissionPercent=(case when Commission is null then 0 else commission end) from Item_GroupTable where Item_groupno=(Select Item_groupno from Item_table where Item_no=@tItemNo)
  set @tCommissionAmt=((@Qty*@Rate)*@tCommissionPercent)/100;
  end
  Select @tRprop=Rprop from Rptset where Rdesc='Display Tax Type'
  if @tRprop='Exclusive'
  begin
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  End
  if @tRprop='Inclusive'
  begin
  Set @tTaxAmt=(@Qty*@Rate)- (((@Qty*@Rate)*100)/(100+@tTaxPercent));
  end
  if @tRprop='NoTax'
  begin
  Set @tTaxAmt=0
  set @tTaxNo=1
  set @tTaxPercent=0
  end
    --Free Item Code Start
  Select @tCtl_FreeQty= Ctl_FreeQty from Control_table
  if @tCtl_FreeQty=1
  begin 
  set @tFreeQtyCount=0;
  --set @tSaleQtyFrom=0;
  if Exists (Select * from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  Begin  
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType='Item Price' and Item_Name=@ItemName)
   Select @tSaleQtyFrom=SaleQtyFrom from tempView where FreeType='Item Price' and Item_Name=@ItemName
  set @tFreeQtyCount=@Qty/@tSaleQtyFrom;
    if @tFreeQtyCount=0
    set @tFreeSno=0
  End
  Else  
  Begin  
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType<>'Item Price' and Item_Name=@ItemName)
    Select @tSaleQtyFrom=SaleQtyFrom from tempView where FreeType<>'Item Price' and Item_Name=@ItemName
    set @tFreeQtyCount=@Qty/@tSaleQtyFrom;
    if @tFreeQtyCount=0
    set @tFreeSno=0
  End
  if  @tFreeSno is null
  set @tFreeSno=0
  End
  
  if @tFreeSno=0
  set @tFreeQtyCount=0
  -- Free Item Code End
  
  Select @tItemNo=Item_no,@tItemCost=Item_cost,@tOpenItem=OpenItem from Item_table where Item_name=@ItemName;
  Set @tTotItemCost=(@tItemCost*@Qty);
  Set @tTotItemRate=(@Amt);  
  if @tOpenItem='True'
  select @tOpenItemCount=COUNT(*) from Tempstktrn_table where item_no=(select item_no from Item_table where Item_name=@ItemName) and strn_no=@tStrnNo  
  ELSE
  set @tOpenItemCount=0     
  INSERT INTO Tempstktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,OpenItem,OpenItemCount) values
   (@tStrnSno,@tStrnNo,'0','1', @tCurrentDate,'0','14','0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',@Qty,'0','0','0','0','0','0','',@Rate,'0','0','0',@Amt,@tTaxNo,'0','0',@Disc,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0',@tCommissionPercent,@tCommissionAmt,'0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0','0','0','0','0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0',@tRprop,'0','0','0','0','0','0','0','0','0','0','0',@tFreeQtyCount,@tFreeSno,(@tTotItemRate-@tTotItemCost),'0','0','0',@tOpenItem,@tOpenItemCount);
  update Numbertable set strnsno=strnsno+1;
   select @tNetSalAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=2
  if @tNetSalAmt is null
    set @tNetSalAmt=0;
  if @tNetSalRetAmt is null  
  set @tNetSalRetAmt=0;
  update Item_Table set nt_salqty=nt_salqty+@Qty,nt_cloqty=nt_cloqty-@Qty,Nt_Salval=(@tNetSalAmt-@tNetSalRetAmt), Nt_SalRetval=@tNetSalRetAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c
deallocate c
Update NumberTable set SalRecv_Sno=SalRecv_Sno+1,strnno=strnno+1;

Select @tSalesCount=(Max(Vch_BillNo)) from VoucherNo_table where Vch_type='10'

if exists (Select * from TempVch_table)
Select @tVchRefNo=(max(Ref_no)+1) from TempVch_table
else
Select @tVchRefNo=(max(Ref_no)+1) from Vch_table
if @tVchRefNo is Null
Set @tVchRefNo=1;

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK>0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from Tempstktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into TempVch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','14',@tVchRefNo,'1',@tCurrentDate,'10',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1


--Free Item Code Start   
open c3
Declare @tFreeItemNo numeric(18,0);
Declare @tFreeMainItemNo numeric(18,0);
Declare @tFreeOfferNo numeric(18,0);
fetch from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
while @@fetch_status=0
begin
Select @tFreeItemNo=Item_no from Item_table where Item_name=@tItemNameFree
Select @tFreeMainItemNo=Item_no from Item_table where Item_name=@tMainItemNameFree
select @tFreeOfferNo=FreeSno from FreeItemMaster_table where OfferName=@tOfferNameFree
INSERT INTO [dbo].[SalFreeItemDetail_table]([smas_no] ,[smas_billno],[FreeItem_no],[TotFreeQty],[TotScannedQty],[MainItem_no],[OfferNo],[OfferFreeQty],[TotSaleQty],[smas_BillDate],[Ctr_no])
VALUES(@tStrnNo,@tBillNo,@tFreeItemNo,@tQtyFree,@tScannedQtyFree,@tFreeMainItemNo,@tFreeOfferNo,@tOfferFreeQtyFree,@tTotSaleQtyFree,@tCurrentDate,@tCounter)
fetch Next from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
End
close c3
deallocate c3

   
   
   DECLARE @tDiscountId numeric(18,0);
   select @tDiscountId=(MAX(DiscountEntry_Id)+1) from NumberTable;
  INSERT INTO TempDiscountDetail_table([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) VALUES
           (@tDiscountId,@DiscountType,@tCurrentDate,@tBillNo,@tDiscount,@tGrossAmt);

   Update VoucherNo_table set Vch_BillNo=Vch_BillNo+1 where Vch_Type='10';
   Update Numbertable set VoucherNo=VoucherNo+3,DiscountEntry_Id=DiscountEntry_Id+1;
   
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH


GO
CREATE PROCEDURE [dbo].[sp_btnCashSettleHome]
(@tGrossAmt numeric(18,2),@tNetAmt numeric(18,2),@tDiscount numeric(18,2),@tTotTax numeric(18,2),@RoundValue numeric(18,2),@tempTable Type_gridValue Readonly,@DiscountType varchar(100),@tUserno numeric(18,0), @tCounter numeric(18,0), @tempFreeItem dtSingleFreeSales Readonly)
as
DECLARE @TranCounter INT; 
DECLARE @tStrnNo Numeric(18,0)=0;
DECLARE @tBillNo Numeric(18,0)=0;
DECLARE @tCurrentDate datetime;
DECLARE @tCurrentTime datetime;
DECLARE @tVoucherNo Numeric(18,0)=0;
DECLARE @ItemName varchar(200),@Qty numeric(18,4),@Rate numeric(18,2),@Amt numeric(18,2),@Disc Numeric(18,2);
DECLARE @tStrnSno Numeric(18,0)=0;
DECLARE @tItemNo Numeric(18,0)=0;
DECLARE @tTaxNo Numeric(18,0)=0;
DECLARE @tUnitNo Numeric(18,0)=0;
DECLARE @tTaxPercent Numeric(18,2)=0;
DECLARE @Profit Numeric(18,2)=0; 
DECLARE @tTaxAmt Numeric(18,2)=0;
DECLARE @tNetSalAmt Numeric(18,2)=0;
DECLARE @tSalesCount Numeric(18,0)=0;
DECLARE @tVchRefNo Numeric(18,0)=0;
DECLARE @tTax Numeric(18,2)=0;
DECLARE @tVoucherNoNew Numeric(18,0)=0;
DECLARE @tVoucherSno Numeric(18,0)=0;
DECLARE @tLedgerNo1 Numeric(18,0)=0;
DECLARE @tSingleTaxAmt Numeric(18,2)=0;
DECLARE @tItemCost Numeric(18,2)=0;
DECLARE @tTotItemCost Numeric(18,2)=0;
DECLARE @tTotItemRate Numeric(18,2)=0;
DECLARE @tLedsel_name varchar(100);
DECLARE @tSub varchar(100);
DECLARE @tLedgerNo1New Numeric(18,2);
DECLARE @tSingleTaxAmtNew Numeric(18,2)=0;
Declare @tCHK numeric(18,2)=0;
DECLARE @tSalRecv_Sno numeric(18,2);
DECLARE @tTaxNumber NUMERIC(18,0);
DECLARE @tNetSalRetAmt NUMERIC(18,2)=0;
DECLARE @tOpenItem varchar(50);
DECLARE @tOpenItemCount Numeric(18,0);
DECLARE c CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable
DECLARE c2 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,Rate,Amt,Disc FROM @tempTable

	Declare @tItemNameFree varchar(400);
	Declare @tQtyFree numeric(18, 4);
	Declare @tScannedQtyFree varchar(100);
	Declare @tMainItemNameFree varchar(400);
	Declare @tOfferNameFree varchar(400);
	Declare @tOfferFreeQtyFree numeric(18, 2);
	Declare @tTotSaleQtyFree numeric(18, 2);
	DECLARE c3 CURSOR LOCAL READ_ONLY FOR SELECT ItemName,Qty,ScannedQty,MainItemName,OfferName,OfferFreeQty,TotSaleQty FROM @tempFreeItem


SET @TranCounter = @@TRANCOUNT;
IF @TranCounter > 0
SAVE TRANSACTION ProcedureSave;
ELSE
   BEGIN TRANSACTION;
   BEGIN TRY
   
open c2
fetch from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
    Select @tItemNo=Item_no,@tItemCost=Item_cost from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=@tTotItemCost+(@tItemCost*@Qty);
   -- Set @tTotItemRate=@tTotItemRate+(@Rate*@Qty);
    Set @tTotItemRate=@tTotItemRate+(@Amt);
    fetch next from c2 into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c2
deallocate c2

 if exists (Select * from Tempsalmas_table where smas_rtno=0)
 Select @tBillNo=max(smas_billno)+1 from Tempsalmas_table where smas_rtno=0;
 else
 Select @tBillNo=max(smas_billno)+1 from SalMas_table where smas_rtno=0;
 
  Set @Profit=0;
  set @Profit=@tTotItemRate-@tTotItemCost;
  select @tSalRecv_Sno=(max(SalRecv_Sno)+1),@tStrnNo=(MAX(StrnNo)+1),@tVoucherNo=(max(VoucherNo)+1) from NumberTable;
   
 
 

 if @tBillNo is Null
 Set @tBillNo=1
 
   INSERT INTO TempSalRecv_table (SalRecv_Sno,SalRecv_Salno,SalRecv_Led,SalRecv_Amt,SalRecv_Refund,SalRecv_Cancel) values(@tSalRecv_Sno,@tBillNo,'5',@tNetAmt,'0','0')
   
   
   
   select @tCurrentDate=convert(date,DATEADD(day,1,EndOfDay),103) from EndOFday_Table where Id=(select EndOfDayId from NumberTable)
   select @tCurrentTime=convert(time,GETDATE(),100); 
  if @tCounter is null
  set @tCounter=1
   if @tUserno is null
  set @tUserno=1
   Insert into TempSalMas_Table (smas_no,smas_slno,smas_rtno,smas_billprefix,smas_billsuffix,smas_billno,Smas_Bill,smas_billdate,smas_billtime,smas_days,Mechanic_no,MechCommi_Amt,MechCommi_Per,SmanCommi_Amt,SManCommi_Per,MechCommiTax_Per,Smas_SmanNo,dc_no,dc_date,order_no,reference_date,reference_no,Vehicle_no,Smas_Others1,Smas_others2,smas_others3,smas_others4,UserNo,ctr_no,Godown_no,party_no,Customer_no,smas_name,smas_add1,smas_add2,smas_add3,smas_add4,smas_add5,smas_st,smas_cst,smas_cashmode,Smas_salmode,smas_saltype,smas_ordertype,smas_addled1,smas_addled2,smas_addled3,smas_addled4,smas_adddet1,smas_adddet2,smas_adddet3,smas_adddet4,smas_adddisc1,smas_adddisc2,smas_adddisc3,smas_adddisc4,smas_adddiscr1,smas_adddiscr2,smas_adddiscr3,smas_adddiscr4,smas_addamt1,smas_addamt2,smas_addamt3,smas_addamt4,smas_Gross,smas_GrossAmount,BankCharge,smas_NetAmount,smas_rcvdamount,smas_remarks,smas_Cancel,smas_cremark,smas_rounded,CashReceived,Profit,Update_Flag,Tax_Refund,Print_no,smas_point,smas_issue,smas_paidAmt,smas_Touch,smas_TotalCash,smas_TotalCredit,smas_TotalNets,Loaditem,Smas_columns,VoucherSno,SalesVchNo,ReceiptVchNo,CrNoteVchNo,CardSno,CardNo) values 
   (@tStrnNo,'0','0','','',@tBillNo,@tBillNo,@tCurrentDate,@tCurrentTime,'0','1','0','0','0','0','0','0','0','1999-01-01','','','','','','','','',@tUserno,@tCounter,'2','2','0','Cash Sales','','','','','','','','1','0','0','0','0','0','0','0','','','','','0','0','0','0','0','0','0','0','0','0','0','0',@tGrossAmt,@tGrossAmt,'0',@tNetAmt,@tNetAmt,'','0','',@RoundValue,'0',@Profit,'0','0','0','0','1',@tNetAmt,'True',@tNetAmt,'0','0','0','',@tVoucherNo,@tBillNo,'0','0','0','')
   
   
   
Select @tStrnNo=(max(strnno)+1) from Numbertable
Declare @tFreeSno Numeric(18,2)=0;
Declare @tCtl_FreeQty  bit=0;
Declare @tRprop varchar(100);
Declare @tLabourCommiLedger numeric(18,0)=0;
Declare @tCommissionPercent Numeric(18,2)=0;
Declare @tCommissionAmt numeric(18,2)=0.00;
Select @tLabourCommiLedger=(case when LabourCommiLedger is null then 0 Else LabourCommiLedger End) from Control_table

open c
fetch from c into @ItemName,@Qty,@Rate,@Amt,@Disc
while @@fetch_status=0
begin
  Select @tStrnSno=(max(strnsno)+1) from Numbertable
  Select @tItemNo=Item_no,@tTaxNo=Tax_no,@tUnitNo=Unit_no from Item_table where Item_name=@ItemName;
  SELECT @tTaxPercent=Nt_Percent,@tLedgerNo1=NtLedger_No from Tax_Table where Tax_No=@tTaxNo;    
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  
  if @tLabourCommiLedger<>0
  begin
  Select @tCommissionPercent=(case when Commission is null then 0 else commission end) from Item_GroupTable where Item_groupno=(Select Item_groupno from Item_table where Item_no=@tItemNo)
  set @tCommissionAmt=((@Qty*@Rate)*@tCommissionPercent)/100;
  end
  
  Select @tRprop=Rprop from Rptset where Rdesc='Display Tax Type'
  if @tRprop='Exclusive'
  begin
  Set @tTaxAmt=((@Qty*@Rate)*(@tTaxPercent/100));
  End
  if @tRprop='Inclusive'
  begin
  Set @tTaxAmt=(@Qty*@Rate)- (((@Qty*@Rate)*100)/(100+@tTaxPercent));
  end
  if @tRprop='NoTax'
  begin
  Set @tTaxAmt=0
  set @tTaxNo=1
  set @tTaxPercent=0
  end
  
   --Free Item Code Start
  Select @tCtl_FreeQty= Ctl_FreeQty from Control_table
  if @tCtl_FreeQty=1
  begin 
  if Exists (Select * from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType='Item Price' and Item_Name=@ItemName)
  End
  Else  
  Begin
   set @tFreeSno=(Select Top 1 (FreeSno) from tempView where FreeType<>'Item Price' and Item_Name=@ItemName)
  End
  if  @tFreeSno is null
  set @tFreeSno=0
  End
  -- Free Item Code End
  
  Select @tItemNo=Item_no,@tItemCost=Item_cost ,@tOpenItem=OpenItem from Item_table where Item_name=@ItemName;
    Set @tTotItemCost=(@tItemCost*@Qty);
    Set @tTotItemRate=(@Amt);
  if @tOpenItem='True'
  select @tOpenItemCount=COUNT(*) from Tempstktrn_table where item_no=(select item_no from Item_table where Item_name=@ItemName) and strn_no=@tStrnNo  
  ELSE
  set @tOpenItemCount=1
    
  INSERT INTO tempstktrn_table (strn_sno,strn_no,strn_rtno,strn_type,strn_date,Godown_BillNo,StrnParty_no,Grn_no,OrderSno,Dc_no,item_no,ctr_no,godown_no,Unit_no,Unit_Ratio,QtyInPieces,nt_qty,tx_qty,Short_qty,rnt_qty,rtx_qty,Invnt_qty,Invtx_qty,QtyDetails,Rate,Tax_Rate,CurrencyNo,CurrencyValue,Amount,Tax_No,Disc_PerQty,Disc_Per,Disc_Amt,Adldisc_Per,Adldisc_Amt,Othdisc_Amt,OthPurdisc,Ed_PerQty,Ed_Per,Ed_Amt,Cess_Per,Cess_Amt,SHECess_Per,SHECess_Amt,HL_Per,HL_Amt,CST_per,CST_amt,tax_Flag,tax_per,tax_amt,Sur_per,Sur_amt,CommiPer,Commi,SmanPer,SmanAmt,spl_discamt,tot_amt,alp1,alp2,alp3,alp4,ala1,ala2,ala3,ala4,Net_Amt,Other_Exp,BillOther_Exp,strn_remarks,Strn_Cancel,Order_Ack,Cost,Mrsp,Margin,Margin_No,Srate,Frtx_Qty,RFrnt_Qty,RFrtx_Qty,Frnt_Qty,FreeQty,FreeItemNo,Profit,Item_Point,Mech_no,PurRate,OpenItem,OpenItemCount) values
   (@tStrnSno,@tStrnNo,'0','1', @tCurrentDate,'0','2','0','0','0',@tItemNo,@tCounter,'2',@tUnitNo,'1','0',@Qty,'0','0','0','0','0','0','',@Rate,'0','0','0',@Amt,@tTaxNo,'0','0',@Disc,'0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0',@tTaxPercent,@tTaxAmt,'0','0',@tCommissionPercent,@tCommissionAmt,'0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0','0','0','0','0','0','0',(Case when @tRprop='Inclusive' then @Amt Else (@Amt+@tTaxAmt) END),'0','0',@tRprop,'0','0','0','0','0','0','0','0','0','0','0','0',@tFreeSno,(@tTotItemRate-@tTotItemCost),'0','0','0',@tOpenItem,@tOpenItemCount);
  update Numbertable set strnsno=strnsno+1;

  select @tNetSalAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=1
  select @tNetSalRetAmt=sum(net_amt) from Tempstktrn_table where item_no=@tItemNo and strn_type=2
  if @tNetSalAmt is null
    set @tNetSalAmt=0;
  if @tNetSalRetAmt is null  
  set @tNetSalRetAmt=0;
  update Item_Table set nt_salqty=nt_salqty+@Qty,nt_cloqty=nt_cloqty-@Qty,Nt_Salval=(@tNetSalAmt-@tNetSalRetAmt), Nt_SalRetval=@tNetSalRetAmt where Item_no=@tItemNo;
  fetch next from c into @ItemName,@Qty,@Rate,@Amt,@Disc
end
close c
deallocate c
Update NumberTable set SalRecv_Sno=SalRecv_Sno+1,strnno=strnno+1;

Select @tSalesCount=(Max(Vch_BillNo)) from VoucherNo_table where Vch_type='12'

if exists (Select * from TempVch_table)
Select @tVchRefNo=(max(Ref_no)+1) from TempVch_table
else
Select @tVchRefNo=(max(Ref_no)+1) from Vch_table
if @tVchRefNo is Null
Set @tVchRefNo=1;

select @tVoucherNoNew=(max(VoucherNo)+1) from NumberTable

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
Insert into tempVch_Table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12','5',@tLedgerNo1,@tNetAmt,'0','','','0','','0')
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable;

Set @tCHK=(@tNetAmt-@tDiscount)-(@tGrossAmt+@tTotTax);
if(@tCHK<0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12','6','5',-@RoundValue,'0','','','0','','0')
else if(@tCHK>0)
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12','6','5','0',@RoundValue,'','','0','','0')

Update NumberTable set VoucherSno=VoucherSno+1;

DECLARE c1 CURSOR LOCAL READ_ONLY FOR select Tax_Per As Tax,Tax_No from Tempstktrn_table where strn_no=@tStrnNo group by tax_per,Tax_No
open c1
fetch from c1 into @tTax,@tTaxNumber
while @@fetch_status=0
begin
select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedgerNo1=NtLedger_No from Tax_table where Nt_Percent=@tTax and Tax_no=@tTaxNumber
select @tSingleTaxAmt=sum(Tax_Amt) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12',@tLedgerNo1,'5','0',@tSingleTaxAmt,'','','0','','0')
  set @tSingleTaxAmtNew=0;
 if @tTax <>0
 select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
 
Update NumberTable set VoucherSno=VoucherSno+1;

select @tVoucherSno=(max(VoucherSno)+1) from NumberTable
select @tLedsel_name=Ledsel_name from Ledsel_table where Ledger_no=@tLedgerNo1;
IF @tLedsel_name is null
BEGIN
SET @tLedgerNo1New='0'
SET @tLedgerNo1New=0;
select @tSingleTaxAmtNew=sum(Rate*nt_qty) from Tempstktrn_table where tax_Per=@tTax and strn_no=@tStrnNo;
END
ELSE
BEGIN
IF CHARINDEX ('%',@tLedsel_name)=0
SET @tSub=@tLedsel_name
ELSE
SELECT @tSub=LEFT(@tLedsel_name, CHARINDEX('%',@tLedsel_name)-1);
Select @tLedgerNo1New=Ledger_no from Ledsel_table where Ledsel_name like @tSub+'%' and Ledger_no<>@tLedgerNo1
END
Insert into TempVch_table (Sno,Vch_Sno,Vch_Pre,Vch_NoLong,Vch_Suf,Vch_No,Vch_MtNo,Ctr_no,UserNo,RepNo,Vch_Party,ref_no,ref_det,Vch_Date,Vch_type,ledger_no,ledger_no1,Dr_amount,Cr_amount,Vch_Remarks,Vch_IndRemarks,Vch_Cancel,Vch_CRemarks,Vch_flag) Values
 (@tVoucherSno,@tVoucherNoNew,'',@tSalesCount,'',@tSalesCount,@tSalesCount,@tCounter,@tUserno,'1','5',@tVchRefNo,'1',@tCurrentDate,'12',@tLedgerNo1New,'5','0',@tSingleTaxAmtNew,'','','0','','0')


Update NumberTable set VoucherSno=VoucherSno+1;
fetch next from c1 into @tTax,@tTaxNumber
end
close c1
deallocate c1 
   
--Free Item Code Start   
open c3
Declare @tFreeItemNo numeric(18,0);
Declare @tFreeMainItemNo numeric(18,0);
Declare @tFreeOfferNo numeric(18,0);
fetch from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
while @@fetch_status=0
begin
Select @tFreeItemNo=Item_no from Item_table where Item_name=@tItemNameFree
Select @tFreeMainItemNo=Item_no from Item_table where Item_name=@tMainItemNameFree
select @tFreeOfferNo=FreeSno from FreeItemMaster_table where OfferName=@tOfferNameFree
INSERT INTO [dbo].[SalFreeItemDetail_table]([smas_no] ,[smas_billno],[FreeItem_no],[TotFreeQty],[TotScannedQty],[MainItem_no],[OfferNo],[OfferFreeQty],[TotSaleQty],[smas_BillDate],[Ctr_no])
VALUES(@tStrnNo,@tBillNo,@tFreeItemNo,@tQtyFree,@tScannedQtyFree,@tFreeMainItemNo,@tFreeOfferNo,@tOfferFreeQtyFree,@tTotSaleQtyFree,@tCurrentDate,@tCounter)
fetch Next from c3 into @tItemNameFree,@tQtyFree,@tScannedQtyFree,@tMainItemNameFree,@tOfferNameFree,@tOfferFreeQtyFree,@tTotSaleQtyFree
End
close c3
deallocate c3
--Free Item Code End   

   DECLARE @tDiscountId numeric(18,0);
   select @tDiscountId=(MAX(DiscountEntry_Id)+1) from NumberTable;
  INSERT INTO TempDiscountDetail_table([Discount_Id],[Type],[Date],[Bill_no],[Amount],[GrossAmount]) VALUES
           (@tDiscountId,@DiscountType,@tCurrentDate,@tBillNo,@tDiscount,@tGrossAmt);

   Update VoucherNo_table set Vch_BillNo=Vch_BillNo+1 where Vch_Type='12';
   Update Numbertable set VoucherNo=VoucherNo+3,DiscountEntry_Id=DiscountEntry_Id+1;
   
   IF @TranCounter = 0           
      COMMIT TRANSACTION;
   END TRY
   
   BEGIN CATCH
   IF @TranCounter = 0         
      ROLLBACK TRANSACTION;
   ELSE
      IF XACT_STATE() <> -1        
         ROLLBACK TRANSACTION ProcedureSave;        
      DECLARE @ErrorMessage NVARCHAR(4000);
      DECLARE @ErrorSeverity INT;
      DECLARE @ErrorState INT;

      SELECT @ErrorMessage = ERROR_MESSAGE();
      SELECT @ErrorSeverity = ERROR_SEVERITY();
      SELECT @ErrorState = ERROR_STATE();

      RAISERROR (@ErrorMessage, -- Message text.
                 @ErrorSeverity, -- Severity.
                 @ErrorState -- State.
                 );
    END CATCH
GO

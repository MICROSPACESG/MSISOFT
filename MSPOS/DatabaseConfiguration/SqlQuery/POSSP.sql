
Create PROCEDURE [dbo].[sp_Brand_Insert]
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
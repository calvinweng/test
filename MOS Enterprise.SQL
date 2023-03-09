IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_InsEnterpriseProjectDetail')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_InsEnterpriseProjectDetail
GO

CREATE PROCEDURE SP_InsEnterpriseProjectDetail
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO dbo.EnterpriseProjectDetail
			( EProjectID
			, [Name]
			, MobilePhoneNo
			, EMail
			, MID
			, RID
			, TID
			, SalesNo
			, OrderDate
			, OrderNo
			, VoucherUID
			, VoucherNo
			, TxStatusID
			, [UID]
			, IsUpload
			, UploadDate
			, AccountVerifyCode
			, MemberAccount
			, MemberAccountTime
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyRetCode
			, SMSNotifyRetMsg
			, PushNotify
			, PushNotifyTime
			, PushNotifyRetCode
			, PushNotifyRetMsg
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted)
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectDetailLog
		VALUES
			( @EProjectID
			, @Name
			, @MobilePhoneNo
			, @EMail
			, @MID
			, @RID
			, @TID
			, @SalesNo
			, @OrderDate
			, @OrderNo
			, @VoucherUID
			, @VoucherNo
			, @TxStatusID
			, @UID
			, @IsUpload
			, @UploadDate
			, @AccountVerifyCode
			, @MemberAccount
			, @MemberAccountTime
			, @SMSNotify
			, @SMSNotifyTime
			, @SMSNotifyRetCode
			, @SMSNotifyRetMsg
			, @PushNotify
			, @PushNotifyTime
			, @PushNotifyRetCode
			, @PushNotifyRetMsg
			, @CreateUser
			, @CreateDate
			, @UpdateUser
			, @UpdateDate
			, @IsDeleted)
		
		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectDetail')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectDetail
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectDetail
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProjectDetail
			SET EProjectID = @EProjectID
				, Name = @Name
				, MobilePhoneNo = @MobilePhoneNo
				, EMail = @EMail
				, MID = @MID
				, RID = @RID
				, TID = @TID
				, SalesNo = @SalesNo
				, OrderDate = @OrderDate
				, OrderNo = @OrderNo
				, VoucherUID = @VoucherUID
				, VoucherNo = @VoucherNo
				, TxStatusID = @TxStatusID
				, UID = @UID
				, IsUpload = @IsUpload
				, UploadDate = @UploadDate
				, AccountVerifyCode = @AccountVerifyCode
				, MemberAccount = @MemberAccount
				, MemberAccountTime = @MemberAccountTime
				, SMSNotify = @SMSNotify
				, SMSNotifyTime = @SMSNotifyTime
				, SMSNotifyRetCode = @SMSNotifyRetCode
				, SMSNotifyRetMsg = @SMSNotifyRetMsg
				, PushNotify = @PushNotify
				, PushNotifyTime = @PushNotifyTime
				, PushNotifyRetCode = @PushNotifyRetCode
				, PushNotifyRetMsg = @PushNotifyRetMsg
				, CreateUser = @CreateUser
				, CreateDate = @CreateDate
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
				, IsDeleted = @IsDeleted
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND Name = @Name
			AND MobilePhoneNo = @MobilePhoneNo
			AND EMail = @EMail
			AND MID = @MID
			AND RID = @RID
			AND TID = @TID
			AND SalesNo = @SalesNo
			AND OrderDate = @OrderDate
			AND OrderNo = @OrderNo
			AND VoucherUID = @VoucherUID
			AND VoucherNo = @VoucherNo
			AND TxStatusID = @TxStatusID
			AND UID = @UID
			AND IsUpload = @IsUpload
			AND UploadDate = @UploadDate
			AND AccountVerifyCode = @AccountVerifyCode
			AND MemberAccount = @MemberAccount
			AND MemberAccountTime = @MemberAccountTime
			AND SMSNotify = @SMSNotify
			AND SMSNotifyTime = @SMSNotifyTime
			AND SMSNotifyRetCode = @SMSNotifyRetCode
			AND SMSNotifyRetMsg = @SMSNotifyRetMsg
			AND PushNotify = @PushNotify
			AND PushNotifyTime = @PushNotifyTime
			AND PushNotifyRetCode = @PushNotifyRetCode
			AND PushNotifyRetMsg = @PushNotifyRetMsg
			AND CreateUser = @CreateUser
			AND CreateDate = @CreateDate
			AND UpdateUser = @UpdateUser
			AND UpdateDate = @UpdateDate
			AND IsDeleted = @IsDeleted

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectDetailByMobilePhoneNo')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectDetailByMobilePhoneNo
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectDetailByMobilePhoneNo
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProjectDetail
			SET VoucherUID = @VoucherUID
				, VoucherNo = @VoucherNo
				, TxStatusID = @TxStatusID
				, UID = @UID
				, AccountVerifyCode = @AccountVerifyCode
				, MemberAccount = @MemberAccount
				, SMSNotify = @SMSNotify
				, PushNotify = @PushNotify
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID
			AND MobilePhoneNo = @MobilePhoneNo

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectDetailByVoucherNo')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectDetailByVoucherNo
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectDetailByVoucherNo
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProjectDetail
			SET Name = @Name
				, MobilePhoneNo = @MobilePhoneNo
				, EMail = @EMail
				, UID = @UID
				, AccountVerifyCode = @AccountVerifyCode
				, MemberAccount = @MemberAccount
				, SMSNotify = @SMSNotify
				, PushNotify = @PushNotify
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID
			AND VoucherNo = @VoucherNo

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectDetailSMSByVoucherNo')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectDetailSMSByVoucherNo
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectDetailSMSByVoucherNo
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProjectDetail
			SET SMSNotifyTime = @SMSNotifyTime
				, SMSNotifyRetCode = @SMSNotifyRetCode
				, SMSNotifyRetMsg = @SMSNotifyRetMsg
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
				, IsDeleted = @IsDeleted
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID
			AND VoucherNo = @VoucherNo

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectDetailPushByVoucherNo')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectDetailPushByVoucherNo
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectDetailPushByVoucherNo
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProjectDetail
			SET PushNotifyTime = @PushNotifyTime
				, PushNotifyRetCode = @PushNotifyRetCode
				, PushNotifyRetMsg = @PushNotifyRetMsg
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND VoucherNo = @VoucherNo

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectDetailMemberAccountByUID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectDetailMemberAccountByUID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectDetailMemberAccountByUID
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DECLARE
			@pAccountVerifyCode varchar(20)
			, @RetCode int
			
		SET @RetCode = 0
		SELECT @pAccountVerifyCode = AccountVerifyCode, @VoucherNo = VoucherNo FROM dbo.EnterpriseProjectDetail WITH (NOLOCK) WHERE MID = @MID AND AccountVerifyCode = @AccountVerifyCode
		
		IF @pAccountVerifyCode = @AccountVerifyCode AND @VoucherNo <> NULL
		BEGIN
			UPDATE dbo.EnterpriseProjectDetail
				SET UID = @UID
					, MemberAccount = @MemberAccount
					, MemberAccountTime = @MemberAccountTime
					, UpdateUser = @UpdateUser
					, UpdateDate = @UpdateDate
			OUTPUT INSERTED.* INTO dbo.EnterpriseProjectDetailLog
			WHERE MID = @MID
				AND VoucherNo = @VoucherNo
				
			UPDATE dbo.GiftVoucher
				SET UID = @UID
			WHERE MID = @MID
				AND VoucherNo = @VoucherNo

			UPDATE dbo.VoucherMaster
				SET UID = @UID
			OUTPUT INSERTED.* INTO dbo.VoucherMasterLog
			WHERE MID = @MID
				AND VoucherNo = @VoucherNo
				
			RETURN 0		
		END
		ELSE
		BEGIN
			RETURN 1181
		END		
		
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProjectDetail')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProjectDetail
GO

CREATE PROCEDURE SP_GetEnterpriseProjectDetail
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, [Name]
			, MobilePhoneNo
			, EMail
			, MID
			, RID
			, TID
			, SalesNo
			, OrderDate
			, OrderNo
			, VoucherUID
			, VoucherNo
			, TxStatusID
			, [UID]
			, IsUpload
			, UploadDate
			, AccountVerifyCode
			, MemberAccount
			, MemberAccountTime
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyRetCode
			, SMSNotifyRetMsg
			, PushNotify
			, PushNotifyTime
			, PushNotifyRetCode
			, PushNotifyRetMsg
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProjectDetail WITH(NOLOCK)
		WHERE EProjectID = @EProjectID
			AND Name = @Name
			AND MobilePhoneNo = @MobilePhoneNo
			AND EMail = @EMail
			AND MID = @MID
			AND RID = @RID
			AND TID = @TID
			AND SalesNo = @SalesNo
			AND OrderDate = @OrderDate
			AND OrderNo = @OrderNo
			AND VoucherUID = @VoucherUID
			AND VoucherNo = @VoucherNo
			AND TxStatusID = @TxStatusID
			AND UID = @UID
			AND IsUpload = @IsUpload
			AND UploadDate = @UploadDate
			AND AccountVerifyCode = @AccountVerifyCode
			AND MemberAccount = @MemberAccount
			AND MemberAccountTime = @MemberAccountTime
			AND SMSNotify = @SMSNotify
			AND SMSNotifyTime = @SMSNotifyTime
			AND SMSNotifyRetCode = @SMSNotifyRetCode
			AND SMSNotifyRetMsg = @SMSNotifyRetMsg
			AND PushNotify = @PushNotify
			AND PushNotifyTime = @PushNotifyTime
			AND PushNotifyRetCode = @PushNotifyRetCode
			AND PushNotifyRetMsg = @PushNotifyRetMsg
			AND CreateUser = @CreateUser
			AND CreateDate = @CreateDate
			AND UpdateUser = @UpdateUser
			AND UpdateDate = @UpdateDate
			AND IsDeleted = @IsDeleted

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProjectDetailByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProjectDetailByEProjectID
GO

CREATE PROCEDURE SP_GetEnterpriseProjectDetailByEProjectID
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, [Name]
			, MobilePhoneNo
			, EMail
			, MID
			, RID
			, TID
			, SalesNo
			, OrderDate
			, OrderNo
			, VoucherUID
			, VoucherNo
			, TxStatusID
			, [UID]
			, IsUpload
			, UploadDate
			, AccountVerifyCode
			, MemberAccount
			, MemberAccountTime
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyRetCode
			, SMSNotifyRetMsg
			, PushNotify
			, PushNotifyTime
			, PushNotifyRetCode
			, PushNotifyRetMsg
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProjectDetail WITH(NOLOCK)
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProjectDetailByEProjectIDVoucherNo')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProjectDetailByEProjectIDVoucherNo
GO

CREATE PROCEDURE SP_GetEnterpriseProjectDetailByEProjectIDVoucherNo
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, [Name]
			, MobilePhoneNo
			, EMail
			, MID
			, RID
			, TID
			, SalesNo
			, OrderDate
			, OrderNo
			, VoucherUID
			, VoucherNo
			, TxStatusID
			, [UID]
			, IsUpload
			, UploadDate
			, AccountVerifyCode
			, MemberAccount
			, MemberAccountTime
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyRetCode
			, SMSNotifyRetMsg
			, PushNotify
			, PushNotifyTime
			, PushNotifyRetCode
			, PushNotifyRetMsg
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProjectDetail WITH(NOLOCK)
		WHERE EProjectID = @EProjectID
			AND MID = @MID
			AND VoucherNo = @VoucherNo

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterpriseProjectDetail')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterpriseProjectDetail
GO

CREATE PROCEDURE SP_DelEnterpriseProjectDetail
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DELETE FROM dbo.EnterpriseProjectDetail
		OUTPUT DELETED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND Name = @Name
			AND MobilePhoneNo = @MobilePhoneNo
			AND EMail = @EMail
			AND MID = @MID
			AND RID = @RID
			AND TID = @TID
			AND SalesNo = @SalesNo
			AND OrderDate = @OrderDate
			AND OrderNo = @OrderNo
			AND VoucherUID = @VoucherUID
			AND VoucherNo = @VoucherNo
			AND TxStatusID = @TxStatusID
			AND UID = @UID
			AND IsUpload = @IsUpload
			AND UploadDate = @UploadDate
			AND AccountVerifyCode = @AccountVerifyCode
			AND MemberAccount = @MemberAccount
			AND MemberAccountTime = @MemberAccountTime
			AND SMSNotify = @SMSNotify
			AND SMSNotifyTime = @SMSNotifyTime
			AND SMSNotifyRetCode = @SMSNotifyRetCode
			AND SMSNotifyRetMsg = @SMSNotifyRetMsg
			AND PushNotify = @PushNotify
			AND PushNotifyTime = @PushNotifyTime
			AND PushNotifyRetCode = @PushNotifyRetCode
			AND PushNotifyRetMsg = @PushNotifyRetMsg
			AND CreateUser = @CreateUser
			AND CreateDate = @CreateDate
			AND UpdateUser = @UpdateUser
			AND UpdateDate = @UpdateDate
			AND IsDeleted = @IsDeleted

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterpriseProjectDetailByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterpriseProjectDetailByEProjectID
GO

CREATE PROCEDURE SP_DelEnterpriseProjectDetailByEProjectID
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		-- TODO: Cursor to get data, and check VoucherMaster to gen. txnlist
		
		DELETE FROM dbo.EnterpriseProjectDetail
		OUTPUT DELETED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterpriseProjectDetailByVoucherNo')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterpriseProjectDetailByVoucherNo
GO

CREATE PROCEDURE SP_DelEnterpriseProjectDetailByVoucherNo
	  @EProjectID varchar(20)
	, @Name nvarchar(20)
	, @MobilePhoneNo varchar(15)
	, @EMail varchar(50)
	, @MID varchar(15)
	, @RID varchar(15)
	, @TID varchar(15)
	, @SalesNo varchar(20)
	, @OrderDate varchar(19)
	, @OrderNo varchar(20)
	, @VoucherUID varchar(50)
	, @VoucherNo varchar(20)
	, @TxStatusID varchar(20)
	, @UID varchar(50)
	, @IsUpload varchar(1)
	, @UploadDate datetime
	, @AccountVerifyCode varchar(20)
	, @MemberAccount varchar(1)
	, @MemberAccountTime datetime
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyRetCode varchar(20)
	, @SMSNotifyRetMsg nvarchar(50)
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyRetCode varchar(20)
	, @PushNotifyRetMsg nvarchar(50)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		-- TODO: get data first, and check VoucherMaster to gen. txnlist
		DELETE FROM dbo.EnterpriseProjectDetail
		OUTPUT DELETED.* INTO dbo.EnterpriseProjectDetailLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID
			AND VoucherNo = @VoucherNo

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_InsEnterprise')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_InsEnterprise
GO

CREATE PROCEDURE SP_InsEnterprise
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		IF EXISTS(SELECT COUNT(1) FROM dbo.Enterprise WITH (NOLOCK) WHERE BAN = @BAN)
		BEGIN
			RETURN 285
		END
		ELSE
		BEGIN
			INSERT INTO dbo.Enterprise
				( MID
				, EID
				, EName
				, TaxNo
				, BAN
				, TEL
				, Postal
				, Country
				, City
				, Address
				, Contact
				, EMailAddress
				, CreateUser
				, CreateDate
				, UpdateUser
				, UpdateDate
				, IsDeleted)
			OUTPUT INSERTED.* INTO dbo.EnterpriseLog
			VALUES
				( @MID
				, @EID
				, @EName
				, @TaxNo
				, @BAN
				, @TEL
				, @Postal
				, @Country
				, @City
				, @Address
				, @Contact
				, @EMailAddress
				, @CreateUser
				, @CreateDate
				, @UpdateUser
				, @UpdateDate
				, @IsDeleted)

			RETURN 0
		END
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterprise')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterprise
GO

CREATE PROCEDURE SP_UpdEnterprise
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.Enterprise
			SET MID = @MID
				, EID = @EID
				, EName = @EName
				, TaxNo = @TaxNo
				, BAN = @BAN
				, TEL = @TEL
				, Postal = @Postal
				, Country = @Country
				, City = @City
				, Address = @Address
				, Contact = @Contact
				, EMailAddress = @EMailAddress
				, CreateUser = @CreateUser
				, CreateDate = @CreateDate
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
				, IsDeleted = @IsDeleted
		OUTPUT INSERTED.* INTO dbo.EnterpriseLog
		WHERE MID = @MID
			AND EID = @EID
			AND EName = @EName
			AND TaxNo = @TaxNo
			AND BAN = @BAN
			AND TEL = @TEL
			AND Postal = @Postal
			AND Country = @Country
			AND City = @City
			AND Address = @Address
			AND Contact = @Contact
			AND EMailAddress = @EMailAddress
			AND CreateUser = @CreateUser
			AND CreateDate = @CreateDate
			AND UpdateUser = @UpdateUser
			AND UpdateDate = @UpdateDate
			AND IsDeleted = @IsDeleted

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseByEID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseByEID
GO

CREATE PROCEDURE SP_UpdEnterpriseByEID
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.Enterprise
			SET MID = @MID
				, EName = @EName
				, TaxNo = @TaxNo
				, BAN = @BAN
				, TEL = @TEL
				, Postal = @Postal
				, Country = @Country
				, City = @City
				, Address = @Address
				, Contact = @Contact
				, EMailAddress = @EMailAddress
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseLog
		WHERE MID = @MID
			AND EID = @EID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseByBAN')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseByBAN
GO

CREATE PROCEDURE SP_UpdEnterpriseByBAN
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.Enterprise
			SET MID = @MID
				, EID = @EID
				, EName = @EName
				, TaxNo = @TaxNo
				, TEL = @TEL
				, Postal = @Postal
				, Country = @Country
				, City = @City
				, Address = @Address
				, Contact = @Contact
				, EMailAddress = @EMailAddress
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseLog
		WHERE MID = @MID
			AND BAN = @BAN

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterprise')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterprise
GO

CREATE PROCEDURE SP_GetEnterprise
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  MID
			, EID
			, EName
			, TaxNo
			, BAN
			, TEL
			, Postal
			, Country
			, City
			, Address
			, Contact
			, EMailAddress
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.Enterprise WITH(NOLOCK)
		WHERE MID = @MID
		ORDER BY EID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseByEID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseByEID
GO

CREATE PROCEDURE SP_GetEnterpriseByEID
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  MID
			, EID
			, EName
			, TaxNo
			, BAN
			, TEL
			, Postal
			, Country
			, City
			, Address
			, Contact
			, EMailAddress
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.Enterprise WITH(NOLOCK)
		WHERE MID = @MID
			AND EID = @EID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseByBAN')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseByBAN
GO

CREATE PROCEDURE SP_GetEnterpriseByBAN
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  MID
			, EID
			, EName
			, TaxNo
			, BAN
			, TEL
			, Postal
			, Country
			, City
			, Address
			, Contact
			, EMailAddress
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.Enterprise WITH(NOLOCK)
		WHERE MID = @MID
			AND BAN = @BAN

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterprise')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterprise
GO

CREATE PROCEDURE SP_DelEnterprise
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DELETE FROM dbo.Enterprise
		OUTPUT DELETED.* INTO dbo.EnterpriseLog
		WHERE MID = @MID
			AND EID = @EID
			AND EName = @EName
			AND TaxNo = @TaxNo
			AND BAN = @BAN
			AND TEL = @TEL
			AND Postal = @Postal
			AND Country = @Country
			AND City = @City
			AND Address = @Address
			AND Contact = @Contact
			AND EMailAddress = @EMailAddress
			AND CreateUser = @CreateUser
			AND CreateDate = @CreateDate
			AND UpdateUser = @UpdateUser
			AND UpdateDate = @UpdateDate
			AND IsDeleted = @IsDeleted

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterpriseByBAN')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterpriseByBAN
GO

CREATE PROCEDURE SP_DelEnterpriseByBAN
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DELETE FROM dbo.Enterprise
		OUTPUT DELETED.* INTO dbo.EnterpriseLog
		WHERE MID = @MID
			AND BAN = @BAN

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterpriseByEID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterpriseByEID
GO

CREATE PROCEDURE SP_DelEnterpriseByEID
	  @MID varchar(15)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @TaxNo varchar(15)
	, @BAN varchar(15)
	, @TEL varchar(15)
	, @Postal varchar(5)
	, @Country varchar(10)
	, @City varchar(10)
	, @Address nvarchar(50)
	, @Contact nvarchar(10)
	, @EMailAddress varchar(80)
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DELETE FROM dbo.Enterprise
		OUTPUT DELETED.* INTO dbo.EnterpriseLog
		WHERE MID = @MID
			AND EID = @EID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_InsEnterpriseProject')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_InsEnterpriseProject
GO

CREATE PROCEDURE SP_InsEnterpriseProject
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		INSERT INTO dbo.EnterpriseProject
			( EProjectID
			, EProjectName
			, EID
			, EName
			, MID
			, MName
			, PromotionID
			, PromotionName
			, PromotionTypeID
			, PromotionTypeName
			, ProgramID
			, ProgramName
			, ProductID
			, ProductName
			, Description
			, PreviewImageURL
			, ImageURL
			, UseStartDate
			, UseEndDate
			, Quantity
			, Unit
			, UnitPrice
			, Price
			, ImportPhone
			, MemberAmt
			, DiscountAmt
			, PurchaseQty
			, PurchaseAmt
			, MemberAccount
			, MemberAccounted
			, UnMemberAccount
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyContent
			, SMSOK
			, SMSFailed
			, PushNotify
			, PushNotifyTime
			, PushNotifyContent
			, PushOK
			, PushFalied
			, IssuedQty
			, IssuedAmt
			, InvoiceType
			, InvoiceNumber
			, StatusID
			, ExportResult
			, ExportDate
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted)
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		VALUES
			( @EProjectID
			, @EProjectName
			, @EID
			, @EName
			, @MID
			, @MName
			, @PromotionID
			, @PromotionName
			, @PromotionTypeID
			, @PromotionTypeName
			, @ProgramID
			, @ProgramName
			, @ProductID
			, @ProductName
			, @Description
			, @PreviewImageURL
			, @ImageURL
			, @UseStartDate
			, @UseEndDate
			, @Quantity
			, @Unit
			, @UnitPrice
			, @Price
			, @ImportPhone
			, @MemberAmt
			, @DiscountAmt
			, @PurchaseQty
			, @PurchaseAmt
			, @MemberAccount
			, @MemberAccounted
			, @UnMemberAccount
			, @SMSNotify
			, @SMSNotifyTime
			, @SMSNotifyContent
			, @SMSOK
			, @SMSFailed
			, @PushNotify
			, @PushNotifyTime
			, @PushNotifyContent
			, @PushOK
			, @PushFalied
			, @IssuedQty
			, @IssuedAmt
			, @InvoiceType
			, @InvoiceNumber
			, @StatusID
			, @ExportResult
			, @ExportDate
			, @CreateUser
			, @CreateDate
			, @UpdateUser
			, @UpdateDate
			, @IsDeleted)

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProject')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProject
GO

CREATE PROCEDURE SP_UpdEnterpriseProject
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET EProjectID = @EProjectID
				, EProjectName = @EProjectName
				, EID = @EID
				, EName = @EName
				, MID = @MID
				, MName = @MName
				, PromotionID = @PromotionID
				, PromotionName = @PromotionName
				, PromotionTypeID = @PromotionTypeID
				, PromotionTypeName = @PromotionTypeName
				, ProgramID = @ProgramID
				, ProgramName = @ProgramName
				, ProductID = @ProductID
				, ProductName = @ProductName
				, Description = @Description
				, PreviewImageURL = @PreviewImageURL
				, ImageURL = @ImageURL
				, UseStartDate = @UseStartDate
				, UseEndDate = @UseEndDate
				, Quantity = @Quantity
				, Unit = @Unit
				, UnitPrice = @UnitPrice
				, Price = @Price
				, ImportPhone = @ImportPhone
				, MemberAmt = @MemberAmt
				, DiscountAmt = @DiscountAmt
				, PurchaseQty = @PurchaseQty
				, PurchaseAmt = @PurchaseAmt
				, MemberAccount = @MemberAccount
				, MemberAccounted = @MemberAccounted
				, UnMemberAccount = @UnMemberAccount
				, SMSNotify = @SMSNotify
				, SMSNotifyTime = @SMSNotifyTime
				, SMSNotifyContent = @SMSNotifyContent
				, SMSOK = @SMSOK
				, SMSFailed = @SMSFailed
				, PushNotify = @PushNotify
				, PushNotifyTime = @PushNotifyTime
				, PushNotifyContent = @PushNotifyContent
				, PushOK = @PushOK
				, PushFalied = @PushFalied
				, IssuedQty = @IssuedQty
				, IssuedAmt = @IssuedAmt
				, InvoiceType = @InvoiceType
				, InvoiceNumber = @InvoiceNumber
				, StatusID = @StatusID
				, ExportResult = @ExportResult
				, ExportDate = @ExportDate
				, CreateUser = @CreateUser
				, CreateDate = @CreateDate
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
				, IsDeleted = @IsDeleted
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND EProjectName = @EProjectName
			AND EID = @EID
			AND EName = @EName
			AND MID = @MID
			AND MName = @MName
			AND PromotionID = @PromotionID
			AND PromotionName = @PromotionName
			AND PromotionTypeID = @PromotionTypeID
			AND PromotionTypeName = @PromotionTypeName
			AND ProgramID = @ProgramID
			AND ProgramName = @ProgramName
			AND ProductID = @ProductID
			AND ProductName = @ProductName
			AND Description = @Description
			AND PreviewImageURL = @PreviewImageURL
			AND ImageURL = @ImageURL
			AND UseStartDate = @UseStartDate
			AND UseEndDate = @UseEndDate
			AND Quantity = @Quantity
			AND Unit = @Unit
			AND UnitPrice = @UnitPrice
			AND Price = @Price
			AND ImportPhone = @ImportPhone
			AND MemberAmt = @MemberAmt
			AND DiscountAmt = @DiscountAmt
			AND PurchaseQty = @PurchaseQty
			AND PurchaseAmt = @PurchaseAmt
			AND MemberAccount = @MemberAccount
			AND MemberAccounted = @MemberAccounted
			AND UnMemberAccount = @UnMemberAccount
			AND SMSNotify = @SMSNotify
			AND SMSNotifyTime = @SMSNotifyTime
			AND SMSNotifyContent = @SMSNotifyContent
			AND SMSOK = @SMSOK
			AND SMSFailed = @SMSFailed
			AND PushNotify = @PushNotify
			AND PushNotifyTime = @PushNotifyTime
			AND PushNotifyContent = @PushNotifyContent
			AND PushOK = @PushOK
			AND PushFalied = @PushFalied
			AND IssuedQty = @IssuedQty
			AND IssuedAmt = @IssuedAmt
			AND InvoiceType = @InvoiceType
			AND InvoiceNumber = @InvoiceNumber
			AND StatusID = @StatusID
			AND ExportResult = @ExportResult
			AND ExportDate = @ExportDate
			AND CreateUser = @CreateUser
			AND CreateDate = @CreateDate
			AND UpdateUser = @UpdateUser
			AND UpdateDate = @UpdateDate
			AND IsDeleted = @IsDeleted

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectUnIssuedByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectUnIssuedByEProjectID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectUnIssuedByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET EProjectName = @EProjectName
				, EID = @EID
				, EName = @EName
				, PromotionName = @PromotionName
				, PromotionTypeID = @PromotionTypeID
				, PromotionTypeName = @PromotionTypeName
				, ProgramName = @ProgramName
				, ProductID = @ProductID
				, ProductName = @ProductName
				, Description = @Description
				, PreviewImageURL = @PreviewImageURL
				, ImageURL = @ImageURL
				, UseStartDate = @UseStartDate
				, UseEndDate = @UseEndDate
				, Quantity = @Quantity
				, Unit = @Unit
				, UnitPrice = @UnitPrice
				, Price = @Price
				, ImportPhone = @ImportPhone
				, MemberAmt = @MemberAmt
				, DiscountAmt = @DiscountAmt
				, PurchaseQty = @PurchaseQty
				, PurchaseAmt = @PurchaseAmt
				, MemberAccount = @MemberAccount
				, SMSNotify = @SMSNotify
				, SMSNotifyTime = @SMSNotifyTime
				, SMSNotifyContent = @SMSNotifyContent
				, PushNotify = @PushNotify
				, PushNotifyTime = @PushNotifyTime
				, PushNotifyContent = @PushNotifyContent
				, InvoiceType = @InvoiceType
				, InvoiceNumber = @InvoiceNumber
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND EID = @EID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectIssuedByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectIssuedByEProjectID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectIssuedByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET UseStartDate = @UseStartDate
				, UseEndDate = @UseEndDate
				, InvoiceType = @InvoiceType
				, InvoiceNumber = @InvoiceNumber
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND EID = @EID
			AND MID = @MID
			
		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectMemberAccountByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectMemberAccountByEProjectID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectMemberAccountByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET MemberAccounted = @MemberAccounted
				, UnMemberAccount = @UnMemberAccount
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectSMSByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectSMSByEProjectID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectSMSByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET SMSOK = @SMSOK
				, SMSFailed = @SMSFailed
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectPushByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectPushByEProjectID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectPushByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET PushOK = @PushOK
				, PushFalied = @PushFalied
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectIssuedQtyByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectIssuedQtyByEProjectID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectIssuedQtyByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET IssuedQty = @IssuedQty
				, IssuedAmt = @IssuedQty * @DiscountAmt
				, StatusID = @StatusID
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_UpdEnterpriseProjectStatusIDByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_UpdEnterpriseProjectStatusIDByEProjectID
GO

CREATE PROCEDURE SP_UpdEnterpriseProjectStatusIDByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		UPDATE dbo.EnterpriseProject
			SET StatusID = @StatusID
				, UpdateUser = @UpdateUser
				, UpdateDate = @UpdateDate
		OUTPUT INSERTED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProject')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProject
GO

CREATE PROCEDURE SP_GetEnterpriseProject
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, EProjectName
			, EID
			, EName
			, MID
			, MName
			, PromotionID
			, PromotionName
			, PromotionTypeID
			, PromotionTypeName
			, ProgramID
			, ProgramName
			, ProductID
			, ProductName
			, Description
			, PreviewImageURL
			, ImageURL
			, UseStartDate
			, UseEndDate
			, Quantity
			, Unit
			, UnitPrice
			, Price
			, ImportPhone
			, MemberAmt
			, DiscountAmt
			, PurchaseQty
			, PurchaseAmt
			, MemberAccount
			, MemberAccounted
			, UnMemberAccount
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyContent
			, SMSOK
			, SMSFailed
			, PushNotify
			, PushNotifyTime
			, PushNotifyContent
			, PushOK
			, PushFalied
			, IssuedQty
			, IssuedAmt
			, InvoiceType
			, InvoiceNumber
			, StatusID
			, ExportResult
			, ExportDate
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProject WITH(NOLOCK)
		WHERE MID = @MID
		ORDER BY UseEndDate DESC

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProjectByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProjectByEProjectID
GO

CREATE PROCEDURE SP_GetEnterpriseProjectByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, EProjectName
			, EID
			, EName
			, MID
			, MName
			, PromotionID
			, PromotionName
			, PromotionTypeID
			, PromotionTypeName
			, ProgramID
			, ProgramName
			, ProductID
			, ProductName
			, Description
			, PreviewImageURL
			, ImageURL
			, UseStartDate
			, UseEndDate
			, Quantity
			, Unit
			, UnitPrice
			, Price
			, ImportPhone
			, MemberAmt
			, DiscountAmt
			, PurchaseQty
			, PurchaseAmt
			, MemberAccount
			, MemberAccounted
			, UnMemberAccount
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyContent
			, SMSOK
			, SMSFailed
			, PushNotify
			, PushNotifyTime
			, PushNotifyContent
			, PushOK
			, PushFalied
			, IssuedQty
			, IssuedAmt
			, InvoiceType
			, InvoiceNumber
			, StatusID
			, ExportResult
			, ExportDate
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProject WITH(NOLOCK)
		WHERE EProjectID = @EProjectID
			AND MID = @MID
		ORDER BY EID, EProjectID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProjectByEID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProjectByEID
GO

CREATE PROCEDURE SP_GetEnterpriseProjectByEID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, EProjectName
			, EID
			, EName
			, MID
			, MName
			, PromotionID
			, PromotionName
			, PromotionTypeID
			, PromotionTypeName
			, ProgramID
			, ProgramName
			, ProductID
			, ProductName
			, Description
			, PreviewImageURL
			, ImageURL
			, UseStartDate
			, UseEndDate
			, Quantity
			, Unit
			, UnitPrice
			, Price
			, ImportPhone
			, MemberAmt
			, DiscountAmt
			, PurchaseQty
			, PurchaseAmt
			, MemberAccount
			, MemberAccounted
			, UnMemberAccount
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyContent
			, SMSOK
			, SMSFailed
			, PushNotify
			, PushNotifyTime
			, PushNotifyContent
			, PushOK
			, PushFalied
			, IssuedQty
			, IssuedAmt
			, InvoiceType
			, InvoiceNumber
			, StatusID
			, ExportResult
			, ExportDate
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProject WITH(NOLOCK)
		WHERE MID = @MID
			AND EID = @EID
		ORDER BY UseEndDate DESC

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProjectByDateInterval')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProjectByDateInterval
GO

CREATE PROCEDURE SP_GetEnterpriseProjectByDateInterval
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, EProjectName
			, EID
			, EName
			, MID
			, MName
			, PromotionID
			, PromotionName
			, PromotionTypeID
			, PromotionTypeName
			, ProgramID
			, ProgramName
			, ProductID
			, ProductName
			, Description
			, PreviewImageURL
			, ImageURL
			, UseStartDate
			, UseEndDate
			, Quantity
			, Unit
			, UnitPrice
			, Price
			, ImportPhone
			, MemberAmt
			, DiscountAmt
			, PurchaseQty
			, PurchaseAmt
			, MemberAccount
			, MemberAccounted
			, UnMemberAccount
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyContent
			, SMSOK
			, SMSFailed
			, PushNotify
			, PushNotifyTime
			, PushNotifyContent
			, PushOK
			, PushFalied
			, IssuedQty
			, IssuedAmt
			, InvoiceType
			, InvoiceNumber
			, StatusID
			, ExportResult
			, ExportDate
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProject WITH(NOLOCK)
		WHERE MID = @MID
			AND ((UseStartDate BETWEEN @UseStartDate AND @UseEndDate) 
				OR (UseEndDate BETWEEN @UseStartDate AND @UseEndDate))
		ORDER BY UseEndDate DESC

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_GetEnterpriseProjectByEIDDateInterval')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_GetEnterpriseProjectByEIDDateInterval
GO

CREATE PROCEDURE SP_GetEnterpriseProjectByEIDDateInterval
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		SELECT
			  EProjectID
			, EProjectName
			, EID
			, EName
			, MID
			, MName
			, PromotionID
			, PromotionName
			, PromotionTypeID
			, PromotionTypeName
			, ProgramID
			, ProgramName
			, ProductID
			, ProductName
			, Description
			, PreviewImageURL
			, ImageURL
			, UseStartDate
			, UseEndDate
			, Quantity
			, Unit
			, UnitPrice
			, Price
			, ImportPhone
			, MemberAmt
			, DiscountAmt
			, PurchaseQty
			, PurchaseAmt
			, MemberAccount
			, MemberAccounted
			, UnMemberAccount
			, SMSNotify
			, SMSNotifyTime
			, SMSNotifyContent
			, SMSOK
			, SMSFailed
			, PushNotify
			, PushNotifyTime
			, PushNotifyContent
			, PushOK
			, PushFalied
			, IssuedQty
			, IssuedAmt
			, InvoiceType
			, InvoiceNumber
			, StatusID
			, ExportResult
			, ExportDate
			, CreateUser
			, CreateDate
			, UpdateUser
			, UpdateDate
			, IsDeleted
		FROM dbo.EnterpriseProject WITH(NOLOCK)
		WHERE MID = @MID		
			AND EID = @EID
			AND ((UseStartDate BETWEEN @UseStartDate AND @UseEndDate) 
				OR (UseEndDate BETWEEN @UseStartDate AND @UseEndDate))
		ORDER BY UseEndDate DESC

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterpriseProject')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterpriseProject
GO

CREATE PROCEDURE SP_DelEnterpriseProject
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DELETE FROM dbo.EnterpriseProject
		OUTPUT DELETED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND EProjectName = @EProjectName
			AND EID = @EID
			AND EName = @EName
			AND MID = @MID
			AND MName = @MName
			AND PromotionID = @PromotionID
			AND PromotionName = @PromotionName
			AND PromotionTypeID = @PromotionTypeID
			AND PromotionTypeName = @PromotionTypeName
			AND ProgramID = @ProgramID
			AND ProgramName = @ProgramName
			AND ProductID = @ProductID
			AND ProductName = @ProductName
			AND Description = @Description
			AND PreviewImageURL = @PreviewImageURL
			AND ImageURL = @ImageURL
			AND UseStartDate = @UseStartDate
			AND UseEndDate = @UseEndDate
			AND Quantity = @Quantity
			AND Unit = @Unit
			AND UnitPrice = @UnitPrice
			AND Price = @Price
			AND ImportPhone = @ImportPhone
			AND MemberAmt = @MemberAmt
			AND DiscountAmt = @DiscountAmt
			AND PurchaseQty = @PurchaseQty
			AND PurchaseAmt = @PurchaseAmt
			AND MemberAccount = @MemberAccount
			AND MemberAccounted = @MemberAccounted
			AND UnMemberAccount = @UnMemberAccount
			AND SMSNotify = @SMSNotify
			AND SMSNotifyTime = @SMSNotifyTime
			AND SMSNotifyContent = @SMSNotifyContent
			AND SMSOK = @SMSOK
			AND SMSFailed = @SMSFailed
			AND PushNotify = @PushNotify
			AND PushNotifyTime = @PushNotifyTime
			AND PushNotifyContent = @PushNotifyContent
			AND PushOK = @PushOK
			AND PushFalied = @PushFalied
			AND IssuedQty = @IssuedQty
			AND IssuedAmt = @IssuedAmt
			AND InvoiceType = @InvoiceType
			AND InvoiceNumber = @InvoiceNumber
			AND StatusID = @StatusID
			AND ExportResult = @ExportResult
			AND ExportDate = @ExportDate
			AND CreateUser = @CreateUser
			AND CreateDate = @CreateDate
			AND UpdateUser = @UpdateUser
			AND UpdateDate = @UpdateDate
			AND IsDeleted = @IsDeleted

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'SP_DelEnterpriseProjectByEProjectID')AND type in (N'P', N'PC'))
DROP PROCEDURE SP_DelEnterpriseProjectByEProjectID
GO

CREATE PROCEDURE SP_DelEnterpriseProjectByEProjectID
	  @EProjectID varchar(20)
	, @EProjectName nvarchar(50)
	, @EID varchar(15)
	, @EName nvarchar(20)
	, @MID varchar(15)
	, @MName nvarchar(20)
	, @PromotionID varchar(20)
	, @PromotionName nvarchar(20)
	, @PromotionTypeID varchar(20)
	, @PromotionTypeName nvarchar(20)
	, @ProgramID varchar(20)
	, @ProgramName nvarchar(20)
	, @ProductID varchar(13)
	, @ProductName nvarchar(20)
	, @Description nvarchar(500)
	, @PreviewImageURL varchar(100)
	, @ImageURL varchar(100)
	, @UseStartDate date
	, @UseEndDate date
	, @Quantity int
	, @Unit varchar(6)
	, @UnitPrice decimal
	, @Price decimal
	, @ImportPhone varchar(1)
	, @MemberAmt decimal
	, @DiscountAmt decimal
	, @PurchaseQty int
	, @PurchaseAmt decimal
	, @MemberAccount varchar(1)
	, @MemberAccounted int
	, @UnMemberAccount int
	, @SMSNotify varchar(1)
	, @SMSNotifyTime datetime
	, @SMSNotifyContent nvarchar(150)
	, @SMSOK int
	, @SMSFailed int
	, @PushNotify varchar(1)
	, @PushNotifyTime datetime
	, @PushNotifyContent nvarchar(500)
	, @PushOK int
	, @PushFalied int
	, @IssuedQty int
	, @IssuedAmt decimal
	, @InvoiceType varchar(1)
	, @InvoiceNumber varchar(10)
	, @StatusID varchar(20)
	, @ExportResult varchar(1)
	, @ExportDate datetime
	, @CreateUser nvarchar(20)
	, @CreateDate datetime
	, @UpdateUser nvarchar(20)
	, @UpdateDate datetime
	, @IsDeleted varchar(1)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
		DELETE FROM dbo.EnterpriseProject
		OUTPUT DELETED.* INTO dbo.EnterpriseProjectLog
		WHERE EProjectID = @EProjectID
			AND MID = @MID

		RETURN 0
	END TRY
	BEGIN CATCH
		DECLARE
			  @LogTime datetime
			, @SystemID nvarchar(20)
			, @APID nvarchar(100)
			, @MethodID nvarchar(20)
			, @ErrSource varchar(50)
			, @ErrCode varchar(10)
			, @ErrMessage nvarchar(200)
			, @StackTrace varchar(4096)

		SET @LogTime = GETDATE()
		SELECT @SystemID = DB_NAME()
		SELECT @APID = OBJECT_NAME(@@PROCID)
		SELECT 
			  @MethodID = CONVERT(nvarchar(100), ISNULL(ERROR_PROCEDURE(), 0))
			, @ErrSource = CONVERT(varchar(10), ISNULL(ERROR_SEVERITY(), 0))
			, @ErrCode = CONVERT(varchar(10), ISNULL(ERROR_STATE(), 0))
			, @ErrMessage = CONVERT(nvarchar(200), ISNULL(ERROR_NUMBER(), 0))
			, @StackTrace = CONVERT(varchar(4096), ISNULL(ERROR_MESSAGE(), ''))

		EXEC Log.dbo.SP_InsErrorLog @LogTime, @SystemID, @APID, @MethodID, @ErrSource, @ErrCode, @ErrMessage, @StackTrace

		RETURN ERROR_NUMBER()
	END CATCH
END
GO
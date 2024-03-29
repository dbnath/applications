USE test

DELIMITER $$ 
DROP PROCEDURE IF EXISTS test.adddocument $$
CREATE PROCEDURE test.adddocument (
	IN NM_DOC varchar(200),
	IN ID_DOC_TYPE int,
	IN ID_DOC_REPO int,
	IN DOC_HYPERLINK varchar(250),
	IN DOC_LOCATION varchar(250),
	IN IS_DELETED char(1),
	IN IS_VALID_LINK char(1),
	IN CREATED_BY varchar(10),
	IN CREATION_DT datetime,
	IN LAST_UPDATED_BY varchar(10),
	IN LAST_UPDATE_DT datetime )

BEGIN

	DECLARE exit handler for sqlexception
	  BEGIN
		-- ERROR
	  ROLLBACK;
	END;

	START TRANSACTION;
	
	SELECT @CNT := MAX(ID_DOC) FROM document;
	
	if(@CNT is NULL) THEN
	SELECT @CNT := 1;
	END IF;
	
	insert into document (ID_DOC, NM_DOC,ID_DOC_TYPE,ID_DOC_REPO,DOC_HYPERLINK,	DOC_LOCATION,IS_DELETED,IS_VALID_LINK,CREATED_BY,CREATION_DT,LAST_UPDATED_BY,LAST_UPDATE_DT ) values (@CNT+1, NM_DOC,ID_DOC_TYPE,ID_DOC_REPO,DOC_HYPERLINK,	DOC_LOCATION,IS_DELETED,IS_VALID_LINK,CREATED_BY,CREATION_DT,LAST_UPDATED_BY,LAST_UPDATE_DT);
	
	
	
	insert into document_audit (ID_DOC, ID_VER, NM_DOC,ID_DOC_TYPE,ID_DOC_REPO,DOC_HYPERLINK,	DOC_LOCATION,IS_DELETED,IS_VALID_LINK,CREATED_BY,CREATION_DT,LAST_UPDATED_BY,LAST_UPDATE_DT ) values (@CNT+1, 1, NM_DOC,ID_DOC_TYPE,ID_DOC_REPO,DOC_HYPERLINK,	DOC_LOCATION,IS_DELETED,IS_VALID_LINK,CREATED_BY,CREATION_DT,LAST_UPDATED_BY,LAST_UPDATE_DT);
	
	INSERT INTO doc_workflow_process (ID_DOC, ID_WF_STATUS, IS_REWORKED, ASSIGNED_TO, ASSIGNED_DT, ID_ROLE, LAST_UPDATED_BY, LAST_UPDATE_DT) VALUES (@CNT +1, 1, 'N', '', null, null, CREATED_BY, CREATION_DT);
	
	INSERT INTO doc_workflow_process_audit (ID_DOC, ID_VER, ID_WF_STATUS, IS_REWORKED, ASSIGNED_TO, ASSIGNED_DT, ID_ROLE, LAST_UPDATED_BY, LAST_UPDATE_DT) VALUES (@CNT +1 , 1, 1, 'N', '', null, null, CREATED_BY, CREATION_DT);
	COMMIT;
	
END $$
DELIMITER ;

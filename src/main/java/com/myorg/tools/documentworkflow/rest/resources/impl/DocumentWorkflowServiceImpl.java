package com.myorg.tools.documentworkflow.rest.resources.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.ws.rs.core.Response;

import com.myorg.tools.documentworkflow.dao.DocumentWorkflowDAO;
import com.myorg.tools.documentworkflow.model.DocumentWorkflow;
import com.myorg.tools.documentworkflow.model.DocumentWorkflowDetail;
import com.myorg.tools.documentworkflow.model.DocumentWorkflowProcess;
import com.myorg.tools.documentworkflow.rest.resources.BaseResource;
import com.myorg.tools.documentworkflow.rest.resources.DocumentWorkflowService;

public class DocumentWorkflowServiceImpl extends BaseResource implements DocumentWorkflowService {

	private DocumentWorkflowDAO documentDAO;
	
	/**
	 * @return the documentDAO
	 */
	public DocumentWorkflowDAO getDocumentDAO() {
		return documentDAO;
	}

	/**
	 * @param documentDAO
	 * the documentDAO to set
	 */
	public void setDocumentDAO(DocumentWorkflowDAO documentDAO) {
		this.documentDAO = documentDAO;
	}
	
	public Response getAllDocuments() {
		try {
			String userId = getLoggedInUserId();
			System.out.println("Inside getAllDocuments userId = "+userId);
			List<DocumentWorkflow> documentList = documentDAO
					.getAllDocuments(userId);
			return Response.ok().entity(documentList).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.serverError().build();
		}
	}

	public Response getDocumentDetail(Integer docId) {
		try {
			System.out.println("docId" +docId);
			DocumentWorkflowDetail documentWorkflowDetail = documentDAO
					.getDocumentDetail(docId);
			return Response.ok().entity(documentWorkflowDetail).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.serverError().build();
		}
	}

	public Response submitWorkflow(DocumentWorkflowProcess docWorkflowProcess) {
		//System.out.println("###### GORU ");
		String	userId = getLoggedInUserId();
		try {
			
			if(docWorkflowProcess != null){
				Boolean isFinalSubmit = docWorkflowProcess.getIsFinalSubmit();
				DocumentWorkflow docObj = docWorkflowProcess.getDocObj();
				DocumentWorkflowDetail docDetailObj = docWorkflowProcess.getDocDetail();
				
				System.out.println("###### isFinalSubmit "+isFinalSubmit);
				System.out.println("###### docObj "+docObj);
				System.out.println("###### docDetailObj "+docDetailObj);
				
				if(isFinalSubmit){
					docObj.setAssignedTo(null);
					docObj.setAssignedDt(null);
					
					docObj.setWfStatusId(docObj.getWfStatusId()+1);
					docObj.setWfStatusDesc(null);
				}
				docObj.setLastUpdatedBy(userId);
				docObj.setLastUpdateDt(new Date());
				
				docDetailObj.setLastUpdatedBy(userId);
				docDetailObj.setLastUpdatedDt(new Date());
				
				documentDAO.submitWorkflow(docObj, docDetailObj);
			}
			
			return Response.ok().entity(Boolean.TRUE).build();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return Response.serverError().build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.serverError().build();
		}
	}
	
	/*public Response assignDocuments(List<DocumentWorkflow> docs) {
		try {
			String	userId = getLoggedInUserId();
			System.out.println("###### user id "+userId+" ###### "+docs);
			for (DocumentWorkflow doc : docs) {
				doc.setAssignedTo(userId);
				doc.setAssignedDt(new Date());
				doc.setLastUpdatedBy(userId);
				doc.setLastUpdateDt(new Date());
				doc.setWfStatusId(doc.getWfStatusId()+1);
				doc.setWfStatusDesc(null);
			}
			documentDAO.assignWorkflow(docs);
			return Response.ok().entity(Boolean.TRUE).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.serverError().build();
		}
	}*/

	public Response assignDocumentsTo(List<Integer> docIds) {
		try {
			List<DocumentWorkflow> docs = documentDAO.fetchDocumentWorkflows(docIds);
			String	userId = getLoggedInUserId();
			System.out.println("###### user id "+userId+" ###### "+docs);
			for (DocumentWorkflow doc : docs) {
				if (!userId.equalsIgnoreCase(doc.getAssignedTo())) {
					doc.setAssignedTo(userId);
					doc.setAssignedDt(new Date());
					doc.setWfStatusId(doc.getWfStatusId()+1);
					doc.setWfStatusDesc(null);
					doc.setLastUpdatedBy(userId);
					doc.setLastUpdateDt(new Date());
				}
			}
			documentDAO.assignWorkflow(docs);
			return Response.ok().entity(Boolean.TRUE).build();
		} catch (Exception e) {
			e.printStackTrace();
			return Response.serverError().build();
		}
	}
}

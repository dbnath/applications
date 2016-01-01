
  <div ng-include="'static/app/pages/common/banner.html'" style="padding:10px"></div>

  <!-- slide in menu (mobile only) -->
  
  <div class="container bootcards-container" id="main" ng-init="hc.inithome();">
    
			  <a class="btn btn-primary" href="#" ng-click="hc.refreshGrid()" >
				<i class="glyphicon glyphicon-refresh"></i> 
				<span>Reload Documents</span>
			  </a>
			  <a class="btn btn-primary" href="rest/docadmin/dump">
				<i class="glyphicon glyphicon-refresh"></i> 
				<span>Export Completed Document Workflow List</span>
			  </a><br><br>			  
			  


	<div class="row">
	
		<div class="col-sm-5">
			<ul class="nav nav-tabs" id="myTabs">
				<li role="presentation" class="active"><a href="#home"><span class="glyphicon glyphicon-tags"></span>&nbspGlobal Inbox <span class="badge">{{hc.count}}</span></a></li>
				<li role="presentation"><a href="#profile"><span class="glyphicon glyphicon-tag"></span>&nbsp;My Inbox <span class="badge">{{hc.countmylist}}</span></a></li>
			</ul>
 
	 
			<div id="myTabContent" class="tab-content">
		       <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledBy="home-tab">
		         <div class="gridStyle" ui-grid="gridOptions"  ui-grid-selection ui-grid-edit class="grid" >
		          </div>
		           <div class="col-xs-4">
		             <br>
		                  <a class="btn btn-primary btn-block" href="#" ng-click="hc.assignMe()" >
		                    <i class="glyphicon glyphicon-hand-up"></i> 
		                    <span>Assign Me</span>
		                  </a>
		             </div>
		       </div>
		       <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledBy="profile-tab">
		           <div class="gridStyle" ui-grid="gridOptionsmylist"  ui-grid-selection ui-grid-edit class="grid">         
		          </div>
		          <!-- start stop button -->
		          	<div class="btn-group btn-group-justified">
						<div class="btn-group">
							<a class="btn btn-default" ng-click="hc.startWork()">
								<i class="fa fa-play"></i>
								Start
							</a>
						</div>
						<div class="btn-group">
							<button class="btn btn-default view-comment">
								<i class="fa fa-stop""></i>
								Hold 
							</button>
						</div>
						<div class="btn-group" >
							<a class="btn btn-default assign-tag">
								<i class="fa fa-check"></i>
								Done
							</a>
						</div>															
					</div>
			   </div>
		
		</div>
	</div>
	
	
	
	<!--details panel on right side-->
   

</div> <!-- end of row -->
</div> <!-- end of main container -->

	

  <!-- Bootstrap & jQuery core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
 

    <!--recommended: FTLabs FastClick library-->
  <div class="spinner" ng-show="loading"></div>
	<div class="panel-footer clearfix" id="savepanel" style="display:none">
				<div class="btn-group btn-group-justified">					
					<div class="btn-group" >
						<a class="btn btn-default save-tag" ><!--save-tag-->
							<i class="glyphicon glyphicon-floppy-disk"></i>
							Save
						</a>
					</div>	
					<div class="btn-group" >
						<a class="btn btn-default submit-tag" >
							<i class="glyphicon glyphicon-save"></i>
							Save &amp; Submit
						</a>
					</div>															
				</div>
			</div>
  


<div class="modal fade" id="commentModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        		<div class="titleBox">
				    <label>Comments</label>
				  </div>
      </div>
      <div class="modal-body">
        <div class="detailBox">
				  
				  <div class="commentBox">
				
				    <p class="taskDescription">Comment details for {{hc.docdetails.document.docName}}</p>
				  </div>
				  <div class="actionBox">
				    <ul class="commentList">
				      <li>
				        <div class="commenterImage">
				          <img src="static/assets/images/user-48.png" />
				        </div>
				        <div class="commentText">
				          <p class="">Hello this is a test comment.</p> <span class="date sub-text">on March 5th, 2015</span>
				
				        </div>
				      </li>
				      <li>
				        <div class="commenterImage">
				          <img src="static/assets/images/user-alt-48.png" />
				        </div>
				        <div class="commentText">
				          <p class="">Hello this is a test comment and this comment is particularly very long and it goes on and on and on.</p> <span class="date sub-text">on March 5th, 2015</span>
				
				        </div>
				      </li>
				      <li>
				        <div class="commenterImage">
				          <img src="static/assets/images/user-48.png" />
				        </div>
				        <div class="commentText">
				          <p class="">Hello this is a test comment.</p> <span class="date sub-text">on March 5th, 2015</span>
				
				        </div>
				      </li>
				    </ul>
				    <form class="form-inline" role="form">
				      <div class="form-group">
				        <input class="form-control" type="text" placeholder="Your comments" />
				      </div>
				      <div class="form-group">
				        <button class="btn btn-default">Add</button>
				      </div>
				    </form>
				  </div>
				</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
      
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

 <script type="text/ng-template" id="firstDialogId">
        <div class="ngdialog-message">
            <h3>DocumentWorkFlow</h3>
            <p ng-show="theme">{{ngDialogData.Message}}</code></p>
            
        </div>
        <!--<div class="ngdialog-buttons">
            <button type="button" class="ngdialog-button ngdialog-button-secondary"
                ng-dialog="secondDialogId"
                ng-dialog-class="ngdialog-theme-default"
                ng-dialog-controller="SecondModalCtrl"
                ng-dialog-close-previous>Close</button>
           
        </div>-->
    </script>
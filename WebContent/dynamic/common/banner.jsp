<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<%
	long ver = java.lang.System.currentTimeMillis();
%>

 <link href="<%=request.getContextPath()%>/static/bower_components/bootcards/css/bootcards-desktop.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/static/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet"/>
         
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bower_components/ng-grid.min.css" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bower_components/angular-ui-grid/ui-grid.min.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bower_components/style.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bower_components/ngDialog.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bower_components/ngDialog-custom-width.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bower_components/ngDialog-theme-default.css" />
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bower_components/ngDialog-theme-plain.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/bower_components/style.css" />
    <link data-require="ui-select@0.11.1" data-semver="0.11.1" rel="stylesheet" href="https://cdn.rawgit.com/angular-ui/ui-select/v0.11.2/dist/select.css" />
  	<!-- Font awesome -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" />
        
    <!-- multiselect -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/static/bower_components/multiselect/bootstrap-multiselect.css" type="text/css" />	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/docworkflow.css" />
	<script language="Javascript" src="<%=request.getContextPath()%>/js/commonframework.js?ver=<%=ver%>"></script>
	<script language="Javascript" src="<%=request.getContextPath()%>/js/service.js?ver=<%=ver%>"></script>
	<script language="Javascript" src="<%=request.getContextPath()%>/js/json2.js"></script>
	
	
</head>

<body style="padding-top:10px; padding-left:5px; padding-right:5px; ">

<table border="1" style="width:100%; background-color:#000099;height:50px">
	<tr>
		<td style="width:60%;font-family:'Arial Bold', 'Arial';font-weight:500;font-style:normal;font-size:20px;color:#ffffff;text-align:right;padding-left:100px;line-height:normal;" >AM Remediation Workflow</td>
		<td style="width:40%;text-align:right;" align="right">
			<c:if test="${userDetails != null}">
			<nav id="docworkflow_nav_wrap">
				<ul>
					<li class="current-menu-item" style="background-color:#000099;">
						<a href="#" class="dropdown-toggle">
					Welcome <c:out value="${userDetails.userName}" /> (<c:out value="${userDetails.userRoleList[0].roleName}" />) <span class="caret"></span></a>
						<ul style="color:#ffffff;background-color:#000099;">
							<li><a href="#" onclick="logout()" style="color:#ffffff;">Logout</a></li>
				</ul>
			</li>           			
          </ul>
			</nav>  
		  </c:if>
      
		</td>
	</tr>
</table>
<input type="hidden" id="selectedUserId" name="selectedUserId" value="<c:out value="${userDetails.userId}" />">
<input type="hidden" id="selectedRoleId" name="selectedRoleId" value="<c:out value="${userDetails.userRoleList[0].roleId}" />">
</body>


<script>
	var cotextPathTop = "${pageContext.request.contextPath}";
	function logout() {
		new service().logout();
		window.location=cotextPathTop+"/view/login";
	}
</script>

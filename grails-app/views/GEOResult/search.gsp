<%@ page import="com.webners.rest.GEOResult" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'GEOResult.label', default: 'GEOResult')}" />
		<title>Map Search</title>
	</head>
	<body>
		<div id="edit-GEOResult" class="content scaffold-edit" role="main">
			<h1>Map Search</h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:form method="get" action="list">
				<fieldset class="form">
					<span id="pageLine-label" class="property-label">Enter City or ZipCode: &nbsp;&nbsp; </span>
					<g:textField name="query" value=""/>
					&nbsp;&nbsp;&nbsp;<g:actionSubmit class="save" action="list" value="${message(code: 'default.button.search.label', default: 'Search')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

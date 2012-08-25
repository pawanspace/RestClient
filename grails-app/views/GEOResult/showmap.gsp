
<%@ page import="com.webners.rest.GEOResult" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'GEOResult.label', default: 'GEOResult')}" />
		<title>Map Details</title>
	</head>
	<body>
		<a href="#show-GEOResult" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(action: 'index')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list" params="[query: params.searchTerm]"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-GEOResult" class="content scaffold-show" role="main">
			<h1>Map Details</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div>
				<div style="float: left; margin: 62px 153px 0px 27px;">
					<div>
					<span style="margin-right:38px;font-size:18px">City: </span>
						<span aria-labelledby="pageLine-label" class="property-value">Malang (JI) (East Java)</span>
					</div>
					<div>
						<span style="margin-right:10px;font-size:18px">Country: </span>
						<span aria-labelledby="pageLine-label" class="property-value">Indonesia</span>
					</div>
				</div>
			
				<div style="display: inline-block; position: relative; float: left;">
					
					<img alt="Map" src="${GEOResultInstance.getMapLink()}" >	
				</div>
			</table>
			
		</div>
	</body>
</html>


<%@ page import="com.webners.rest.GEOResult"%>
<!doctype html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'GEOResult.label', default: 'GEOResult')}" />
<title>Search Results</title>
</head>
<body>
	
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(action: 'index')}"><g:message
						code="default.home.label" /></a></li>
		</ul>
	</div>
	<div id="list-GEOResult" class="content scaffold-list" role="main">
		<h1>
			Search Results
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
			<div class="pagination">
				<g:paginate total="${total}" />
			</div>
		<table>
			<thead>
				<tr>
					<g:sortableColumn property="latitude" title="Latitude" />
					<g:sortableColumn property="longitude" title="Longitude" />
					<g:sortableColumn property="type" title="Type" />
					<g:sortableColumn property="city" title="City" />
					<g:sortableColumn property="state" title="State" />
					<g:sortableColumn property="postcode" title="PostCode" />
					<g:sortableColumn property="country" title="Country" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${GEOResultInstanceList}" status="i"
					var="GEOResultInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>${GEOResultInstance?.latitude}</td>
					<td>${GEOResultInstance?.longitude}</td>
					<td>${GEOResultInstance?.type}</td>
					<td>${GEOResultInstance?.city}</td>
					<td>${GEOResultInstance?.state}</td>
					<td>${GEOResultInstance?.postcode}</td>
					<td>${GEOResultInstance?.country}</td>
					<td><g:link class="edit" action="viewGeoResult" params="[latitude: GEOResultInstance?.latitude,longitude: GEOResultInstance?.longitude,city:GEOResultInstance?.city,country:GEOResultInstance?.country,searchTerm:params.query]">Show Map</g:link></td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
				<g:paginate total="${total}" />
			</div>
	</div>
</body>
</html>

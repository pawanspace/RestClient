package com.webners.rest

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import groovyx.net.http.HTTPBuilder
import static groovyx.net.http.Method.GET
import static groovyx.net.http.ContentType.JSON



class GEOResultController {


	def index = {
		render(view:"search");
	}
		
	
	def list = {
		def geoResultList = [];
		
		def http = new HTTPBuilder( 'https://api.tomtom.com' )
		def query = params.get('query');
		http.request( GET, JSON ) {
			uri.path = '/lbs/services/geocode/3/json'
			uri.query = [ language:'en', q: query, key: 'e36mysqn9xvgrj5z2m52rjvu', maxResults: '100' ];
			response.success = { resp, json ->
					def jsonArray = JSONArray.fromObject(json.geoResponse.geoResult);
					for(geoRes in jsonArray){
						def jsonObject = JSONObject.fromObject(geoRes)
						GEOResult geoResult = JSONObject.toBean(jsonObject, GEOResult.class);
						geoResultList.add(geoResult);
					}
			}
			response.failure = { resp -> println "Unexpected error: ${resp.status} : ${resp.statusLine.reasonPhrase}" }
		}
		
		if(params.sort!=null && params.sort!=''){
			geoResultList.sort({it.getAt(params.sort)})
		}
		def subList = geoResultList;
		if(params.offset!=null && params.offset!='' && params.max!=null && params.max!='' ){
			int offset = Integer.parseInt(params.offset);
			int max = Integer.parseInt(params.max);
			subList = geoResultList.subList(offset, (offset+max))
		}else{
			if(geoResultList.size()>=10){
				subList =  geoResultList.subList(0, 10);
			}
		}
		render(view:"list" , model: [GEOResultInstanceList:subList, total:geoResultList.size()]);
	}
	
	
	def viewGeoResult = {
		def geoResult = new GEOResult(params);
		render(view:"showmap", model:[GEOResultInstance: geoResult, searchTerm: params.get("searchTerm")]);
	}
	
}

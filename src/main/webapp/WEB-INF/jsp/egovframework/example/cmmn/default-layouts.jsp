<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

 <html>

  <head>
    <tiles:insertAttribute name="header"/>
  </head>
  <body>

    <tiles:insertAttribute name="nav"/>
    <tiles:insertAttribute name="bg"/>
   
	<tiles:insertAttribute name="content"/>
	
	<tiles:insertAttribute name="instagram"/>
	
    <tiles:insertAttribute name="footer"/>
  </body>
</html>
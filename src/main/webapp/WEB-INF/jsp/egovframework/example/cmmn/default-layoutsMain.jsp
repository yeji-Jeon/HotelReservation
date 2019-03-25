<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



 <html>

  <head>
    <tiles:insertAttribute name="header"/>
  </head>
  <body>

    <tiles:insertAttribute name="nav"/>
    
	<tiles:insertAttribute name="content"/>
	
	<tiles:insertAttribute name="instagram"/>
	
    <tiles:insertAttribute name="footer"/>
  </body>
</html>
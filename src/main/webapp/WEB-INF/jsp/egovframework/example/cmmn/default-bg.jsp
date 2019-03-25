<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

    
     <div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <p class="breadcrumbs mb-2" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="#" 
	            onclick = "clickFn.address('HOME')">HOME</a></span> <span class="mr-2"><c:out value="${param.pageName}"/></span></p>
	            <h1 class="mb-4 bread"><c:out value="${param.pageName}"/></h1>
            </div>
          </div>
        </div>
      </div>
    </div>

    
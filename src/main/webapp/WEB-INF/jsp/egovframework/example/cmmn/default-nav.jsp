<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<style> 
 .LOGIN , .SIGN_UP{
 	font-color: black;
 	font-weight: bold;
 	background: teal;
 	height: 10px;
 	 background-size: auto;
 }
</style>
<<script>
<!--//-->

	var clickFn = {
			address : function(mapping) {
				location.href = "/" + mapping + ".do?pageName=" + mapping;
			}
	}
	
	
	
	var Init = {
		
		pageName	: "<c:out value='${param.pageName}'/>",
		$li			:  $(".nav-item"),
		$param		:  $(".nav-item:contains(" + this.pageName + ")")
	}
	
	var highLight = {
			
			highLightFn : function() {
				
				$(".nav-item").removeClass("active");
				$(".nav-item:contains('" + Init.pageName + "')").addClass("active");
			}
	}
$(function() {
		
		highLight.highLightFn();
	
		console.log(Init.$li);
		console.log(Init.$param);
		console.log(Init.pageName);
	})
</script>


    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="#" onclick = "clickFn.address('HOME')">Deluxe</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	        <c:choose>
    		<c:when test="${empty PageList}" >
    		 데이터가 없음
    		</c:when>
    			<c:otherwise>
    				<c:forEach items="${PageList}" var = "PageList">
					        <li class="menu nav-item active"><a href="#" 
					        onclick = "clickFn.address('<c:out value="${PageList.cmmCdNm}"/>')" class="nav-link <c:out value="${PageList.cmmCdNm}"/>">
					        <c:out value='${PageList.cmmCdNm}'/></a></li>
					</c:forEach>
    	  		</c:otherwise>
       		</c:choose>
       		
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
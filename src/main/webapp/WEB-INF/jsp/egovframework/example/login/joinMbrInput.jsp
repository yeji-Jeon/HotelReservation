<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<script>
/* $(function() {
	var $num = $(".num");
	
	$num.numeric("positiveInteger");
	
	$num.keyup(function() {
		var $this = $(this);
		
		if($this.val().length > 4 ) {
			console.log("4자리 이상입니다.");
			$this.val($this.val().substring(0,4));
		}
	})
});

var joinMbrInput = {
      
      // 객체 리터럴 방식이 좋아서 써줌
      // 아이디 중복확인
      duplicateChkFn : function(){
    	  var loginId = $("#loginId").val();
    	  
    	  if(!this.idValidChkFn(loginId)) {
    		  return;
    	  }
    	  
    	  $.ajax({
    		  url		: "/selectDuplicateIdChk.do"	,
    		  data		: {"loginId" : loginId}	,
    		  async		: false,
    		  success	: function(data) {
    			  var duplicateCtn = parseInt(data);
    			  
  				if(duplicateCtn >0){
  					commAlertPop.popUp("유효성 검사", loginId+"는 사용할 수 없습니다.")
  				} else {
  					commAlertPop.popUp("유효성 검사", loginId+"는 사용할 수 있습니다.")
  				}
    		  }
    		  
    	  })
      },
      
      //아이디 유효성 체크
      idValidChkFn : function(loginId) {
    	  var reg	 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/;
      	 
      	 console.log(loginId);
      	 
      	 if(!reg.test(loginId)) {
      		 console.log("실패");
      		 
      		commAlertPop.popUp("유효성 검사", "아이디가 유효하지 않습니다.",
      				function() {
      					$("#pop-01").remove();
    					$("#loginId").focus();
    				}
      		);
      		 
      		 return false;
      	 }
      	 console.log("성공");
      	 
      	 return true;
      }
      
} */
</script>

<!-- container -->
<div id="container">
    <form action="">
    <!-- contents -->
    <div class="center-wrap">
        <p class="join-step mgt-70"><img src="common/images/sub/txt_img_join_step_03.png" alt="03 
        정보입력"></p>

        <h3 class="heading-medium join-enter mgt-60">회원가입 기본정보 입력사항</h3>

        <h3 class="heading-medium join-group-tit">회원 기본 정보</h3>
        <span class="sub-tit"><span>*</span><span>표시정보는 필수 입력 사항이니 반드시 입력해 주십시오.</span></span>
        <div class="join-group">
            <div class="join-row">
            </div>
            <div class="join-row">
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>아이디</span><span class="point">*</span></h3>
                    <input type="text" id="loginId" name="loginId" class="ui-ipt">
                     <button type="button" id="dupChkBtn" class="ui-btn-gray-md"
                     onclick="joinMbrInput.duplicateChkFn()">아이디 중복 확인</button>
                    <p class="sub-info-txt"><span class="ui-bullet"></span> 아이디는 영문/숫자 포함 8자리 ~ 12자리</p>
                </div>
            </div>
            <div class="join-row">
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>비밀번호</span><span class="point">
                    *</span></h3>
                    <input type="text" id="pwd" name="pwd"  class="ui-ipt">
                    <p class="sub-info-txt"><span class="ui-bullet"></span> 비밀번호는 영문/숫자/특수문자 포함 8자리~15자리</p>
                </div>
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>비밀번호 확인</span><span class="point">*</span></h3>
                    <input type="text" id="pwdConfirm" name="pwdConfirm" class="ui-ipt">
                </div>
            </div>
            <div class="join-row">
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>회원명</span><span class="point">*</span></h3>
                    <input type="text" id="mbrNm" name="mbrNm" class="ui-ipt">
                </div>
            </div>
            <div class="join-row birthday">
            </div>
            <div class="join-row phone ipt-bar">
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>휴대폰</span><span class="point">*</span></h3>
                    <select name="cpNoFirst" id="cpNoFirst">
                        <option value="010" selected="selected">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                        
                    </select>
                    <span class="bar"></span>
                    <input type="text" name="cpNoMiddle" id="cpNoMiddle" class="ui-ipt ipt-phone num" >
                    <span class="bar"></span>
                    <input type="text" name="cpNoEnd" id="cpNoEnd" class="ui-ipt ipt-phone num">
                    <p class="sub-info-txt"><span class="ui-bullet"></span> 예) 000 - 000 - 0000</p>
                    <input type="hidden" id="cpNo" name="cpNo">
                </div>
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>문자수신</span><span class="point">*</span></h3>
                    <div class="ui-radio">
                        <input type="radio" id="rdo1" name="smsRcpYn" value="Y">
                        <label for="rdo1">받음</label>
                    </div>
                    <div class="ui-radio">
                        <input type="radio" id="rdo2" name="smsRcpYn" value="N" checked>
                        <label for="rdo2">받지않음</label>
                    </div>
                    <p class="sub-info-txt"><span class="ui-bullet"></span> 수신동의시 이벤트 및 다양한 정보를 받으실 수 있습니다.</p>
                </div>
            </div>
            <div class="join-row">
            </div>
            <div class="join-row email">
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>이메일</span><span class="point">*</span></h3>
                    <input type="text" class="ui-ipt"><span>@</span><input type="text" class="ui-ipt">
                    <select name="" id="">
                        <option value="">직접입력</option>
                        <c:forEach items="${emailDomainList}" var="emailDomainList">
                        	 <option value="${emailDomainList.}">네이버</option>
                        </c:forEach>
                       
                    </select>
                     <input type="hidden" id="email" name="email">
                </div>
                <div class="join-item">
                    <h3 class="item-tit txt-regular"><span>메일수신</span><span class="point">*</span></h3>
                    <div class="ui-radio">
                        <input type="radio" id="rdo3" name="emailRcpYn" value="Y">
                        <label for="rdo3">받음</label>
                    </div>
                    <div class="ui-radio">
                        <input type="radio" id="rdo4" name="emailRcpYn" value="N" checked>
                        <label for="rdo4">받지않음</label>
                    </div>
                    <p class="sub-info-txt"><span class="ui-bullet"></span> 수신동의시 이벤트 및 다양한 정보를 받으실 수 있습니다.</p>
                </div>
            </div>
        </div>

        <div class="btn-join-confirm btn-wrap txt-center">
            <button type="button" class="ui-btn-blue-lg" onclick="location.href ='SSF_20401.html'">회원가입 완료</button>
            <button type="button" class="ui-btn-black-lg" onclick="location.href ='main.html'">회원가입 취소</button>
        </div>
    </div>
    <!--// contents -->
    </form>
</div>
<!--// container -->
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<script>
$(function(){
	
   // 전체 약관 동의
   $(".chk_full_agreement").click(function(){
      var $chkAll = $(this);
      
      if ($chkAll.is(":checked")){
         $("input[name=chk_agreement]").prop("checked", true);
      } else{
           $("input[name=chk_agreement]").prop("checked", false);
         }
   })

});


var essnTermChk = function(){
	var checkedTermNoArr = [];
	
	// 필수 약관 체크 여부
	$("[data-essnAgrYn='Y']").each(function(idx, obj){
		
		// console.log("obj", obj);
		// debugger;
		
		if(!obj.checked){
			// alert("필수약관을 체크해주세요")
			
			commAlertPop.popUp("필수 약관 동의 확인결과", "필수 약관동의에 대하여 체크하여 주십시오");
			return false;
		} else {
			
			// 필수 약관 체크에 문제가 없을 경우 배열에 value를 넣어준다.
			// value="${termsMngList10.termsMngNo}"> 약관의 관리번호
			checkedTermNoArr.push(obj.value);
		}
	});	
	
	return checkedTermNoArr;
};

var submitFn = function(){
	
	var chkTermArr = essnTermChk();
	
	if(chkTermArr.length === $("[data-essnAgrYn='Y']").length){
		
		$.ajax({
			url : "/selectTermsRequireDataChk.do",
			data : {"checkedTermNoArr" : chkTermArr},
			traditional : true, // 배열을 ajax로 보낼 때 true로 설정한다.
			
			success : function(data){
	
				var jObj = JSON.parse(data);
				if(jObj.result === "success"){
					
					$("#termsFrm").submit();
				} else{
					
					commAlertPop.popUp("필수 약관 동의 확인결과", 
							"필수 약관동의가 정상적이지 않습니다. 다시 진행해주세요",
						function() {
							$("#loginId").focus();
							}
					);
							
					
					return; // 반복문이 아니기 때문에 return false 적어줄 필요 없음.
				}
				
			}
		});
	
	}
}

</script>

    <!-- container -->
    <div id="container">
        <form action="/selectJoinInput.do" id="termsFrm" method="post">
         <div class="center-wrap">
            <p class="join-step mgt-70"><img src="common/images/sub/txt_img_join_step_02.png" alt="02 약관동의"></p>

            <h3 class="heading-medium h3-join-agree mgt-60"> 회원 약관 동의</h3>

            <h4 class="heading-right h4-join-agree mgt-35"> 이용약관 동의(필수)<span class="txt-medium">*</span></h4>
            <div class="scroll-box mgt-10">
			${termsMngList10.termsHtml}
            </div>
            <div class="txt-right mgt-10">
                <div class="ui-chk-purple-right">
                    <input type="checkbox" id="chk1" name="chk_agreement" data-essnAgrYn = "${termsMngList10.essnAgrYn}" 
					 value = "${termsMngList10.termsMngNo}">
                    <label for="chk1"><span>위의 약관을 모두 읽었으며 동의합니다.</span></label>
                </div>
            </div>

            <h4 class="heading-right h4-join-agree mgt-35">개인정보 수집 및 이용동의(필수)<span class="txt-medium">*</span></h4>
            <div class="scroll-box mgt-10">
			${termsMngList20.termsHtml}
            </div>
            <div class="txt-right mgt-10">
                <div class="ui-chk-purple-right">
                    <input type="checkbox" id="chk2" name="chk_agreement" data-essnAgrYn = "${termsMngList20.essnAgrYn}"
                    value = "${termsMngList20.termsMngNo}">
                    <label for="chk2"><span>위의 약관을 모두 읽었으며 동의합니다.</span></label>
                </div>
            </div>

            <h4 class="heading-right h4-join-agree mgt-35">제3자 제공 약관(선택)</h4>
            <div class="scroll-box mgt-10">
			${termsMngList30.termsHtml}            
            </div>
            <div class="txt-right mgt-10">
                <div class="ui-chk-purple-right">
                    <input type="checkbox" id="chk6" name="chk_agreement" data-essnAgrYn = "${termsMngList30.essnAgrYn}"
                   value = "${termsMngList30.termsMngNo}">
                    <label for="chk6"><span class="text">위의 약관을 모두 읽었으며 동의합니다.</span></label>
                </div>
            </div>

            <div class="gray-box txt-right mgt-15">
                <div class="ui-chk-purple-right">
                    <input type="checkbox" id="chk7" class="chk_full_agreement">
                    <label for="chk7"><strong class="text">[ 전체동의 ]  전체 약관에 동의합니다.</strong></label>
                </div>
            </div>

            <div class="number-ipt-wrap txt-center mgt-60">
                <div class="inner-wrap inline-block">
                    <div class="relative" style="padding-left:0px;">
						<button class="ui-btn-blue-md btn-certify" type="button" onclick = "location.href = '/HOME.do'" style="background-color:gray;"><span class="txt-medium">비동의</span></button>
						<button class="ui-btn-blue-md btn-certify" type="button" onclick="submitFn()"><span class="txt-medium">동의</span></button>
                    </div>
                </div>
            </div>
        </div>
     </form>
   </div>
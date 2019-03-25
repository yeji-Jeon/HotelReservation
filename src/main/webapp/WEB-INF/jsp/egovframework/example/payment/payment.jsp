<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/egovframework/example/cmmn/common_lib.jsp" %>

<script type="text/javascript">

	var validataion = {
			vailInit : function() {
				this.numChk();
			},
			
			valiFn : function() {
				var value = $("input[type=text]").val();
				
				if(value.length > 0) {
					if(this.inputValChk()) {
						alert("결제가 진행됩니다.");
						$("#PayFrm").submit();
					}
						
				} else {
					alert("빈 값이 있습니다.");
				}
			},
			inputValChk : function() {
				var rNm		= $("[name='REV_NAME']").val(),
					CVC 	= $("[name='CVC']").val(),
					expM 	= $("[name='EXP_M_NUM']").val(),
					expD 	= $("[name='EXP_D_NUM']").val(),
					crdNm 	= $("[name='CARD_NUM']").val();
				
				if(expD.length ===2 && expM.length === 2 && CVC.length === 3 
						&& crdNm.length === 16) {
					alert("올바른접근입니다.");
					return true;
				} else {
					alert("숫자가 부족합니다. 입력해주세요");
					return false;
				}
			},
			numChk : function() {
				var $num = $(".num");
				
				$num.numeric("positiveInteger");
				
				$num.keyup(function() {
					var $this = $(this);
					var name  =  $this.attr("name");
					
					if(name === "EXP_M_NUM"  || name === "EXP_D_NUM") {
						if($this.val().length > 2 ) {
							console.log("2자리 이상입니다.");
							$this.val($this.val().substring(0,2));
						}
					} else if(name === "CVC") {
						if($this.val().length > 3 ) {
							console.log("3자리 이상입니다.");
							$this.val($this.val().substring(0,3));
						}
					} else if(name === "CARD_NUM") {
						if($this.val().length > 16 ) {
							console.log("16자리 이상입니다.");
							$this.val($this.val().substring(0,16));
						}
					}	
				})
			}
	}

 
 $(function() {
	 validataion.vailInit();
 })



</script>

  <main class="page payment-page">
    <section class="payment-form dark">
      <div class="container">
        <div class="block-heading">
          <h2>결제페이지</h2>
          <p>결제내역을 확인 후, 결제를 진행해주세요.</p>
        </div>
        <form id="PayFrm" method="post" action="/completePay.do">
          <div class="products">
            <h3 class="title">결제</h3>
            <div class="item">
              <span class="price">
              <c:forEach items="${roomList}" var="roomList">
              	<c:if test="${param.roomNB eq roomList.gdCd}">
              	 	<c:out value="${roomList.salePrc}"/> 원
              	</c:if>
              </c:forEach>
             </span>
              <p class="item-name">1박 가격</p>
              <p class="item-description">총 인원의 1박 가격입니다. </p>
            </div>
            <div class="item">
              <span class="price">0 원</span>
              <p class="item-name">할인 가격</p>
              <p class="item-description">현재 할인 받을 수 있는 가격입니다.</p>
            </div>
            <div class="total">총 "<c:out value="${param.dateDiff}"/>" 박 합계<span class="price">
            <c:forEach items="${roomList}" var="roomList">
              	<c:if test="${param.roomNB eq roomList.gdCd}">
              	 	<c:out value="${roomList.salePrc*param.dateDiff}"/> 원
              	</c:if>
             </c:forEach>
            
              </span></div>
          </div>
          <div class="card-details">
            <h3 class="title">신용카드 상세</h3>
            <div class="row">
              <div class="form-group col-sm-7">
                <label for="card-holder">카드 소지자(성함)</label>
                <input id="card-holder" type="text" name="REV_NAME" class="form-control" placeholder="성함" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-5">
                <label for="">유효 기간 (MM/YY)</label>
                <div class="input-group expiration-date">
                  <input type="text" class="form-control num" name="EXP_M_NUM" placeholder="MM" aria-label="MM" aria-describedby="basic-addon1">
                  <span class="date-separator">/</span>
                  <input type="text" class="form-control num" name="EXP_D_NUM" placeholder="YY" aria-label="YY" aria-describedby="basic-addon1">
                </div>
              </div>
              <div class="form-group col-sm-8">
                <label for="card-number">카드번호(16자리)</label>
                <input id="card-number" type="text" name="CARD_NUM" class="form-control num" placeholder="카드 번호" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-4">
                <label for="cvc">CVC(카드 뒤 3자리)</label>
                <input id="cvc" type="text"  name="CVC" class="form-control num" placeholder="CVC" aria-label="Card Holder" aria-describedby="basic-addon1">
              </div>
              <div class="form-group col-sm-12">
                <input onclick="validataion.valiFn()" type="button" class="btn btn-primary btn-block" value="예약진행">
                 <input type="hidden" name="totalDay" value="${param.dateDiff}">
            	 <input type="hidden" name="gdCd" value="${param.roomNB}">
             	<input type="hidden" name="perCnt" value="${param.perCnt}">
             	<input type="hidden" name="checkin_date" value="${param.checkin_date}">
             	<input type="hidden" name="checkout_date" value="${param.checkout_date}">
<%--              	<input type="hidden" name="REV_NO" value="${param.dateDiff*param.roomNB*param.perCnt}">
 --%>             	
              </div>
            </div>
          </div>
        </form>
      </div>
    </section>
  </main>


var commAlertPop = (function() {
	
	var _popUp = function(title, contents, callback){

		// 팝업 태그 생성
		var 	divTag 		= document.createElement("div"),
				divTag2 	= document.createElement("div"),
				divTag3 	= document.createElement("div"),
				divTag4 	= document.createElement("div"),
				dlTag 		= document.createElement("dl"),
				dtTag 		= document.createElement("dt"),
				ddTag		= document.createElement("dd"),
				h2Tag 		= document.createElement("h2"),
				btnTag 		= document.createElement("button"),
				btnTag2 	= document.createElement("button");
				spanTag1 	= document.createElement("span"),
				spanTag2 	= document.createElement("span"),
				pTag 		= document.createElement("p");
		
		// 태그에 속성 추가
		divTag.className 	= "pop-wrap";
		divTag.id 			= "pop-01";
		divTag.style 		= "display:none";
		dtTag.className 	= "pop-header";
		h2Tag.className 	= "txt-medium-sm-02";
		h2Tag.innerText		= title;
		btnTag.type			= "button";
		btnTag.className 	= "btn-close";
		spanTag1.className 	= "ico-del-02";
		spanTag2.className 	= "blind";
		spanTag2.innerText	= "팝업창 닫힘";
		ddTag.className		= "pop-body";
		divTag2.className 	= "pop-cont";
		divTag3.className 	= "pop-msg";
		pTag.className	 	= "txt-light txt-center";
		pTag.innerText		= contents;
		divTag4.className	= "pop-btn-wrap txt-center";
		btnTag2.type		= "button";
		btnTag2.className	= "btn-footer-close txt-medium";
		btnTag2.innerText	= "확인";
		btnTag2.id			= "popConfirmBtn";
		
		// 태그 붙이기
		divTag.appendChild(dlTag);
		dlTag.appendChild(dtTag);
		dlTag.appendChild(ddTag)
		
		// dt태그 구성
		dtTag.appendChild(h2Tag);
		// h2Tag.appendChild(btnTag);
		dtTag.appendChild(btnTag);
		btnTag.appendChild(spanTag1);
		btnTag.appendChild(spanTag2);
		
		// dd태그 구성
		ddTag.appendChild(divTag2);
		ddTag.appendChild(divTag4);
		
		divTag2.appendChild(divTag3);
		divTag3.appendChild(pTag);
		
		divTag4.appendChild(btnTag2);
		
		document.getElementsByTagName("body")[0].appendChild(divTag);
		
		$("#pop-01").bPopup();
	
		
		if(typeof callback === "function"){
			$("#popConfirmBtn").click( function() {
				$(this).closest('.pop-wrap').bPopup().close();
				$("#pop-01").remove();
				callback();
			});
		}
		
	} 
	return {popUp : _popUp};
	
}());




	  var reservation = {
			 revSub : function() {
				 var that = this;
				 
				 $("input[type=button]").on("click",function(e) {
					 var dateDiff = that.dateDiifFn($(".checkin_date").val(),$(".checkout_date").val());
					 $("input[type=hidden]").val(dateDiff);
					 
					 alert("예약이 가능합니다. 예약 페이지로 넘어갑니다.")
					
					 $("#RSV").submit();
				 })
			
	 	 },
	 		dateDiifFn: function(_date1, _date2) {
			 	    var diffDate_1 = _date1 instanceof Date ? _date1 : new Date(_date1);
			 	    var diffDate_2 = _date2 instanceof Date ? _date2 : new Date(_date2);
			 	 
			 	    diffDate_1 = new Date(diffDate_1.getFullYear(), diffDate_1.getMonth()+1, diffDate_1.getDate());
			 	    diffDate_2 = new Date(diffDate_2.getFullYear(), diffDate_2.getMonth()+1, diffDate_2.getDate());
			 	 
			 	    var diff = Math.abs(diffDate_2.getTime() - diffDate_1.getTime());
			 	    diff = Math.ceil(diff / (1000 * 3600 * 24));
			 	 
			 	    return diff;
	 	},
	 		chooseInit : function() {
		 	 		this.ChooseFn();
		 	 		this.revSub();
	 	 	},
	 	 	
	 	 	ChooseFn : function() {
	 	 		$(".roomList").on("change",function(e) {
	 	 			var thisParam = $(this).val();
	 	 			var form	={"RoomNM" : thisParam};
	 	 			$(".PersonCnt").children().remove();
	 	 			
	 	 			$.ajax({
	 	 				url			: '/selectRoom.do',
	 	 				type		: "post",
	 	 				contentType	: "application/json",
	 	 				data		: JSON.stringify(form),
	 	 				
	 	 				success		: function(data) {
	 	 					//console.log(data);
	 	 						var per 	= data.PERSON_MAX,
	 	 							gdCd 	= data.GD_CD;
	 	 						
	 	 						
	 	 						if(gdCd.length > 0){
	 	 							for(var j = 0; j < per; j++) {
	 	 									var perCnt	= j+1;
	 	 									var optionStr  = "<option value=" + gdCd + perCnt + ">" + perCnt + "명</option> ";
	 	 									
	 	 									$(".PersonCnt").append(optionStr);
	 	 								}
	 	 						} else {
	 	 							$(".PersonCnt").append("<option value=''>없음</option>");
	 	 						}
	 	 						
	 	 						
	 	 				}
	 	 			});
	 	 			
	 	 		});
	 	 	}
	  }
	


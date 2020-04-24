<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<title>Insert title here</title>
<style>
div.all {
	width: 100%;
	height: 300px;
}

div.left {
	width: 50%;
	float: left;
	box-sizing: border-box;
}

div.right {
	width: 50%;
	float: right;
	box-sizing: border-box;
	padding-right: 5%;
}
</style>
</head>
<body>

	<div class="hero-wrap hero-bread"
		style="background-image: url('../images/bg_1.jpg');">
		<div class="container">
			<div 
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">Checkout</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
	<form method="post"	action="${pageContext.request.contextPath}/shopping/complete_order"	id="orderform" >
		<div class="container">
			<div class="row justify-content-center">
				<div>
					<h3 class="mb-4 billing-heading">상품목록</h3>
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>&nbsp;</th>
									<th>상 품 명</th>
									<th>수 량</th>
									<th>가 격</th>
									<th>배 송 비</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="count" value="0" />
								<c:set var="totalpay" value="0" />
								<c:forEach var="list" items="${cartlist }">
									<c:set var="count" value="${count+1}" />
									<tr class="text-center">
										<td class="image-prod"><div class="img"
												style="background-image:url(${pageContext.request.contextPath}/img/${list.thumbnail });"></div></td>

										<td class="product-name">
											<h3>${list.productName }</h3>
										</td>
										<td class="quantity">${list.qty }</td>

										<td class="price">${list.price * list.qty}</td>
										<c:set var="totalpay"
											value="${totalpay+ list.price * list.qty }" />
										<c:if test="${count == 1}">
											<td rowspan="${fn:length(cartlist)}"><span id="shipping">2,500원
													<br>(5만원 이상 구매시 배송비 무료)
											</span></td>
										</c:if>

									</tr>
									<!-- END TR-->
									<input type="hidden" name="nums" value="${list.cartNum }">
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">


					<input type="hidden" name="memNum" value="${memNum }">
					<input type="hidden" name="memName" value="${member.name }">
					<h3 class="mb-4 billing-heading">주문자 정보 - ${member.name }</h3>
					<h3 class="mb-4 billing-heading">배송지 정보</h3>
					<div class="row align-items-end">

						<div class="col-md-12">
							<div class="form-group mt-4">
								<div class="radio">
									<input type="radio" name="select" value="0"	onclick="div_Change(this.value,'addr_Newform');">
									신규 배송지 <input type="radio" name="select" value="1" onclick="div_Change(this.value,'addr_Oldform');">
									기존 배송지
								</div>
							</div>
						</div>
						<div id="addr_Newform">
							<!-- style="display:none;" -->
							새로운거<br>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" name="recipient" placeholder="수령인" autocomplete="off">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="text" id="postcode" name="zipcode"
										placeholder="우편번호" autocomplete="off">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<input type="button" class="btn btn-primary py-3 px-4"
										onclick="postnum_click()" value="우편번호 찾기" autocomplete="off">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" id="address" class="form-control"
										name="address" placeholder="도로명주소" autocomplete="off">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control" id="detailAddress"
										name="address" placeholder="상세주소" autocomplete="off">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control" id="extraAddress"
										name="address" placeholder="참고항목" disabled>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control" id="memo" name="memo"
										placeholder="배송메모" >
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-12">
								<div class="form-group">
									<input type="checkbox" name="addradd" value="1">배송지목록에
									추가
								</div>
							</div>


						</div>
						<div id="addr_Oldform" style="display: none;">
							이전에거<br>
							<div>
								<c:forEach var="addr" items="${reg_address }">
									<input type="radio" name="sel_address"	value="${addr.addressNum}" onclick="div_address(this.value);">${addr.recipient }
								</c:forEach>
							</div>
							<c:forEach var="addr" items="${reg_address }">
								<div id="${addr.addressNum }" style="display: none;">

									${addr.recipient }<br> ${addr.zipcode }<br>
									<c:set var="addre" value="${addr.address}" />
									${addr.address}
									
								</div>
								
							</c:forEach>
							<div class="form-group">
									<input type="text" class="form-control" id="memo2" name="memo2"
										placeholder="배송메모" >
							</div>

						</div>


					</div>

					<!-- END -->
				</div>
				<div class="col-xl-5">
					<div class="row mt-5 pt-3">
						<div class="col-md-12 d-flex mb-5">
							<div class="cart-detail cart-total p-3 p-md-4">
								<h3 class="billing-heading mb-4">Order Total</h3>
								<p class="d-flex">
									<span>Subtotal</span> <span>${totalpay}</span>
								</p>
								<p class="d-flex">
									<span>배송비</span> <span id="shipping2">2,500</span>
								</p>

								<hr>
								<p class="d-flex total-price">
									<span>Total</span> <span> 
									<c:if test="${totalpay >= 50000 }">
										<c:set var="amount" value="${totalpay}" />
									</c:if> 
									<c:if test="${totalpay < 50000 }">
										<c:set var="amount" value="${totalpay+2500}" />
									</c:if>
									 ${amount } 
									<input type="hidden" name="amount" value="${amount }">
									</span>
								</p>
							</div>
						</div>
						<div class="col-md-12">
							<div class="cart-detail p-3 p-md-4">
								<h3 class="billing-heading mb-4">결제정보</h3>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="howtopay" value="kakaopay" class="mr-2"> 카카오페이</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="howtopay" value="card" class="mr-2"> 카드결제</label>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="howtopay" value="phonepay" class="mr-2"> 핸드폰결제</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="radio">
											<label><input type="radio" name="howtopay"	value="deposit" class="mr-2"> 무통장입금</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="col-md-12">
										<div class="checkbox">
											<!-- <label><input type="checkbox" value="" class="mr-2"> I have read and accept the terms and conditions</label> -->
										</div>
									</div>
								</div>
								<p>
									<input type="button" id="paying" class="btn btn-primary py-3 px-4" value="결제하기" >
								</p>
							</div>
						</div>
					</div>
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</form>
	</section>
	<!-- .section -->


</body>
<script>
	function check_info(){
		var chk_count = 0;
	    var selected = document.getElementsByName('select');
	    var sel_count = 0;
	    for(var i=0;i<selected.length;i++){
			if(selected[i].checked == true){ 
				sel_count++;
			}
		}
	    if(sel_count < 1){
            alert("배송지를 선택해주세요"); 
			return false;
		}else{	
			if(selected[0].checked == true){
		    	if(!($("input[name=recipient]").val())){
					alert("수령인을 입력하세요.");
					$("input[name=recipient]").focus();
					return false;
				}
				if(!($("input[name=zipcode]").val())){
					alert("우편번호를 입력하세요.");
					$("input[name=zipcode]").focus();
					return false;
				}
				if(!($("input[name=address]").eq(0).val())){
					alert("도로명주소를 입력하세요.");
					$("input[name=address]").eq(0).focus();
					return false;
				}
				if(!($("input[name=address]").eq(1).val())){
					alert("상세주소를 입력하세요.");
					$("input[name=address]").eq(1).focus();
					return false;
				}
				if(!($("input[name=memo]").val())){
					alert("배송메모를 입력하세요.");
					$("input[name=memo]").focus();
					return false;
				}
				chk_count++;
		    }else{
		    	var chk_radio = document.getElementsByName('sel_address');
				var sel_type = 0;
				for(var i=0;i<chk_radio.length;i++){
					if(chk_radio[i].checked == true){ 
						sel_type++;
					}
				}
				
				if(sel_type<1){
		            alert("주소를 선택해주세요"); 
					return false;
				}else{
					if(!($("input[name=memo2]").val())){
						alert("배송메모를 입력하세요.");
						$("input[name=memo2]").focus();
						return false;
					}
					chk_count++;
				}
		    }
		}
	    var pay = document.getElementsByName('howtopay');
	    var paycount = 0;
	    for(var i=0; i<pay.length; i++){
	        if(pay[i].checked == true){ 
	           paycount++;
	        }
	    }
	    if(paycount<1){
            alert("결제방법을 선택해주세요"); 
			return false;
		}else{
			chk_count++;
		}
	    if(chk_count>=2){
	    	return true;
	    }else{
	    	return false;
	    }
 	}
	

	var success_pay = false;
    function paying(){
    	var IMP = window.IMP; // 생략가능
        IMP.init('imp89691835'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        var pay = $("input[name='howtopay']:checked").val();
        var pgsa = '';
        switch(pay){
        case "kakaopay" : pgsa='kakaopay'; break;
        case "card" : pgsa='html5_inicis'; break;
        case "phonepay" : pgsa='danal'; break;
        }
      
       console.log($("#orderform").serialize());
        IMP.request_pay({
            pg : pgsa,
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'Home chef 주문 결제',
            amount : ${amount},
            buyer_email : '${member.email}',
            buyer_name : '${member.name}',
            buyer_tel : '01093529429',
            //buyer_postcode : '123-456',
          	m_redirect_url : '${pageContext.request.contextPath}/shopping/complete2'
        },function(rsp) {
        	 if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
        	      // jQuery로 HTTP 요청
        	      $.ajax({
        	          url: "${pageContext.request.contextPath}/shopping/complete", // 가맹점 서버
        	          method: "POST",
        	          data: $("#orderform").serialize(),
        	          contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        	          dataType: 'html'
        	           /* { 
        	        	  "select" : select,
        	        	  "sel_address" : $("input[name='sel_address']:checked").val(),
        	        	  "addradd" : $("input[name='addradd']:checked").val()
        	          } */
        	          
        	      }).done(function (data) {
        	        // 가맹점 서버 결제 API 성공시 로직
        	      })
        	    } else {
        	      alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        	      return false;
        	    }
        	 	location.href="${pageContext.request.contextPath}/shopping/complete2";
        	  });
               
   		 }
	
     $("#paying").click(function(){
    	
    	if(check_info()==false){
    		return false;
    	}
        paying();
      	
        
        
    });
	/* $(function() {    //화면 다 뜨면 시작
	    var searchSource = ["경비실에 맡겨주세요.", "부재시, 경비실에 맡겨주세요. ", "부재시, 전화주세요.", "부재시, 문자 주세요." ]; // 배열 형태로 
	    $("#memo").autocomplete({  //오토 컴플릿트 시작
	        source : searchSource,    // source 는 자동 완성 대상
	        select: function(event, ui) {
	            console.log(ui.item);
	        }
	    });
	}); */

	function div_Change(value){
		 // 라디오 버튼 value 값 조건 비교
		 if(value == "1"){
		 	document.getElementById('addr_Oldform').style.display = "block"; // 보여줌
		 	document.getElementById('addr_Newform').style.display = "none"; // 숨김
		 }else{
			 document.getElementById('addr_Newform').style.display = "block"; // 보여줌
			 document.getElementById('addr_Oldform').style.display = "none"; // 숨김
		 }
	}
	
	function div_address(value){
		 // 라디오 버튼 value 값 조건 비교
		 var arr = new Array();
		 <c:forEach items="${reg_address}" var="item1">
		 arr.push("${item1.addressNum}");
		 </c:forEach>
		
		 for(var i = 0; i<arr.length; i++){
			// alert("value : "+value+", addressNum : "+arr[i]);
			// console.log("value : "+value+", addressNum : "+arr[i]);
			 document.getElementById(arr[i]).style.display = "none"; // 숨김
			 if(value == arr[i]){
				 document.getElementById(arr[i]).style.display = "block"; // 보여줌
			}
		 }
			
			
	}

	
	function postnum_click(){
	   new daum.Postcode({
	       oncomplete: function(data) {
	       	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	           // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	           var addr = ''; // 주소 변수
	           var extraAddr = ''; // 참고항목 변수
	
	           //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	           if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	               addr = data.roadAddress;
	           } else { // 사용자가 지번 주소를 선택했을 경우(J)
	               addr = data.jibunAddress;
	           }
	
	           // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	           if(data.userSelectedType === 'R'){
	               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                   extraAddr += data.bname;
	               }
	               // 건물명이 있고, 공동주택일 경우 추가한다.
	               if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	               }
	               // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	               if(extraAddr !== ''){
	                   extraAddr = ' (' + extraAddr + ')';
	               }
	               // 조합된 참고항목을 해당 필드에 넣는다.
	               document.getElementById("extraAddress").value = extraAddr;
	           
	           } else {
	               document.getElementById("extraAddress").value = '';
	           }
	
	           // 우편번호와 주소 정보를 해당 필드에 넣는다.
	           document.getElementById('postcode').value = data.zonecode;
	           document.getElementById("address").value = addr;
	           // 커서를 상세주소 필드로 이동한다.
	           document.getElementById("detailAddress").focus();
	       }
	
	   }).open();
	}



	if(${totalpay} >= 50000){
		document.getElementById('shipping').innerHTML = "(무료)";
		document.getElementById('shipping2').innerHTML = "0";
	}
</script>
</html>
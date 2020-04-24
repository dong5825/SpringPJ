<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

    <div class="hero-wrap hero-bread" style="background-image: url('../images/bg_1.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span></p>
                    <h1 class="mb-0 bread">Checkout</h1>
                </div>
            </div>
        </div>
    </div>

<div>
	<form method="post" action="${pageContext.request.contextPath}/shopping/complete_order">
		<!-- 상품목록 -->
		<div>
			<h3>상품목록</h3>
			<div>
			<table border="1">
				<thead>
					<tr>
						<td>상품명</td> <td>수량</td> <td>가격</td> <td>배송비</td> 
					</tr>
				</thead>
				<tbody>
					<c:set var="count" value="0"/>
					<c:set var="totalpay" value="0"/>
					<c:forEach var="list" items="${cartlist }">
						<c:set var="count" value="${count+1}"/><!-- 표 셀합치기 -->
						<tr>
							<td>${list.productName }</td>
							<td>${list.qty }</td>
							<td>${list.price * list.qty}</td>
							<c:set var="totalpay" value="${totalpay+ list.price * list.qty }"/>
							<c:if test="${count == 1}">
								<td rowspan="${fn:length(cartlist)}"><span id="shipping">2,500원<br>(5만원 이상 구매시 배송비 무료)</span></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>			
			</table>
			
			</div>
			<div></div>
		
		</div>
		
		<!-- 배송지 정보(주소등록) -->
		<div>
			<h3>배송지 정보</h3>
			<div>
				<input type="radio" name="selectNewOrOld" value="1" onclick="div_Change(this.value,'addr_Newform');"> 신규배송지  
				<input type="radio" name="selectNewOrOld" value="2" onclick="div_Change(this.value,'addr_Oldform');"> 기존배송지
			</div>
			<div id="addr_Newform">
				새로운거<br>
				
					<input type="text" id="postcode" placeholder="우편번호">
					<input type="button" onclick="postnum_click()" value="우편번호 찾기"><br>
					<input type="text" id="address" placeholder="도로명주소">
					<input type="text" id="detailAddress" placeholder="상세주소">
					<input type="text" id="extraAddress" placeholder="참고항목">
					<input type="checkbox" name="addr_default">기본배송지설정
					<input type="checkbox" name="addr_add">배송지목록에 추가<br>
					<input type="text" id="shippingMemo" placeholder="배송메모">
				
			</div>
			<div id="addr_Oldform">
				이전에거<br>
				<input type="text" id="shippingMemo" placeholder="배송메모">
			</div>
		</div>
		<script>
			function div_Change(value,id){
				 // 라디오 버튼 value 값 조건 비교
				 if(value == "1"){
				 	document.getElementById(id).style.display = ""; // 보여줌
				 	document.getElementById('addr_Oldform').style.display = "none"; // 숨김
				 }else{
					 document.getElementById(id).style.display = ""; // 보여줌
					 document.getElementById('addr_Newform').style.display = "none"; // 숨김
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
		</script>
		
		<!-- 결제정보 -->
		<div class="all">
			<h3>결제정보</h3>
			
			<div>
				<div class="left">결제수단<br>
					<input type="radio" name="howtopay" value="pay"> 페이결제 <br>
					<input type="radio" name="howtopay" value="card" > 카드결제 <br>
					<input type="radio" name="howtopay" value="banktransfer" > 실시간계좌이체 <br>
					<input type="radio" name="howtopay" value="phonepay" > 핸드폰결제 <br>
					<input type="radio" name="howtopay" value="deposit" > 무통장입금 <br>
				</div>
				<div class="right">
					<h5>결제금액</h5>
					<h4>(결제금액)</h4>
					<hr>
					총상품금액 : ${totalpay}<br>
					배송비 :<span id="shipping2">2,500</span>원 <br>
				</div>	
			</div>
		</div>
		<input type="submit" value="결제하기">
	</form>
</div>
</body>
<script>
	if(${totalpay} >= 50000){
		document.getElementById('shipping').innerHTML = "(무료)";
		document.getElementById('shipping2').innerHTML = "0";
	}
</script>
</html>
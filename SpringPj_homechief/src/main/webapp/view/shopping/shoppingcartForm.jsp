
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="hero-wrap hero-bread" style="background-image: url('../images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">My Cart</h1>
          </div>
        </div>
      </div>
    </div> 

    <section class="ftco-section ftco-cart">
    	<form name="cartlist" method="post" >
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				
    				<div class="cart-list">
	    				<table class="table">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th><input type="checkbox" id="cart_all" checked ></th>
						        <th>&nbsp;</th>
						        <th>상 품 명</th>
						        <th>수  량</th>
						        <th>가  격</th>
						        <th>배 송 비</th>
						      </tr>
						    </thead>
						    <tbody>
						    <c:set var="count" value="0"/>
							<c:set var="totalpay" value="0"/>
							<c:forEach var="list" items="${cartlist }">
							<c:set var="count" value="${count+1}"/>
						      <tr class="text-center">
						        <td><input type="checkbox" class="chk" name="cart" value="${list.cartNum },${list.price * list.qty}" checked onclick="itemSum();" >
									<input type="hidden" id="${list.cartNum }" value="${list.price * list.qty}"/> </td>
						        <td class="image-prod"><div class="img" style="background-image:url(${pageContext.request.contextPath}/img/${list.thumbnail });"></div></td>
						        
						        <td class="product-name">
						        	<h3>${list.productName }</h3>
						        </td>
						        <td class="quantity">
						        	${list.qty }
					          	</td>
					          	
					          	<td class="price">${list.price * list.qty}</td>
				        		<c:set var="totalpay" value="${totalpay+ list.price * list.qty }"/>	
								<c:if test="${count == 1}">
									<td rowspan="${fn:length(cartlist)}"> <span id="shipping">2,500원 <br>(5만원 이상 구매시 배송비 무료)</span></td>	
								</c:if>
						        
						      </tr><!-- END TR-->
							</c:forEach>
						    </tbody>
						  </table>
					  </div>
					  <div>
					  	<button type="submit" class="btn btn-primary py-3 px-4" style="margin: 20px; font-color: white;" formaction="${pageContext.request.contextPath}/shopping/cart_delete" onclick="return check_delete()"> 선택항목 삭제 </button>
					  </div>
					  
    			</div>
    		</div>
    		<div class="row justify-content-end">
    			<div class="col-lg-12 mt-5 cart-wrap ftco-animate">
    				<div class="cart-total mb-3">
    					<div id="price_detail">
							<h3><span id="producttot" ></span> + 
							<span id="shipping_amount" >2500 원</span></h3>
						</div>
						<div>
							<h2>총 주문 금액  <span id="price_total"></span></h2> 
						</div>
    				</div>
    				<div>			
						<button type="submit" class="btn btn-primary py-3 px-4" formaction="${pageContext.request.contextPath}/shopping/order" >주문하기</button>
						<a class="btn btn-primary py-3 px-4" onclick="javascript:history.back(-1)">이전 페이지</a>
						
					</div>
    			</div>
    		</div>
			</div>
			</form>
		</section>

<script>
	window.onload = function() {
    	var tot = document.getElementById("producttot");
    	tot.innerHTML = ${totalpay}+"원";
    	document.getElementById('price_total').innerHTML = (${totalpay} + 2500) + " 원";
		if(${totalpay} >= 50000){
			document.getElementById('shipping').innerHTML = "(무료)";
			document.getElementById('shipping_amount').innerHTML = "0원";
			document.getElementById('price_total').innerHTML = ${totalpay} + " 원";
		}
    } 
	var sum = 0;
	function itemSum(){
	   var sum = 0;
	   var chk = document.getElementsByName('cart');
	   for(var i=0; i < chk.length; i++ ){
	       if( chk[i].checked == true ){
	    	   var str = chk[i].value.split(',');
	    	   sum += parseInt(str[1]);
	       }
	       
	   }
	   document.getElementById('producttot').innerHTML = sum + " 원";
	   var ship = check_fee(sum);
	   document.getElementById('price_total').innerHTML = (sum+ship) + " 원";
	}
	
	function check_fee(sum){
		if(sum>=50000){
			document.getElementById('shipping_amount').innerHTML = "0원";
			return 0;
		}else{
			document.getElementById('shipping_amount').innerHTML = "2500원";
			return 2500;
		}
		
		
	}
	function check_delete(){
		var result = confirm('선택한 상품을 삭제하겠습니까?')
		if(result==false){
		    return false;
		}
	}
	
	$(function(){ //전체선택 체크박스 클릭 
		$("#cart_all").click(function(){ //만약 전체 선택 체크박스가 체크된상태일경우 
			if($("#cart_all").prop("checked")) { //해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); // 전체선택 체크박스가 해제된 경우
				console.log("check");
				$("#producttot").html(${totalpay})
				var total = check_fee(${totalpay}) + ${totalpay}
				$("#price_total").html(total + " 원")
			} else { //해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
				$("#producttot").html(0)
				$("#shipping_amount").html("2500원")
				$("#price_total").html("0 원")
			} 
		})
		// 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제
		$(".chk").click(function(){
		    if($("input[name='cart']:checked").length == ${fn:length(cartlist)}){
		        $("#cart_all").prop("checked", true);
		    }else{
		        $("#cart_all").prop("checked", false);
		    }
		});

	})
	
	if(${totalpay} >= 50000){
		document.getElementById('shipping').innerHTML = "(무료)";
		document.getElementById('shipping_amount').innerHTML = "0원";
	}
	
</script>


</body>
</html>
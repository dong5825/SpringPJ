
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Jjim</span></p>
            <h1 class="mb-0 bread">Wish List</h1>
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
						        <th>가  격</th>
						      </tr>
						    </thead>
						    <tbody>
							<c:forEach var="list" items="${jjimlist }">
						      <tr class="text-center">
						        <td><input type="checkbox" class="chk" name="jjim" value="${list.jjimNum }" checked >
						         <td class="image-prod"><div class="img" style="background-image:url(${pageContext.request.contextPath}/img/${list.thumbnail });"></div></td>						        
						        <td class="product-name">
						        	<h3>${list.productName }</h3>
						        </td>
					          	
					          	<td class="price">${list.price}</td>
						        
						      </tr><!-- END TR-->
							</c:forEach>
						    </tbody>
						  </table>
					  </div>
					  <div>
					  	<button type="submit" class="btn btn-primary py-3 px-4" style="margin: 20px; font-color: white;" formaction="${pageContext.request.contextPath}/shopping/jjim_delete" onclick="return check_delete()"> 선택항목 삭제 </button>
					  </div>
					  
    			</div>
    		</div>
    		
			</div>
			</form>
		</section>

<script>
	
	
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
	
</script>


</body>
</html>
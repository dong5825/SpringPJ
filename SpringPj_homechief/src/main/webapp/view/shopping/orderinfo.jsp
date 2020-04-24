
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
	<div class="hero-wrap hero-bread"
		style="background-image: url('../images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span>Checkout</span>
					</p>
					<h1 class="mb-0 bread">Order Info</h1>
				</div>
			</div>
		</div>
	</div>

    <section class="ftco-section ftco-cart">
			<div class="container">
				<div class="row">
    			<div class="col-md-12 ftco-animate">
    				<div class="cart-list">
	    				<table class="table" id="orderinfo">
						    <thead class="thead-primary">
						      <tr class="text-center">
						        <th>주문번호</th>
						        <th>수 령 인</th>
						        <th>주 소</th>
						        <th>가  격</th>
						        <th>결제방법</th>
						      </tr>
						    </thead>
						    <tbody>
						    <script>
							 	var list = new Array();
							</script>
							<c:set var="index" value="0"/>
							<c:forEach var="list" items="${orderlist }">
						      	<tr class="toggle text-center">
							        <td class="product-name"><h3>${list.orderNum }</h3></td>
									<td class="product-name"><h3>${list.recipient }</h3></td>
							        <td class="product-name"><h3>${list.address }</h3></td>
							        <td class="price">${list.amount}</td>
							        <td class="product-name"><h3>${list.howtopay }</h3></td>
							    </tr><!-- END TR-->
							    	
									<c:forEach var="list2" items="${productlist }">
									<c:if test="${list.orderNum == list2.orderNum}">
									<script>
							    		list.push("${list2.orderNum}");
							    	</script>
									<tr class="open text-center" id="${index}" style="display:none;">
								        <td class="image-prod"><div class="img" style="background-image:url(${pageContext.request.contextPath}/img/${list2.thumbnail });"></div></td>
										<td class="product-name"><h3>${list2.productName }</h3></td>
								        <td class="price">${list2.qty}</td>
								        <td class="product-name"><h3>${list2.price }</h3></td>
								    </tr>
								    
								    <c:set var="index" value="${index+1}"/>
								    
								    </c:if>
									</c:forEach>
								    
							</c:forEach>
						    </tbody>
						  </table>
					  </div>
    			</div>
    		</div>
			</div>
		</section>
<script>
	console.log(list);
    // html dom 이 다 로딩된 후 실행된다.
    $(document).ready(function(){
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        
        $('.toggle').click(function(){
        	var str = ""
   	        var tdArr = new Array();    // 배열 선언
   	     	var opentr = new Array();    // 배열 선언
   	            
   	        // 현재 클릭된 Row(<tr>)
   	        var tr = $(this);
   	        var td = tr.children();

   	        
   	        td.each(function(i){
	   	        tdArr.push(td.eq(i).text());
	   	    });
			
   	        
   	        
   	    	var no = td.eq(0).text();
   	    	for(var i = 0 ; i<list.length; i++){
   	    		if(no==list[i]){
   	    			opentr.push(i);
   	    			var open = $('#'+i);
   	                open.slideDown(3000);
   	            }else{
   	            	var open = $('#'+i);
   	            	open.slideUp();
   	            } 
   	    	}
			
   	    	console.log(opentr);
        	console.log("click! - "+no);
        	
            var open = $('.open').attr('id');
            console.log(open);
            for(var i = 0 ; i<list.length; i++){
            		
   	    	}
            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
            
        });
    });
</script>

</body>
</html>
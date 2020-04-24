<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Insert title here</title>
</head>
<style>
i {
	font-size: 30px;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>

<body>
 	<div class="hero-wrap hero-bread sub_headbg"
		style="background-image: url('../images/bg_4.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index.html">Home</a></span> <span
							class="mr-2"><a href="index.html">Product</a></span> <span>HOMECHEF 스토어</span>
					</p>
					<h1 class="mb-0 bread">HOMECHEF 스토어</h1>
				</div>
			</div>
		</div>
	</div> 
	<form name="select_ingredient" method="post">
		<input type="hidden" name="productName" value="${sale.productname }">
		<input type="hidden" name="price" value="${sale.price }">
		<input type="hidden" name="thumbnail" value="${sale.thumbnail }">
		<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-5 ftco-animate">
					<a class="image-popup">
					<img src="${pageContext.request.contextPath }/img/${sale.thumbnail}" class="img-fluid">
					</a>
				</div>
				<div class="col-lg-6 product-details pl-md-5 ftco-animate">
					<h3>${sale.productname }</h3>
					<div class="rating d-flex">
						<p class="text-left mr-4">
							<a href="#" class="mr-2">5.0</a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a> <a href="#"><span
								class="ion-ios-star-outline"></span></a>
						</p>
						<p class="text-left mr-4">
							<a href="#" class="mr-2" style="color: #000;">100 <span
								style="color: #bbb;">Rating</span></a>
						</p>
						<p class="text-left">
							<a href="#" class="mr-2" style="color: #000;">${sale.stock } <span
								style="color: #bbb;">Sold</span></a>
						</p>
					</div>
					<p class="price">
						<span>${sale.price } 원</span>
					</p>
					<p>부드러운 두부와 계란의 만남 계란물을 묻혀서 더욱 맛있게 만드는 두부부침</p>
					<div class="row mt-4">
						<!-- <div class="col-md-6">
								<div class="form-group d-flex">
		              <div class="select-wrap">
	                  <div class="icon"><span class="ion-ios-arrow-down"></span></div>
	                  <select name="" id="" class="form-control">
	                  	<option value="">Small</option>
	                    <option value="">Medium</option>
	                    <option value="">Large</option>
	                    <option value="">Extra Large</option>
	                  </select>
	                </div>
		            </div>
							</div>
							<div class="w-100"></div> -->
						<div class="input-group col-md-6 d-flex mb-3">
							<span class="input-group-btn mr-2">
								<button type="button" class="quantity-left-minus btn"
									data-type="minus" data-field="" value="-"
									onclick="count_qty('-')">
									<i class="ion-ios-remove"></i>
								</button>
							</span> <input type="text" id="qty_value" name="qty"
								class="form-control input-number" value="1" min="1" max="100">
							<span class="input-group-btn ml-2">
								<button type="button" class="quantity-right-plus btn"
									data-type="plus" data-field="" onclick="count_qty('+')"
									value="+">
									<i class="ion-ios-add"></i>
								</button>
							</span>

						</div>
						<div class="col-md-12">
							<div class="price_box">
								<div class="price_total2">
									총 합계금액 <span id="total">${sale.price}원</span>
								</div>
							</div>
						</div>
						<div class="w-100"></div>
					
					</div>
					<div class="btn_choice_box">
                                <div>
                                    <button type="submit" id="cartBtn" class="btn_add_cart" formaction="${pageContext.request.contextPath}/shopping/addcart"><img src="//recipe1.ezmember.co.kr/img/mobile/icon_basket.png" width="24" style="margin:-4px 5px 0 0; vertical-align: middle;">장바구니</button>
                                    <button type="submit" id="wishBtn" class="btn_add_wish" formaction="${pageContext.request.contextPath}/shopping/regist_jjim?saleNum=${sale.saleNum}" onclick="jjim();">
                                    <img src="//recipe1.ezmember.co.kr/img/mobile/icon_scrap3.png" width="26" style="margin:-4px 5px 0 0; vertical-align: middle;" >찜하기</button>
                                  
                                </div>
                            </div>
				<!-- 	<p class="bag_box">
						<input type="submit" value="장바구니 담기"
							class="btn btn-black py-3 px-5">
					</p> -->
				</div>

			</div>
			<div class="view_step">
				<div class="view_tag">
			<c:forTokens items="${sale.hashtag }" delims="#" var="item">
    <a href="#">#${item}</a>
   </c:forTokens>
				
				</div>
			</div>
		</div>
		</section>

		<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center mb-3 pb-3">
				<div class="col-md-12 heading-section text-center ftco-animate">
					<span class="subheading">Products</span>
					<h2 class="mb-4">Related Products</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia</p>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="../images/product-1.jpg" alt="Colorlib Template"> <span
							class="status">30%</span>
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">Bell Pepper</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span class="mr-2 price-dc">$120.00</span><span
											class="price-sale">$80.00</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="../images/product-2.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">Strawberry</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>$120.00</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="../images/product-3.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">Green Beans</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>$120.00</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="product">
						<a href="#" class="img-prod"><img class="img-fluid"
							src="../images/product-4.jpg" alt="Colorlib Template">
							<div class="overlay"></div> </a>
						<div class="text py-3 pb-4 px-3 text-center">
							<h3>
								<a href="#">Purple Cabbage</a>
							</h3>
							<div class="d-flex">
								<div class="pricing">
									<p class="price">
										<span>$120.00</span>
									</p>
								</div>
							</div>
							<div class="bottom-area d-flex px-3">
								<div class="m-auto d-flex">
									<a href="#"
										class="add-to-cart d-flex justify-content-center align-items-center text-center">
										<span><i class="ion-ios-menu"></i></span>
									</a> <a href="#"
										class="buy-now d-flex justify-content-center align-items-center mx-1">
										<span><i class="ion-ios-cart"></i></span>
									</a> <a href="#"
										class="heart d-flex justify-content-center align-items-center ">
										<span><i class="ion-ios-heart"></i></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</section>
	</form>
	
	
	
</body>
<script type="text/javascript">
function jjim(){
	if(${memNum == null}){
		alert("로그인 해주세요")
	}else{
		alert("찜목록에 등록 되었습니다.");	
	}
	
}

function count_qty(mark){
   
   var num = document.getElementById('qty_value').value;
   if(mark == '+'){
      if(num < ${sale.stock})
         num++;
      else 
         alert("수량이 없습니다.")
   }
   if(mark == '-'){
      if(num > 1)
         num--;
      else if(num<= 1)
         alert("1개 이상부터 구매할 수 있습니다.")
   }
   
   document.getElementById('total').innerHTML=(num * ${sale.price})+" 원";
   document.getElementById('qty_value').value=num;
   
}

</script>

</html>
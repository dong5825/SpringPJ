<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<title>Insert title here</title>
</head>
<body>

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_4.jpg');">
        <div class="container">
            <div class="row no-gutters slider-text align-items-center justify-content-center">
                <div class="col-md-9 ftco-animate text-center">
                    <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Products</span></p>
                    <h1 class="mb-0 bread">Products</h1>
                </div>
            </div>
        </div>
    </div>

    <section class="ftco-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-10 mb-5 text-center">
                    <ul class="product-category">
                    <c:forEach var="cate" items="${cate}">
                        <li><a href="${pageContext.request.contextPath }/shop?category=${cate.cateNum}" class=${cate.cateNum==category?'active':''}>${cate.cateName}</a></li>
                        <c:set var="catenum" value="${cate.cateNum==category?category:0}"/>
                    </c:forEach>
                        
                    </ul>
                </div>
            </div>
            <div class="row">
            	<c:forEach var="sale" items="${sales}">
                <div class="col-md-6 col-lg-3 ftco-animate">
                    <div class="product">
                        <a href="${pageContext.request.contextPath }/shopping/list?saleNum=${sale.saleNum}" class="img-prod" >
                        	<img class="img-fluid" src="${pageContext.request.contextPath }/img/${sale.thumbnail}" alt="Colorlib Template">
                            <div class="overlay"></div>
                        </a>
                        <div class="text py-3 pb-4 px-3 text-center">
                            <h3><a href="${pageContext.request.contextPath }/shopping/list?saleNum=${sale.saleNum}">${sale.productname}</a></h3>
                            <div class="d-flex">
                                <div class="pricing">
                                    <p class="price"><span>&#8361;${sale.price }</span></p>
                                </div>
                            </div>
                            <div class="bottom-area d-flex px-2">
                                <div class="m-auto d-flex">
                                    <a href="${pageContext.request.contextPath}/shopping/addcart?&price=${sale.price}&productName=${sale.productname}&thumbnail=${sale.thumbnail}" class="buy-now d-flex justify-content-center align-items-center mx-1">
                                        <span><i class="ion-ios-cart"></i></span>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/shopping/regist_jjim?saleNum=${sale.saleNum}" class="heart d-flex justify-content-center align-items-center ">
                                        <span><i id=jjim class="ion-ios-heart"></i></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="row mt-5">
                <div class="col text-center">
                    <div class="block-27">
                        <ul>
                        	<c:if test="${page.startPage >= page.bottomLine}">
                            <li><a href="${pageContext.request.contextPath }/shop?pageNum=${page.startPage - page.bottomLine}">&lt;</a></li>
                            </c:if>
                            <c:forEach var="i" begin="${page.startPage}"  end="${page.endPage}">
							  <li class=${i==pageNum?'active':''}> <a href="${pageContext.request.contextPath }/shop?pageNum=${i}&category=${catenum}">${i}</a></li>
							</c:forEach>
                            <c:if test="${page.endPage < page.pageCount}">
                            <li><a href="${pageContext.request.contextPath }/shop?pageNum=${page.startPage + page.bottomLine}">&gt;</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
<script>
$('#jjim').click(function(){
	if(${memNum == null}){
		alert("로그인 해주세요")
	}
	if(${memNum != null}){
		alert("찜목록에 등록 되었습니다.");	
	}
	
})
</script>
</html>
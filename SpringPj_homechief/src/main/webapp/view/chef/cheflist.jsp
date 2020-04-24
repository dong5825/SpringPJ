<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>
.unreply{
    padding: 5px 10px;
    background: #e6e6e6;
    color: #000000;
    text-transform: uppercase;
    font-size: 11px;
    letter-spacing: .1em;
    font-weight: 400;
    border-radius: 4px;
}
.unreply:hover{
	color:white;
	background-color: red;
}
</style>

<body>


	<div class="hero-wrap hero-bread sub_headbg"
		style="background-image: url('<%=request.getContextPath()%>/images/bg_4.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="<%=request.getContextPath()%>/main">Home</a></span> <span
							class="mr-2"><a href="<%=request.getContextPath()%>/chef">HOMECHEF
								<spring:message code="nav.chef" />
						</a></span>
					</p>
					<h1 class="mb-0 bread">
						HOMECHEF
						<spring:message code="nav.chef" />
					</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-degree-bg">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 ftco-animate">
				<div class="sidebar-box">
					<form action="${pageContext.request.contextPath}/chef" method="post" class="search-form">
						<div class="form-group">
							<span class="icon ion-ios-search"></span> <input type="text"
								id="keyword" name="keyword" class="form-control"
								placeholder="쉐프 닉네임을 입력해 주세요.">
						</div>
					</form>
				</div>

				<c:if test="${keyword!=null}">
					<div style="margin-bottom: 20px">					
					<b style="color: black">'${keyword}'</b> 쉐프가 검색되었습니다.
					</div>
					<ul class="comment-list">
						<c:forEach var="memSearch" items="${memSearch}">							
							<li class="comment">
								<div class="list_ranking">
									<p>${memSearch.rank}</p>
								</div>

								<a href="<%=request.getContextPath()%>/member/mypage?memNum=${memSearch.memNum}">	
								<div class="vcard bio">															
									<img src="<%=request.getContextPath()%>/uploadFile/${memSearch.profile}">								
								</div>
								</a>
								<div class="comment-body">
									<h3>${memSearch.name}</h3>									

									<div class="meta">
										<div>
											<a href="" title="조회수"><span class="icon-eye"></span> ${memSearch.readcnt}</a>
										</div>
										<div>
											<a href="" title="팔로워수"><span class="icon-person"></span> ${memSearch.followcnt}</a>
										</div>
										<div>
											<a href="" title="레시피수"><span class="icon-chat"></span> ${memSearch.rcpcnt}</a>
										</div>
										<div>
											<a href="" title="좋아요수"><span class="icon-heartbeat"></span> ${memSearch.likecnt}</a>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:if>

				<div class="pt-5 mt-5">
					<h4 class="mb-5">인기 쉐프 순위(Top3)</h4>
					<ul class="comment-list">
						<c:forEach var="memList" items="${memList}">
							<li class="comment">
								<div class="list_ranking">
									<p>${memList.rank}</p>
								</div>
								
								<a href="<%=request.getContextPath()%>/member/mypage?memNum=${memList.memNum}">
								<div class="vcard bio">																
									<img src="<%=request.getContextPath()%>/uploadFile/${memList.profile}">																	
								</div>
								</a>
								
								<div class="comment-body">
									<h3>${memList.name}</h3>									

									<div class="meta">
										<div>
											<a href="" title="조회수"><span class="icon-eye"></span> ${memList.readcnt}</a>
										</div>
										<div>
											<a href="" title="팔로워수"><span class="icon-person"></span> ${memList.followcnt}</a>
										</div>
										<div>
											<a href="" title="레시피수"><span class="icon-chat"></span> ${memList.rcpcnt}</a>
										</div>
										<div>
											<a href="" title="좋아요수"><span class="icon-heartbeat"></span> ${memList.likecnt}</a>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<!-- END comment-list -->
				</div>
			</div>
			<!-- .col-md-8 -->
			<div class="col-lg-4 sidebar ftco-animate">

				<div class="sidebar-box ftco-animate">
					<h3 class="heading">이벤트</h3>
					<div class="event_list">
						<img src="<%=request.getContextPath()%>/images/event01.jpg">
						<img src="<%=request.getContextPath()%>/images/event02.jpg">
						<img src="<%=request.getContextPath()%>/images/event03.jpg">
						<img src="<%=request.getContextPath()%>/images/event04.jpg">
						<img src="<%=request.getContextPath()%>/images/event05.jpg">
						<img src="<%=request.getContextPath()%>/images/event06.jpg">
					</div>
				</div>




			</div>


		</div>

	</div>
	</div>
	</section>
	<!-- .section -->
</body>
</html>

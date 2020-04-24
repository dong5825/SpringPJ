<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>


	<div class="hero-wrap hero-bread sub_headbg"
		style="background-image: url('images/bg_4.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="<%=request.getContextPath()%>/main">Home</a></span> <span
							class="mr-2"><a href="<%=request.getContextPath()%>/chef">HOMECHEF <spring:message
									code="nav.chef" /></a></span>
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
					<form action="${pageContext.request.contextPath}/chef/cheflist" method="post" class="search-form">
						<div class="form-group">
							<span class="icon ion-ios-search"></span> <input type="text" id="keyword" name="keyword" 
								class="form-control" placeholder="쉐프 닉네임을 입력해 주세요.">
						</div>
					</form>
				</div>
				<h4 class="mb-2">주간 인기 쉐프</h4>
			${keyword}	
				<c:if test="${keyword!=null}">
		<b style="color: black">'${keyword}'</b> 검색결과  <b>${memAllList}</b>개의 쉐프가 검색되었습니다.
		</c:if>

				<div class="about-author d-flex p-4 bg-light">
					<div class="bio align-self-md-center mr-4">
						<img src="images/person_1.jpg" alt="Image placeholder"
							class="img-fluid mb-4">
					</div>
					<div class="desc align-self-md-center">
						<h3>Lance Smith</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Ducimus itaque, autem necessitatibus voluptate quod mollitia
							delectus aut, sunt placeat nam vero culpa sapiente consectetur
							similique, inventore eos fugit cupiditate numquam!</p>
					</div>
				</div>


				<div class="pt-5 mt-5">
					<h4 class="mb-5">인기 쉐프 순위</h4>
					<ul class="comment-list">
					<c:forEach var="memAllList" items="${memAllList}">
						<li class="comment">
							<div class="list_ranking">
								<p>1</p>
							</div>
							
							<div class="vcard bio">
<img src="<%=request.getContextPath()%>/uploadFile/${memAllList.profile}">
							</div>
							<div class="comment-body">
								<h3>${memAllList.name}</h3>
								<span> <a href="#" class="reply">팔로우하기</a>
								</span>

								<div class="meta">
									<div>
										<a href="#"><span class="icon-eye"></span> 52,454</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> 2,123</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
									<div>
										<a href="#"><span class="icon-heartbeat"></span> 19</a>
									</div>
								</div>
							</div>
						</li>

						<li class="comment">
							<div class="list_ranking">
								<p>2</p>
							</div>
							<div class="vcard bio">

								<img src="images/person_1.jpg" alt="Image placeholder">
							</div>
							<div class="comment-body">
								<h3>John Doe</h3>
								<span> <a href="#" class="reply">팔로우하기</a>
								</span>

								<div class="meta">
									<div>
										<a href="#"><span class="icon-eye"></span> 52,454</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> 2,123</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
									<div>
										<a href="#"><span class="icon-heartbeat"></span> 19</a>
									</div>
								</div>
							</div>
						</li>

					<li class="comment">
							<div class="list_ranking">
								<p>3</p>
							</div>
							<div class="vcard bio">

								<img src="images/person_1.jpg" alt="Image placeholder">
							</div>
							<div class="comment-body">
								<h3>John Doe</h3>
								<span> <a href="#" class="reply">팔로우하기</a>
								</span>

								<div class="meta">
									<div>
										<a href="#"><span class="icon-eye"></span> 52,454</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> 2,123</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
									<div>
										<a href="#"><span class="icon-heartbeat"></span> 19</a>
									</div>
								</div>
							</div>
						</li>
						<li class="comment">
							<div class="list_ranking">
								<p>4</p>
							</div>
							<div class="vcard bio">

								<img src="images/person_1.jpg" alt="Image placeholder">
							</div>
							<div class="comment-body">
								<h3>John Doe</h3>
								<span> <a href="#" class="reply">팔로우하기</a>
								</span>

								<div class="meta">
									<div>
										<a href="#"><span class="icon-eye"></span> 52,454</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> 2,123</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
									<div>
										<a href="#"><span class="icon-heartbeat"></span> 19</a>
									</div>
								</div>
							</div>
						</li>
						<li class="comment">
							<div class="list_ranking">
								<p>5</p>
							</div>
							<div class="vcard bio">

								<img src="images/person_1.jpg" alt="Image placeholder">
							</div>
							<div class="comment-body">
								<h3>John Doe</h3>
								<span> <a href="#" class="reply">팔로우하기</a>
								</span>

								<div class="meta">
									<div>
										<a href="#"><span class="icon-eye"></span> 52,454</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> 2,123</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
									<div>
										<a href="#"><span class="icon-heartbeat"></span> 19</a>
									</div>
								</div>
							</div>
						</li>
						<li class="comment">
							<div class="list_ranking">
								<p>6</p>
							</div>
							<div class="vcard bio">

								<img src="images/person_1.jpg" alt="Image placeholder">
							</div>
							<div class="comment-body">
								<h3>John Doe</h3>
								<span> <a href="#" class="reply">팔로우하기</a>
								</span>

								<div class="meta">
									<div>
										<a href="#"><span class="icon-eye"></span> 52,454</a>
									</div>
									<div>
										<a href="#"><span class="icon-person"></span> 2,123</a>
									</div>
									<div>
										<a href="#"><span class="icon-chat"></span> 19</a>
									</div>
									<div>
										<a href="#"><span class="icon-heartbeat"></span> 19</a>
									</div>
								</div>
							</div>
						</li>
							</c:forEach>
					</ul>
					<!-- END comment-list -->


				</div>
				
				 <div class="row mt-5">
                <div class="col text-center">
                    <div class="block-27">
                        <ul>
                            <li><a href="#">&lt;</a></li>
                            <li class="active"><span>1</span></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&gt;</a></li>
                        </ul>
                    </div>
                </div>
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

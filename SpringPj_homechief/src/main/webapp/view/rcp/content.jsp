<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>
<style>
display: inline-block;
 color: #6d6e71;
    font-size: 13px;
    font-family: Microsoft YaHei, "NS";
    margin-top: 5px;
    line-height: 1.5;
}

.box_write {
    background-color: #f7f7f7;
    width: 660px;
    height: 95px;
    box-sizing: border-box;
    padding: 13px 18px;
    border: 1px solid #e6e6e6;
}
.sec_comment .box_write textarea {
    width: 480px;
    height: 71px;
    box-sizing: border-box;
    border: 1px solid #e6e6e6;
    resize: none;
    float: left;
    color: #c7c7c7;
    font-size: 16px;
    font-family: Microsoft YaHei,'NSL';
    text-align: center;
    padding-top: 20px;
    color: #313131;
    overflow: auto;
}
.sec_comment .box_write button {
    display: block;
    width: 123px;
    height: 71px;
    background-color: #ff6d00;
    border: none;
    color: #fff;
    font-size: 17px;
    font-family: Microsoft YaHei,'NSL';
    float: right;
}
ol, ul {
    list-style: none;
    padding: 0px;
}
.lst_comment>li {
    position: relative;
    width: 620px;
    border-bottom: 1px solid #e6e6e6;
    padding: 20px 0 20px 84px;
    clear: left;
    min-height: 64px;
}
.sec_comment .lst_comment li img {
    position: absolute;
    top: 20px;
    left: 0;
    width: 64px;
    height: 64px;
    border-radius: 50%;
    overflow: hidden;
}
.sec_comment .lst_comment li strong {
    color: #839705;
    font-family: Microsoft YaHei,'NSL';
    font-size: 15px;
    overflow: hidden;
    margin-right: 13px;
    clear: left;
}
.sec_comment .lst_comment li time {
    color: #c1c1c1;
    font-size: 13px;
    font-family: Microsoft YaHei,'NSL';
}
.sec_comment .lst_comment li p {
    color: #6d6e71;
    font-size: 13px;
    font-family: Microsoft YaHei, "NS";
    margin-top: 5px;
    line-height: 1.5;
}
.lst_step {
    counter-reset: li;
    position: relative;
}
.lst_step li {
    width: 600px;
    margin: 50px auto 0;
    counter-increment: step;
    position: relative;
}
.lst_step img {
  	display: block;
    width: 600px;
    margin: 0 auto 13px;
}
.lst_step p {
    font-size: 16px;
    color: #6d6e71;
    font-family: Microsoft YaHei,'NS';
    line-height: 22px;
}
.nutrition {
    overflow: hidden;
    margin: 10px 0 15px 0;
}
.nutrition li{
	width: 110px;
	float: left;
	position: relative;
	font-size: 20px;
	text-align: center;
	margin: 0 0 16px 16px;
	line-height: 27px;
}
.box_tag {
    padding-right: 30px;
}
.box_tag a {
    padding: 6px 13px;
    border: 2px solid #ada9a9;
    border-radius: 5px;
    color: #3e3e3e;
    background: #fff;
    font-size: 14px;
    font-family: Microsoft YaHei,'NS';
    display: inline-block;
    margin-bottom: 5px;
}
</style>

<body>

<div class="container">
        <div class="row">
            <!-- Boxes de Acoes -->
            <div class="col-xs-12 col-sm-6 col-lg-8">
                <div class="box" style="width: 1000px">
                    <div class="icon">                        
                        <div class="info">

                            <!-- Modal -->
                            <div >
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="slider_recipe">
                                            <div class="modal-body">
                                                <div class="sec_detail">
                                                    <div id="carousel-thumb" class="carousel slide carousel-fade carousel-thumbnails" data-ride="carousel">
                                                        <div class="carousel-inner">
                                                            <div class="carousel-item active">
                                                                <img src="<%=request.getContextPath()%>/uploadRcpFile/${rcpContent.thumbnail}" class="d-block w-100" alt="...">
                                                            </div>
                                                            <c:forEach var="rcpContent2" items="${rcpContent2}">
                                                            <div class="carousel-item">
                                                                <img src="<%=request.getContextPath()%>/uploadRcpContentFile/${rcpContent2.fileName}" class="d-block w-100" alt="...">
                                                            </div>
                                                            </c:forEach>                                                        
                                                        </div>
                                                        <a class="carousel-control-prev" href="#carousel-thumb" role="button" data-slide="prev">
                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                            <span class="sr-only">Previous</span>
                                                        </a>
                                                        <a class="carousel-control-next" href="#carousel-thumb" role="button" data-slide="next">
                                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                            <span class="sr-only">Next</span>
                                                        </a>
                                                        <!--/.Controls-->
                                                        <ol class="carousel-indicators">
                                                            <li data-target="#carousel-thumb" data-slide-to="0" class="active"> <img class="d-block w-100" src="<%=request.getContextPath()%>/uploadRcpFile/${rcpContent.thumbnail}" class="img-fluid"></li>
                                                            <c:forEach var="rcpContent2" items="${rcpContent2}" varStatus="status">                                                         
                                                            <li data-target="#carousel-thumb" data-slide-to="${status.count}"><img class="d-block w-100" src="<%=request.getContextPath()%>/uploadRcpContentFile/${rcpContent2.fileName}" class="img-fluid"></li>
                                                            </c:forEach>                                                         
                                                        </ol>
                                                    </div>
                                                    <h2>영양정보<span>(1인분 기준)</span></h2>                                                    
                                                    	<div class="nutrition">
                                                    	<c:forEach var="nutrient" items="${nutrient}">
                                                    	<ul>
                                                    		<li>
                                                    			<span>칼로리</span><br>
                                                    			<span style="font-size: 30px; color: #839705;">
                                                    				${nutrient.energy} 
                                                    			</span style="color: #839705;"><br>kcal     	                                                			
                                                    		</li>
                                                    		<li>
                                                    			<span>탄수화물</span><br>
                                                    			<span style="font-size: 30px; color: #e36113;">
                                                    				${nutrient.carb}
                                                    			</span><br>
                                                    			<span style="color: #e36113;">g</span>
                                                    		</li>
                                                    		<li>
                                                    			<span>단백질</span><br>
                                                    			<span style="font-size: 30px; color: #2f97bd;">
                                                    				${nutrient.protein}
                                                    			</span><br>
                                                    			<span style="color: #2f97bd;">g</span>
                                                    		</li>
                                                    		<li>
                                                    			<span>지질</span><br>
                                                    			<span style="font-size: 30px; color: #c43f68;">
                                                    				${nutrient.fat}
                                                    			</span> <br>
                                                    			<span style="color: #c43f68;">g</span>
                                                    		</li>                                                    		
                                                    		<li>
                                                    			<span>당류</span><br>
                                                    			<span style="font-size: 30px; color: #aebf22;">
                                                    				${nutrient.sugar}
                                                    			</span> <br>
                                                    			<span style="color: #aebf22;">g</span>
                                                    		</li>
                                                    		<li>
                                                    			<span>칼슘</span><br>
                                                    			<span style="font-size: 30px; color: #af9128;">
                                                    				${nutrient.cal}
                                                    			</span> <br>
                                                    			<span style="color: #af9128;">mg</span>
                                                    		</li>
                                                    		<li>
                                                    			<span>나트륨</span><br>
                                                    			<span style="font-size: 30px; color: #37baa9;">
                                                    				${nutrient.na}
                                                    			</span><br>
                                                    			<span style="color: #37baa9;">mg</span>
                                                    		</li>
                                                    		<li>
                                                    			<span>콜레스테롤</span><br>
                                                    			<span style="font-size: 30px; color: #905bcb;">
                                                    				${nutrient.chole}
                                                    			</span> <br>
                                                    			<span style="color: #905bcb;">mg</span>
                                                    		</li>
                                                    	</ul>                                                                
                                                        </c:forEach>                                                    	
                                                    	</div>
                                                    	
                                                    <h2>태그 정보</h2>
                                                    <div class="box_tag">
                                                    	<c:forEach var="tags" items="${tags}" begin="1">
                                                    	<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=0&keyword=${tags}">${tags}</a>
                                                    	</c:forEach>
                                                    </div>
                                                    
                                                    <h2>레시피 정보</h2>
                                                    <ol class="lst_step">
                                                    	<c:forEach var="rcpContent2" items="${rcpContent2}" varStatus="status">
                                                    	<li>
                                                    		<div class="img_cover">
                                                    			<img src="<%=request.getContextPath()%>/uploadRcpContentFile/${rcpContent2.fileName}">
                                                    		</div>
                                                    		<p>${rcpContent2.content}</p>
                                                    	</li>
                                                    	</c:forEach>
                                                    </ol>
                                                    
                                                    <section class="sec_comment">
														<h2>한줄댓글</h2>
														<form class="box_write" action="<%=request.getContextPath()%>/rcp/insertComment" method="POST">
															<textarea placeholder="한 줄 댓글을 남겨주세요." name="comment"></textarea>
															<input type="hidden" name="rcpnum" value="${rcpContent.rcpnum}">
															<button type="submit">댓글남기기</button>
														</form>
														
														<ul class="lst_comment">
															<c:forEach var="commentList" items="${commentList}" varStatus="status">
															<li>
																<div class="img-cover">
																	<img src="<%=request.getContextPath()%>/uploadFile/${commentList.profile}">
																</div>
																<strong>${commentList.name}</strong>
																<time><fmt:formatDate value="${commentList.reg_date}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
																<p>${commentList.content}</p>
																
															
															<!-- 댓글삭제 -->
															<c:if test="${loginNum == commentList.memnum}">
															<form class="commentButton" action="<%=request.getContextPath()%>/rcp/deleteComment" method="POST">
																<input type="hidden" name="rcpnum" value="${rcpContent.rcpnum}">
																<input type="hidden" name="commentnum" value="${commentList.commentnum}">
																<button type="submit">삭제</button>
															</form>
															</c:if>
															</li>
															</c:forEach>
														</ul>
													</section>
                                                </div>
                                                <section class="sec_info">
                                                    <div class="aside">
                                                        <div class="top">
                                                            <div class="user">
                                                                <div class="img-cover">
                                                                    <a href="<%=request.getContextPath()%>/member/mypage?memNum=${rcpContent.memnum}">
                                                                        <img class="img_user" src="<%=request.getContextPath()%>/uploadFile/${rcpContent.profile}">
                                                                    </a>
                                                                </div>
                                                                <strong class="best"><a href="<%=request.getContextPath()%>/member/mypage?memNum=${rcpContent.memnum}">${rcpContent.name}</a></strong>
                                                            </div>

                                                            <h1>
                                                                <strong>${rcpContent.title}</strong>
                                                                ${rcpContent.subtitle}
                                                            </h1>
                                                            <dl class="info_basic">
                                                                <dt class="time">조리시간</dt>
                                                                <dd>${rcpContent.cookingtime}분</dd>
                                                                <dt class="scrap">스크랩</dt>
                                                                <dd id="scrap-cnt">${scrapCount}</dd>
                                                                <dt class="scrap">조회수</dt>
                                                                <dd id="read-cnt">${rcpContent.readcount}</dd>                                                             
                                                            </dl>                                                       

                                                            <!-- [D] 버튼영역 추가 150314 -->
                                                            <div class="btn_area">
                                                            <c:if test="${loginNum!=rcpContent.memnum}">
                                                            	<c:if test="${checkScrap==0}">
                                                            	<form action="<%=request.getContextPath()%>/member/scrap" method="post">                                                                    
                                                                    <input type="hidden" name="scrapnum" value="${rcpContent.rcpnum}">
                                                                    <button type="submit" class="btn_scrap"><i class="far fa-bookmark"></i> &nbsp;스크랩</button>
                                                                </form>
                                                            	</c:if>
                                                            	<c:if test="${checkScrap==1}">
                                                            	<form action="<%=request.getContextPath()%>/member/delScrap" method="post">                                                                    
                                                                    <input type="hidden" name="scrapnum" value="${rcpContent.rcpnum}">
                                                                    <button type="submit" class="btn_scrap"><i class="fas fa-bookmark"></i> &nbsp;스크랩 취소</button>
                                                                </form>
                                                            	</c:if>
                                                            	<!-- 좋아요 버튼 영역 추가 -->
														<c:if test="${checkLike == 0}">
														<div class="btn_area">
															<form action="<%=request.getContextPath()%>/rcp/addLike"
																method="POST">
																<input type="hidden" name="rcpnum"
																	value="${rcpContent.rcpnum}"><span
																	style="font-size: 30px; color: red;">
																	<button type="submit" class="btn_like">
																		<i class="far fa-heart"></i> &nbsp;좋아요</button>
																</span>
															</form>
														</div>
														</c:if>
														<c:if test="${checkLike == 1}">
														<div class="btn_area">
															<form action="<%=request.getContextPath()%>/rcp/cancelLike"
																method="POST">
																<input type="hidden" name="rcpnum"
																	value="${rcpContent.rcpnum}"><span
																	style="font-size: 30px;">
																	<button type="submit" class="btn_like">
																		<i class="fas fa-heart"></i> &nbsp;좋아요 취소</button>
																</span>
															</form>
														</div>
														</c:if>
                                                            	
                                                            	
                                                            	
                                                            </c:if>                                                             
                                                            </div>
                                                            <!-- //버튼영역 추가 -->
                                                        </div>                                                      

                                                        <div class="btm" style="position: relative; top: 0px; left: 0px; margin-left: 0px;">
                                                            <h2>재료리스트</h2>
                                                            <div class="dropdown">
                                                                1인 기준
                                                            </div>

                                                            <ul class="lst_ingrd">
                                                            	<c:forEach var="rcpContent3" items="${rcpContent3}">
                                                            	<li>
                                                            		<span>${rcpContent3.ingredient}</span>
                                                            		<em>${rcpContent3.quantity.split("/")[0]}(${rcpContent3.quantity.split("/")[1]}g)</em>
                                                            	</li>
                                                            	</c:forEach>                                                               
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </section>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default pull-left" onclick="history.go(-1);">Close</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <!-- Modal -->
                        </div>
                    </div>
                </div>
                <div class="space"></div>
            </div>
        </div>
        <!-- /Boxes de Acoes -->
    </div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>

<title>Insert title here</title>
</head>

<style>
.user_information {
    background: #f5f5f5;
    width: 100%;
    margin-top: 43px;
    position: relative;
}
.user_information .inner {
    min-height: 167px;
    box-sizing: border-box;
    padding: 50px 0 50px 150px;
}
.inner {
    position: relative;
    margin: 0px 200px;
}
.user_information img {
    display: block;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    position: absolute;
    top: 30px;
    left: 30px;
}
.user_information>.inner>strong {
    display: inline-block;
    font-size: 22px;
    color: #3b3b3b;
    font-family: Microsoft YaHei,'NST';
}
.user_information .follow {
    display: inline-block;
    color: #979797;
    font-size: 16px;
    font-family: Microsoft YaHei,'NSL';
    white-space: nowrap;
    word-break: keep-all;
}
.user_information .dsc {
    width: 500px;
    font-size: 13px;
    color: #676767;
    margin: 7px 0 0 2px;
}
.user_information .btn_area {
    position: absolute;
    right: 0;
    bottom: 20px;
}
.data-tab {
    width: 100%;
    height: 60px;
    border-top: 1px solid #e8e9e9;
    border-bottom: 1px solid #e8e9e9;
    margin-bottom: 55px;
}
ol, ul {
    list-style: none;
}
.tab-list { 
	padding-inline-start: 0px;
	overflow: hidden;
	margin-block-end: 0px;
	margin-bottom: -1px;
}
.tab-list li {
	float: left; 
	width: 33%; 
	text-align: center; 
	margin-right: -1px;
}
.tab-list li a {
	text-decoration: none; 
	display: block; 
	padding: 10px 0px; 
	font-size: 15px; 
	color: #666; 
	font-weight: 700;
}
.tab-list li.active a {
	color: #3b3b3b; 
	border-bottom: 3px solid #ff6d00;
}
.lst_recipe {
    width: 1500px;
    position: relative;
    left: -16px;
    overflow: hidden;
    margin-bottom: 56px;
}
.lst_recipe>li {
    width: 244px;
    height: 390px;
    margin: 0 0 16px 16px;
    position: relative;
    border: 1px solid #e1e1e1;
    box-sizing: border-box;
    float: left;
    background-color: #fff;
    margin: 0 0 16px 16px;
}
.lst_recipe li .call_recipe {
    display: block;
    margin: 4px;
    position: relative;
}
.lst_recipe li .call_recipe img {
    width: 234px;
    height: 234px;
    display: block;
}
.lst_recipe li .author {
   	text-align: center;
    width: 0;
    z-index: 5;
    display: block;
    margin-top: -40px;
    margin-left: 90px;
    position: relative;
}
.lst_recipe li .author img {
    width: 61px;
    height: 61px;
    border-radius: 50%;
    overflow: hidden;
    display: block;
    margin: 10px 0 -10px;
    max-width: initial;
}
.lst_recipe li p {
    text-align: center;
    font-size: 15px;
    font-family: Microsoft YaHei,'NSB';
    line-height: 19px;
    letter-spacing: -0.025em;
    padding: 2px 20px 0;
}
.lst_recipe li p strong {
    display: block;
    overflow: hidden;
    margin-top: 5px;
    word-break: keep-all;
    white-space: nowrap;
    text-overflow: ellipsis;
}
li.btn_add a {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    display: block;
    background: #e36113 url(/assets/_img/mypage/add_my_recipe-81ca769….png) center 118px no-repeat;
    color: #ffaa77;
    font-size: 24px;
    text-align: center;
    padding-top: 110px;
    text-decoration: none;
}
.no-content {
    font-size: 15px;
    padding-top: 170px;
    text-align: center
}
a{
	text-decoration: none;
}
.lst_follow {
    width: 968px;
    margin-bottom: 50px;
}
.lst_follow li {
    position: relative;
    height: 142px;
    box-sizing: border-box;
    border-bottom: 1px solid #e1e1e1;
    padding: 20px 0 20px 120px;
}
.lst_follow .user_follow {
    overflow: hidden;
    display: inline-block;
}
.lst_follow .user_follow img {
    position: absolute;
    top: 20px;
    left: 0;
    width: 100px;
    height: 100px;
    border-radius: 50%;
}
.lst_follow .user_follow>strong {
    display: inline-block;
    font-size: 20px;
    color: #3b3b3b;
    font-family: Microsoft YaHei,'NST';
    z-index: 1;
}
.lst_follow .user_follow .follow {
    display: inline-block;
    color: #979797;
    font-size: 16px;
    font-family: Microsoft YaHei,'NSL';
    margin-left: 10px;
}
.lst_follow .user_follow .follow em {
    color: #e36113;
    font-style: normal;
}
.lst_follow .user_follow .count {
    font-size: 16px;
    color: #666666;
    margin-top: 5px;
}
.lst_follow .user_follow .update {
    position: absolute;
    bottom: 20px;
    font-size: 14px;
    color: #839705;
}
.lst_follow .thmb_follow {
    position: absolute;
    top: 20px;
    right: 0;
}
.lst_follow .thmb_follow img {
    width: 100px;
    height: 100px;
    float: left;
    margin-left: 10px;
}
.reply{
    padding: 5px 10px;
    background: #e6e6e6;
    color: #000000;
    text-transform: uppercase;
    font-size: 11px;
    letter-spacing: .1em;
    font-weight: 400;
    border-radius: 4px;
}
.reply:hover{
	color:white;
	background-color: #82ae46;
}
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
.lst_recipe .option {
    width: 263px;
    position: absolute;
    bottom: 0;
    height: 27px;
    border-top: 1px solid #e1e1e1;
    text-align: center;
}
.lst_recipe .option>div {
	border: none;
    width: 130px;
    height: 100%;
    float: left;
    border-left: 1px solid #ddd;
}
</style>

<body>

<div id="content">
	<div class="user_information">
		<div class="inner">
			<img src="<%=request.getContextPath()%>/uploadFile/${member.profile}">
			<strong>${member.name}</strong>
			<span>팔로워 ${followerCount}명</span>
			<p class="dsc">
				<br><br>
				<strong>${member.selfIntroduction}</strong>
				<br>
			</p>
			<div class="btn_area">
				<c:if test="${loginNum==member.memNum}">
				<button onclick="javascript:window:location='<%=request.getContextPath()%>/shopping/orderinfo'">
				주문정보
				</button>
				<button onclick="javascript:window:location='<%=request.getContextPath()%>/shopping/jjimlist'">
				찜목록
				</button>
				<button onclick="javascript:window:location='<%=request.getContextPath()%>/member/modifyForm?memNum=${member.memNum}'">
				프로필 수정
				</button>
				</c:if>
				<c:if test="${loginNum!=member.memNum}">
					<c:if test="${checkFollow==0}">
					<a href="<%=request.getContextPath()%>/member/follow?memNum=${member.memNum}" class="reply">팔로우</a>
					</c:if>
				</c:if>
				<c:if test="${loginNum!=member.memNum}">
					<c:if test="${checkFollow==1}">					
					<a href="<%=request.getContextPath()%>/member/unFollow?memNum=${member.memNum}" class="unreply">언팔로우</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>
	
	<div class="data-tab">
		<div class="inner">
		<ul class = "tab-list">
			<li class = "active" onclick = "openTitle('myRecipe')"><a href = "#">마이레시피(${rcpCount})</a></li>
			<li onclick = "openTitle('scrap')"><a href = "#">스크랩(${scrapCount})</a></li>
			<li onclick = "openTitle('follow')"><a href = "#">팔로우(${followCount})</a></li>
		</ul>
		</div>
	</div>
	
	<div class="title" id = "myRecipe" style="margin: 0px 200px;">
		<ul class="lst_recipe">
			<c:if test="${loginNum==member.memNum}">
			<li class="btn_add">
				<a href="<%=request.getContextPath()%>/rcp/writeForm"><h1 style="margin: 0px;">+</h1><br>나의 레시피 추가하기</a>
			</li>
			</c:if>
			
			<c:if test="${rcpCount==0}">
			<li class="no-recipes">
				<div class="no-content">
				아직 등록하신 레시피가 없습니다.
				</div>
			</li>
			</c:if>
			
			<c:if test="${rcpCount!=0}">
			<c:forEach var="rcpList" items="${rcpList}">
			<li>
				<a href="<%=request.getContextPath()%>/rcp/content?rcpnum=${rcpList.rcpnum}" class="call_recipe">
					<img src="<%=request.getContextPath()%>/uploadRcpFile/${rcpList.thumbnail}">
				</a>
				<span class="author">
					<a href="<%=request.getContextPath()%>/member/mypage?memNum=${rcpList.memnum}">
						<img src="<%=request.getContextPath()%>/uploadFile/${rcpList.profile}">
					</a>
				</span>
				<p>
					<a href="<%=request.getContextPath()%>/rcp/content?rcpnum=${rcpList.rcpnum}" style="color:black">
						<br><strong>${rcpList.title}</strong><p>${rcpList.foodname}</p>
					</a>
				</p>
				
				<div class="option">
					<div class="time">
					<i class="far fa-clock"></i>&nbsp;&nbsp;${rcpList.cookingtime}분
					</div>
					<div class="like">
					<i class="fas fa-heart"></i>&nbsp;&nbsp;${rcpList.likecnt}명
				</div>
			</div>
			</li>
			</c:forEach>
			</c:if>		
		</ul>
	</div>
	
	<div class="title" id = "scrap" style = "display:none; margin: 0px 200px;">
		<c:if test="${scrapCount==0}">				
				<h1 style="text-align: center;color: #b7b7b7;font-size: 20px;padding-bottom: 100px">아직 스크랩하신 레시피가 없습니다.</h1>			
		</c:if>
		<ul class="lst_recipe">			
			<c:if test="${scrapCount!=0}">
			<c:forEach var="scarpList" items="${scarpList}">
			<li>
				<a href="<%=request.getContextPath()%>/rcp/content?rcpnum=${scarpList.rcpnum}" class="call_recipe">
					<img src="<%=request.getContextPath()%>/uploadRcpFile/${scarpList.thumbnail}">
				</a>
				<span class="author">
					<a href="<%=request.getContextPath()%>/member/mypage?memNum=${scarpList.memnum}">
						<img src="<%=request.getContextPath()%>/uploadFile/${scarpList.profile}">
					</a>
				</span>
				<p>
					<a href="<%=request.getContextPath()%>/rcp/content?rcpnum=${scarpList.rcpnum}" style="color:black">
						<br><strong>${scarpList.title}</strong><p>${scarpList.foodname}</p>
					</a>
				</p>
				
				<div class="option">
					<div class="time">
					<i class="far fa-clock"></i>&nbsp;&nbsp;${scarpList.cookingtime}분
					</div>
					<div class="like">
					<i class="fas fa-heart"></i>&nbsp;&nbsp;${scarpList.likecnt}명
				</div>
			</div>
			</li>
			</c:forEach>
			</c:if>		
		</ul>		
	</div>
	
	<div class="title" id = "follow" style = "display:none; margin: 0px 350px;">
		<c:if test="${followCount==0 }">
			<h1 style="text-align: center;color: #b7b7b7;font-size: 20px; padding-bottom: 100px">아직 팔로우 하신 유저가 없습니다.</h1>
		</c:if>
		
		<c:if test="${followCount != 0 }">
		<c:forEach var="followList" items="${followList}">
		<ul class="lst_follow">
			<li>
			<div class="user_follow">
				<a href="<%=request.getContextPath()%>/member/mypage?memNum=${followList.memNum}">
					<img src="<%=request.getContextPath()%>/uploadFile/${followList.profile}">
				</a>
				<strong>${followList.name}</strong>
				<div class="follow">
					<c:forEach var="followerCount2" items="${followerCount2}">
					<c:if test="${followList.memNum == followerCount2.followNum}">
					<em>${followerCount2.count}명</em>이 팔로잉
					</c:if>
					</c:forEach>
					<form>						
                        <!-- <button type="submit" class="btn_scrap">언팔로우</button> -->
					</form>
				</div>
				<c:forEach var="followRcpCount" items="${followRcpCount}">
				<c:if test="${followList.memNum == followRcpCount.memnum}">
				<p class="count">${followRcpCount.rcpcount}개 레시피</p>
				</c:if>
				</c:forEach>
				
				<c:set var="loop" value="false" />
				<c:forEach var="followRcp" items="${followRcp}">
					<c:if test="${not loop}">
					<c:if test="${followList.memNum == followRcp.memnum}">
						<p class="update">
						최근등록날짜 : <fmt:formatDate value="${followRcp.reg_date}" type="date" pattern = "yyyy-MM-dd HH:mm" />
						</p>
						<c:set var="loop" value="true" />
					</c:if>
					</c:if>
				</c:forEach>				 
			</div>
			<div class="thmb_follow">
				<c:set var="loop2" value="1" />
				<c:forEach var="followRcp" items="${followRcp}">
					<c:if test="${loop2<4}">
					<c:if test="${followList.memNum == followRcp.memnum}">
						<a class="call_recipe" href="<%=request.getContextPath()%>/rcp/content?rcpnum=${followRcp.rcpnum}">
						<img src="<%=request.getContextPath()%>/uploadRcpFile/${followRcp.thumbnail}">
						</a>
						<c:set var="loop2" value="${loop2+1}" />
					</c:if>
					</c:if>
				</c:forEach>
			</div>
			</li>
		</ul>
		</c:forEach>
		</c:if>
	</div>
</div>

<script>
var tabBtn = $(".data-tab > .inner > ul > li"); 

tabBtn.click(function(e) {
    e.preventDefault();
    var target = $(this); 
    var index = target.index(); 
    tabBtn.removeClass("active");   
    target.addClass("active");   
		    
}); 

function openTitle(titleName) {
	   var i;
	   var x = document.getElementsByClassName("title");
	   for (i = 0; i < x.length; i++) {
	      x[i].style.display = "none";  
	   }
	   document.getElementById(titleName).style.display = "block";
}

</script>

</body>
</html>
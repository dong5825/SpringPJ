<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>list</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">
</head>

<style>
.inner {
    position: relative;
    margin: 0px 200px;
}
.lst_recipe {
    width: 1125px;
    position: relative;
    left: -16px;
    overflow: hidden;
    margin-bottom: 56px;
}
.lst_recipe>li {
    width: 265px;
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
    width: 100%;
    height: 234px;
    display: block;
}
.lst_recipe li .author {
    text-align: center;
    width: 60px;
    z-index: 5;
    display: block;
    margin-top: -40px;
    margin-left: 100px;
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
.search_cate {
    background: #fff;
    padding: 16px 25px 17px;
    vertical-align: top;
    margin-top: 0;
    border-bottom: 1px solid #e6e7e8;
    border-right: none;
    border-left: none;
    border-top: none;
}
.search_cate {
    font-size: 15px;
    padding: 8px 0;
    line-height: 1;
    min-width: 1200px;
}
.search_cate .cate_list {
    font-size: 15px;
    padding: 8px 0;
    line-height: 1;
}
.search_cate span {
    background: url(//recipe1.ezmember.co.kr/img/cate_bg.gif) left top no-repeat;
    background-size: 61px;
    color: #74b243;
    display: inline-block;
    font-weight: bold;
    width: 62px;
    height: 28px;
    margin: 0 5px 0 0;
    text-align: center;
    padding-top: 6px;
    vertical-align: middle;
    font-size: 13px;
}
.cate_list a {
    padding: 3px 9px 4px;
    color: #666;
    vertical-align: middle;
    font-size: 15px;
    line-height: 1;
   	font-weight: bold;
}
.cate_list a:hover {
    color: #74b243;
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
.list_title {
    font-size: 16px;
    color: #333;
    padding: 5px 0 20px 8px;
}
.list_title b {
    color: #74b243;
    font-size: 26px;
}
.category_tag {
    margin-bottom: -10px;
    position: relative;
}
.category_tag .tag_tit {
    font-size: 20px;
    border-bottom: 1px solid #e6e7e8;
    padding: 30px 0 10px 8px;
    line-height: 1;
}
a {
    color: #333;
    text-decoration: none;
}
.category_tag .tag_cont {
    padding: 16px 4px 0;
    margin-bottom: 0;
}
.category_tag .tag_cont li {
    display: inline-block;
    margin: 0 2px 12px;
    padding: 2px 0;
}
.category_tag .tag_cont li a {
    padding: 4px 15px 6px;
    line-height: 1;
    color: #666;
    background: #eee;
    border-radius: 14px;
    font-size: 14px;
}
.sort{
	border: 1px solid #e0e0e0;
    padding-bottom: 1px;
    font-size: 15px;
    padding-left: 0;
    margin-top: 10px;
    list-style: none;
    float: right!important;
    position: relative;
    font-weight: bold;
}
.sort>li{
	float: left;
    margin-bottom: -1px;
    background: #fff;
    border-right: 1px solid #e0e0e0;
    color: #999;
    position: relative;
    display: block;
    font-size: 15px;
}
.sort>li>a{
	line-height: 1.42857143;
    border: 1px solid transparent;
    padding: 6px 22px;
    position: relative;
    display: block;
}
.sort>li.selected>a{
    background-color: #44b6b5;
    border-bottom-color: transparent;
    color: #fff;
}
.selected { background:red }
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

<c:if test='${keyword.equals("") }'>
   <script>
      alert("상품을 검색하세요");
      history.go(-1);
   </script>
</c:if>

<body>
<div class="container">
	<div class="search_cate">
		<c:if test="${cateNum==0}">
		<div class="cate_list">
			<span>상황별</span>
			<c:forEach var="division" items="${division}">
				<c:if test="${division.division_num>=101}">
				<c:if test="${division.division_num<=107}">
					<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${division.division_num}">${division.division_name}</a>
				</c:if>
				</c:if>
			</c:forEach>
		</div>
		<div class="cate_list">
			<span>나라별</span>
			<c:forEach var="division" items="${division}">
				<c:if test="${division.division_num>=108}">
				<c:if test="${division.division_num<=115}">
					<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${division.division_num}">${division.division_name}</a>
				</c:if>
				</c:if>
			</c:forEach>
		</div>
		<div class="cate_list">
			<span>재료별</span>
			<c:forEach var="division" items="${division}">
				<c:if test="${division.division_num>=116}">
				<c:if test="${division.division_num<=125}">
					<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${division.division_num}">${division.division_name}</a>
				</c:if>
				</c:if>
			</c:forEach>
		</div>
		<div class="cate_list">
			<span>조리법별</span>
			<c:forEach var="division" items="${division}">
				<c:if test="${division.division_num>=126}">
					<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${division.division_num}">${division.division_name}</a>
				</c:if>
			</c:forEach>
		</div>
		</c:if>
		
		<c:if test="${cateNum!=0}">
		<div class="category_tag">
			<div class="tag_tit">
				<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=0">전체</a>>
				<c:forEach var="division" items="${division}">
				<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${division.division_num}">${division.division_name}</a>
				</c:forEach>
				<c:forEach var="category" items="${category}">
				<c:if test="${cateNum==category.cateNum}">
				><a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${category.cateNum}">${category.cateName}</a>
				</c:if>
				</c:forEach>
			</div>
			<ul class="tag_cont">
				<c:forEach var="category" items="${category}">
				<li>
					<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${category.cateNum}">${category.cateName}</a>
				</li>
				</c:forEach>
			</ul>
		</div>
		</c:if>
	</div>
	
	
	<script>
		window.onload = function() {
			var atag = document.querySelectorAll(".sorting");
			var url = document.location.href.split("?")[location.href.split("?").length - 1].split("&");
			if (url[0] == "sorting=latest") {
				atag[0].className += " selected";
			} else if (url[0] == "sorting=readCount") {
				atag[1].className += " selected";
			}
		}		
	</script>
	<div class="list_title">
		<c:if test="${keyword==null}">
		총 <b>${rcpAllCount}</b>개의 레시피가 있습니다.	
		<ul class="sort">
			<li class="sorting">
				<a href="<%=request.getContextPath()%>/rcp/list?sorting=latest&cateNum=${cateNum}">최신순</a>
			</li>
			<li class="sorting">
				<a href="<%=request.getContextPath()%>/rcp/list?sorting=readCount&cateNum=${cateNum}">조회순</a>
			</li>
		</ul>
		</c:if>
		<c:if test="${keyword!=null}">
		<b style="color: black">'${keyword}'</b> 검색결과  <b>${rcpAllCount}</b>개의 레시피가 검색되었습니다.
		</c:if>
	</div>
	
	<ul class="lst_recipe">					
		<c:forEach var="rcpAllList" items="${rcpAllList}">
		<li>
			<a href="<%=request.getContextPath()%>/rcp/content?rcpnum=${rcpAllList.rcpnum}" data-toggle="modal" class="call_recipe">
				<img src="<%=request.getContextPath()%>/uploadRcpFile/${rcpAllList.thumbnail}">
			</a>
			<span class="author">
				<a href="<%=request.getContextPath()%>/member/mypage?memNum=${rcpAllList.memnum}">
					<img src="<%=request.getContextPath()%>/uploadFile/${rcpAllList.profile}">
				</a>
			</span>
			<p>
				<a href="<%=request.getContextPath()%>/rcp/content?rcpnum=${rcpAllList.rcpnum}" data-toggle="modal">
					<br><strong>${rcpAllList.title}</strong><p>${rcpAllList.foodname}</p>
				</a>
			</p>
			
			<div class="option">
				<div class="time">
				<i class="far fa-clock"></i>&nbsp;&nbsp;${rcpAllList.cookingtime}분
				</div>
				<div class="like">
				<i class="fas fa-heart"></i>&nbsp;&nbsp;${rcpAllList.likecnt}명
				</div>
			</div>
			<!-- 좋아요 버튼 -->
			<%-- <div class="btn_area">
				<span style="font-size:13px; color: red;">
					<i class="fas fa-heart"></i></span>
						<c:forEach var="likes" items="${likes.likecnt}"></c:forEach>
			</div> --%>
		</li>
		</c:forEach>
	</ul>	
</div>

</body>
</html>
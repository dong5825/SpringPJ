<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
<script>
$(document).ready(function(){
   
   $( ".bg-primary" ).css( "display","none" );
   $( "nav" ).css( "display","none" );
   $( "footer" ).css( "display","none" );
   
})
function open(menu) {
        var i;
        var x = document.getElementsByClassName("menu");
        for (i = 0; i < x.length; i++) {
          console.log(x[i]);
          x[i].style.display = "none";
        }
        alert(menu);
        document.getElementById(menu).style.display = "block";
      }
/* var divisionlist = new Array();
<c:forEach items="${division }" var="d">
divisionlist.push("${d.division_name}");
</c:forEach>
for(var i=0; i<divisionlist.length; i++){
   console.log(divisionlist[i]);
} */
</script>
<title>추천 메뉴</title>
</head>
<style>
.container{text-align: center;
    padding: 30px 15px;border: 7px solid #cddc39;
    padding-bottom: 17px;}

</style>
<body>
<div class="container">
   <h2>오늘 뭐 먹지?</h2>
   <div id="weather" class="menu">
      오늘의 <span id="city" style="font-size: 18px;font-weight: bold;">${city }</span> 날씨는<br>
      <div style="    display: table;   width: 100%;   margin-bottom: 28px;   padding-bottom: 30px;   border-bottom: 1px solid #ddd;">
      <c:if test="${hour<12}">
      <div style="width : 50%;text-align: center;float: left;">
      <span style="    margin-top: 20px;">${weather.amimg }</span><br>
      ${weather.amdes }<br>
      </div>
      <div style="width : 50%;text-align: center;float: left;">
      <span style="font-size: 34px;">${weather.amtemp }℃</span>
      <span style="font-size: 26px;">${weather.amrain }%</span>
      </div>
      </c:if>
      <c:if test="${hour>=12}">
      <div class="col-md-6" style="width : 50%;float: left;">
      ${weather.pmimg }<br>
      ${weather.pmdes }<br>
      </div>
      <div class="col-md-6" style="width : 50%;float: left;">
      <span style="font-size: 35px;">${weather.pmtemp }℃</span><br>
      <span style="font-size: 20px;">${weather.pmrain }%</span><br>
      </div>
      </c:if>
      </div>
      <div >
      <h3>날씨맞춤의 추천메뉴</h3>
      
      <a style="
    font-size: 22px;
    color: #ff1212;
    background: #fff;
    padding: 6px;
" href="${pageContext.request.contextPath }/rcp/list?sorting=readCount&cateNum=${category.division_num}">${category.division_name}</a>
      </div>        
   </div>
  
</div>



</body>
</html>
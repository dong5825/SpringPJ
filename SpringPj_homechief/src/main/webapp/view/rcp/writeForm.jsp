<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<title>Insert title here</title>
</head>

<style>
.recipe_regi {
	width: 1240px;
    max-width: none !important;
    margin-right: auto;
    margin-left: auto;
}
.inner{
	position: relative;
    margin: 0px 400px;
}
.regi_center {
    border: 1px solid #e6e7e8;
    background: #fff;
    margin: 0;
    padding: 0;
    min-width: 1200px; 
}
.regi_title {
    background: #f8f8f8;
    border-bottom: 1px solid #e6e7e8;
    padding: 14px 18px;
    font-size: 20px;
    font-weight: bold;
    position: relative;
}
.cont_box {
    padding-left: 60px !important;
    padding: 26px 30px;
    border-bottom: 10px solid #f1f1f2;
    margin: 0 -1px;
}
.mainPhoto {
    width: 250px;
    float: right;
    margin-right: 60px;
}
.cont_line {
    width: 800px;
    padding: 8px 0 0 0;
}
.cont_tit {
    width: 140px;
    display: inline-block;
    font-size: 20px;
    font-weight: normal;
    vertical-align: top;
    padding: 0 0 0 2px;
    margin: 0 0 22px 0;
    line-height: 50px;
}
.cont_line input {
    display: inline-block;
}
.cont_box input {
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    padding-left: 15px;
    height: 50px;
    vertical-align: middle;
    margin-top: 5px;
}
.btnAdd, .addStep, .delStep{
    border: none;
    background: none;
    margin: 10px 0 0 0;
    padding: 0;
    font-size: 16px;
    color: #444;
}
.btnAdd span {
    color: #74b243;
    font-size: 16px;
    margin-right: 4px;
}
.delStep span {
    color: #74b243;
    font-size: 16px;
    margin-right: 4px;
}
.addStep span {
    color: #74b243;
    font-size: 16px;
    margin-right: 4px;
}
.ingred_name {
    width: 550px;
}
.ingred_qnt {
    width: 200px;
}
#rcp, .stepFile {
	display: none;
}
#rcpImg {
	cursor:pointer;
	 width: 250px;
    height: 250px;
}
#stepImg {
	cursor:pointer;
	 width: 160px;
    height: 160px;
}
.step {
    display: inline-block;
    margin: 6px 0;
}
.cont_tit2 {
    width: 120px;
    display: inline-block;
    font-size: 30px;
    font-weight: normal;
    vertical-align: top;
    color: #74b243;
    margin: 0px;
}
.step_cont {
    display: inline-block;
    vertical-align: middle;
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    line-height: 25px;
    height: 160px;
    width: 430px;
    resize: none;
}
.step img {
    border: 3px solid #e1e1e1;
    display: inline-block;
    vertical-align: middle;
}
.cont_box select {
    background: #f5f5f5;
    border: 1px solid #e1e1e1;
    font-size: 16px;
    padding: 8px 2px;
    margin: 0 2px 0 0;
    border-radius: 4px;
    height: 50px;
}
.btn_area {
    position: relative;
    margin: 30px 0px 30px;
    text-align: center;    
}
.btn_area .btn_orange {
    background: #e36113;
    color: #fff;
    font-family: Microsoft YaHei,'NSL';
    display: inline-block;
    width: 167px;
    height: 52px;
    border-radius: 5px;
    border: 1px solid #e1e1e1;
    font-size: 16px;
}
.division{
	width: 100%;
    height: 40px;
    line-height: 40px;
    background-color: #ccc;
    color: black;
    border-radius: 5px;
}
.cateName{
	border: 1px solid #e1e1e1;
    border-radius: 5px;
    color: #3e3e3e;
    background: #fff;
    font-size: 14px;
    font-family: Microsoft YaHei,'NS';
    display: inline-block;
    box-sizing: border-box;
    margin: 0 0 5px 0;
    padding: 6px 13px;
}
.hashtag input {
    width: 800px;
    height: 45px;
    border: 1px solid #e1e1e1;
    background-color: #f5f5f5;
    text-indent: 20px;
    font-family: Microsoft YaHei,'NST';
    font-size: 16px;
    margin-bottom: 0;
}
.hashtag .tag_selected {
    border: 1px solid #e1e1e1;
    border-top: none;
    padding: 20px 22px 30px 22px;
}
.hashtag .tag_selected strong {
    display: block;
    color: #3b3b3b;
    font-size: 16px;
    font-weight: normal;
    padding-right: 620px;
    font-family: Microsoft YaHei,'NS';
    margin-bottom: 12px;
}
.hashtag .tag_selected span {
    border: 1px solid #839705;
    border-radius: 5px;
    color: #fff;
    background: #839705;
    font-size: 14px;
    font-family: Microsoft YaHei,'NSL';
    display: inline-block;
    margin: 0 5px 5px 0;
    padding: 5px 8px;
    cursor: pointer;
}
.hashtag .tag_selected span a {
   	color: white;
    margin: -2px 0 0 8px;
}
</style>

<script>
function check() {
	var chk = document.writeForm;
	
    if(chk.title.value == '') {
        alert("레시피 제목을 입력하세요");
        chk.title.focus();
        return false;
    }
    
    if(chk.subtitle.value == '') {
        alert("한줄소개를 입력하세요");
        chk.subtitle.focus();
        return false;
    }
    
    if(chk.foodname.value == '') {
        alert("음식명을 입력하세요");
        chk.foodname.focus();
        return false;
    }
    
    if(chk.cookingtime.value == '') {
        alert("조리시간을 입력하세요");
        chk.cookingtime.focus();
        return false;
    }
    
    if(chk.thumbNail.value == '') {
        alert("썸네일 사진을 등록하세요");
        chk.thumbNail.focus();
        return false;
    }
    
    if(!chk.hashtags) {
        alert("해시태그를 입력하시오");
        return false;
    }
    
	var checked_items = 0;
	for (i=0;i<chk.elements.length;i++){
		if ((chk.elements[i].name == "cateNum") && (chk.elements[i].checked)){
			checked_items++;
		}			
	}
	if (checked_items == 0)	{
		alert("적어도 하나의 카테고리 선택하셔야 합니다.")
		return false;
	}
	
	return true;
}
</script>

<body>
<div class="ricipe_regi">
<div class="inner">
<form method="post" enctype="multipart/form-data" name="writeForm" action="<%=request.getContextPath()%>/rcp/writePro" onSubmit="return check()">
<div class="regi_center">
	<input type="hidden" name="readcount" value="0">	
	<div class="regi_title">레시피 등록</div>
	<div class="cont_box">	
		<div class="mainPhoto">
			<img id="rcpImg" src="<%=request.getContextPath()%>/images/mainPhoto.gif" onclick="document.getElementById('rcp').click();">
			<input type='file' id="rcp" name="thumbNail" value="" onchange="readyImg(this)">
		</div>
		<div class="cont_line">
			<p class="cont_tit">레시피 제목</p>
			<input type="text" name="title" autocomplete="off" style="width:610px;">
		</div>
		<div class="cont_line">
			<p class="cont_tit">한줄소개</p>
			<input type="text" name="subtitle" autocomplete="off" style="width:610px;">
		</div>
		<div class="cont_line">
			<p class="cont_tit">음식명</p>
			<input type="text" name="foodname" autocomplete="off" style="width:610px;">
		</div>	
		<div class="cont_line">
			<p class="cont_tit">조리시간</p>
			<input type="number" name="cookingtime" autocomplete="off" style="width:80px;"> 분
		</div>	
	</div>
		
	<div class="cont_box">
		<p class="cont_tit" style="margin-bottom: 0px">재료정보</p><div style="color: red"> *자동완성을 통해 입력해주세요</div>
		<table id="ingred_table" class="table">		
		<tbody id="ingred_tbody">
			<tr>
				<td> <input type="text" name="ingredient1" class="ingred_name" placeholder="재료명">  </td>
				<td> <input type="text" name="quantity1" class="ingred_qnt" placeholder="수량" autocomplete="off" > </td>
				<td> ( <input type="number" name="gram1" autocomplete="off" value="0"> ) g</td>
			</tr>
		</tbody>
		</table>
		<div style="padding:0 0 20px 350px; width:800px;">
			<button type="button" class="btnAdd" style="cursor:pointer;">
				<span><b>+</b></span>추가
			</button>
		</div>		
	</div>
	
	<div class="cont_box">
		<p class="cont_tit">요리순서</p><br>
		<div class="sort_step">
		<div class="step">
			<p class="cont_tit2">Step1</p>
			<div style="display:inline-block">
				<textarea name="content1" class="step_cont"></textarea>
			</div>
			<div style="display:inline-block">				
				<img id="stepImg" src="<%=request.getContextPath()%>/images/rcpStep.gif" onclick="document.getElementsByClassName('stepFile')[0].click();">
				<input type='file' class="stepFile" name="rcpFile1" onchange="readyStepImg(this)">
				<input type="hidden" name="step1" value="1">				
			</div>			
		</div>		
		</div>
		<div style="padding:0 0 20px 350px; width:800px;">
			<button type="button" class="addStep" style="cursor:pointer;">
				<span><b>+</b></span>추가
			</button>
			<button type="button" class="delStep" style="cursor:pointer;">
				<span><b>-</b></span>삭제
			</button>
		</div>		
	</div>
	
	<div class="cont_box">
		<div class="cont_line">
			<p class="cont_tit" style="margin-bottom: 0px">해시태그</p>
			<div class="hashtag">
				<input type="text" id="hash-search" placeholder="해시태그를 입력해 주세요" autocomplete="off" style="padding-left: 0px">
				<div class="tag_selected">
					<strong>입력된 해시 태그</strong>
					<div id="hash-index">
						
					</div>
				</div>
			</div>
		</div>
		<div class="cont_line">
			<p class="cont_tit" style="margin-bottom: 0px">카테고리</p>
			<div class="category">
				<div>
				<p class="division">상황별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=1}">
				<c:if test="${category.cateNum<=7}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:if>
				</c:forEach>
				</div>
								
				<div>
				<p class="division">나라별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=8}">
				<c:if test="${category.cateNum<=15}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:if>
				</c:forEach>
				</div>
				
				<div>
				<p class="division">재료별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=16}">
				<c:if test="${category.cateNum<=37}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:if>
				</c:forEach>
				</div>
				
				<div>
				<p class="division">조리법별 요리</p>
				<c:forEach var="category" items="${category}">
				<c:if test="${category.cateNum>=38}">
					<span class="cateName"><input type="checkbox" name="cateNum" value="${category.cateNum}">${category.cateName}</span>
				</c:if>
				</c:forEach>
				</div>
			
			</div>	
		</div>
		
	</div>	
	
	<div class="btn_area">
		<button type="submit" class="btn_orange">등록완료</button>
	</div>
	
</div>
</form>
</div>
</div>

</body>

<script>	
	auto(document).on("click",".ingred_name",function(){
		 var keywords = [
		    	<c:forEach var="nutrients" items="${nutrients}">
				'${nutrients}',
				</c:forEach>
		    ];
		    
		    auto(".ingred_name").autocomplete({
			      source: keywords,
			      max: 10,
			      focus: function(event, ui) {
			          return false;
			      }
			});
	});
	
	var j=1;
	$('.btnAdd').click(function() {
		j++;
		var rowItem = "<tr>"
			rowItem += "<td> <input type='text' class='ingred_name' name='ingredient"+j+"' placeholder='재료명' autocomplete='off'> </td>"
			rowItem += "<td> <input type='text' class='ingred_qnt' name='quantity"+j+"' placeholder='수량' autocomplete='off'> </td>"			
			rowItem += "<td> ( <input type='text' name='gram"+j+"' autocomplete='off' value='0'> ) g</td>"
			rowItem += "<td> <button type='button' class='btn btn-danger' style='cursor:pointer;'> <i class='fa fa-minus'></i> </button> </td>"
			rowItem += "</tr>"
		$('#ingred_table').append(rowItem)
	});	
	
	$('#ingred_table').on("click", "button", function() {
	    $(this).closest("tr").remove()
	});
	
	function readyImg(value){
    	if(value.files && value.files[0]){
    		var reader = new FileReader();
    		reader.onload = function (e){
    			$('#rcpImg').attr('src',e.target.result);
    		}
    		reader.readAsDataURL(value.files[0]);
    	}
	}
	
	var i=1;
	$('.addStep').click(function() {		
		var step="<div class='step'>"
		step+="<p class='cont_tit2'>Step"+(++i)
		step+="</p> <div style='display:inline-block'><textarea name='content"+i+"' class='step_cont'></textarea></div>"
		step+=" <div style='display:inline-block'>"				
		step+=" <img id='stepImg' src='<%=request.getContextPath()%>/images/rcpStep.gif' onclick=\"document.getElementsByClassName('stepFile')["+(i-1)+"].click();\">"
		step+=" <input type='file' class='stepFile' name='rcpFile"+i+"' onchange='readyStepImg(this)'>"
		step+='<input type="hidden" name="step'+i+'" value="'+i+'">'
		step+="</div>"		
				
		$('.sort_step').append(step)		
	});	
	
	$('.delStep').click(function() {
	    $('.step:last').remove()
	    i--;
	});
	
	function readyStepImg(value){
    	if(value.files && value.files[0]){
    		var reader = new FileReader();
    		reader.onload = function (e){
    			$(value).prev('#stepImg').attr('src',e.target.result);
    		}
    		reader.readAsDataURL(value.files[0]);
    	}
	}
	
	
	$("#hash-search").keydown(function (key) {
		var inputVar=$("#hash-search").val()
		if(key.keyCode==13){
			$('#hash-index').append(
					'<span class="added-tag">'+inputVar+'<a href="javascript:">x</a>'+
					'<input type="hidden" name="hashtags" value="'+inputVar+'"></span>'
			);
			$('#hash-search').val('')
		}
		return key.keyCode != 13;
	});
	
	$('#hash-index').on("click", "span", function() {
		 $(this).remove()
	});
</script>

</html>
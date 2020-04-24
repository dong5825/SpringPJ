<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(document).ready(function(){
	 // 회원가입처리
    $("form").submit(function(){
    	 if ($('#brand').val() == '') {
 	        alert('업체명을 입력해주세요.')
 	        return false;
 	      }
    	 if ($('#name').val() == '') {
  	        alert('담당자를 입력해주세요.')
  	        return false;
  	      }
    	 if ($('#tel').val() == '') {
  	        alert('담당자번호를 입력해주세요.')
  	        return false;
  	      }
    	 if ($('#email').val() == '') {
  	        alert('이메일을 입력해주세요.')
  	        return false;
  	      }
    	  if ($('.username_input').attr("check_result") == "fail"){
    		    alert("아이디 중복체크를 해주시기 바랍니다.");
    		    $('.username_input').focus();
    		    return false;
    		  }
    	 
    });
   
});
   

function chkID() {
	var id = document.getElementById("id").value;

$.ajax({
    type:"POST",
    url:"idCheck",
    data:{
           "id":$('#id').val()
    },
    success:function(data){	//data : checkSignup에서 넘겨준 결과값
           if($.trim(data)=="YES"){
        	 
              if($('#id').val()!=''){ 
              	//alert("사용가능한 아이디입니다.");
              	var exptext = /^[a-z0-9]{5,12}$/;
              if (exptext.test(id) == false) {
         			alert("희망 아이디는 5~12자의 영문 소문자, 숫자만 사용 가능합니다.");
        			document.getElementById('id').focus();
        			return false;
        		}else{
        		 	alert("사용가능한 아이디입니다.");
        		     $('.username_input').attr("check_result", "success");
        		}
              }
          	}else{
          		
        
             if($('#id').val()!=''){
                 alert("중복된 아이디입니다.");
                
         		 
                 $('#id').val('');
                 $('#id').focus();
              } 
           }
        }
   }) 
};


<%-- function chkID() {
		var id = document.getElementById("id").value;
		var query={"id":$("#id").val()}
		 $.ajax({
	            type:"POST",
	            url:"<%=request.getContextPath()%>/idCheck",
	            data:query,
	            success:function(data){
	            	if(data==1){
	            		alert("이미 사용중인 아이디입니다.");
	            	}
	            }
	            });
		 var exptext = /^[a-z0-9]{5,12}$/;
		if (exptext.test(id) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우		
			
			alert("희망 아이디는 5~12자의 영문 소문자, 숫자만 사용 가능합니다.");
			document.getElementById('id').focus();
			return false;
		}else{
			alert("사용할 수 있는 아이디입니다.");
		}
	}  --%>
</script>
<body>


	<div class="hero-wrap hero-bread sub_headbg"
		style="background-image: url('images/bg_4.jpg');">
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="<%=request.getContextPath()%>/main">Home</a></span> <span
							class="mr-2"><a href="<%=request.getContextPath()%>/brand">HOMECHEF <spring:message
									code="nav.brand" /></a></span>
					</p>
					<h1 class="mb-0 bread">
						HOMECHEF
						<spring:message code="nav.brand" />
					</h1>
				</div>
			</div>
		</div>
	</div>


	<section class="ftco-section contact-section bg-light">
	<div class="container">
		<div style="text-align: center;">
			<img src="<%=request.getContextPath()%>/images/chef_top2.jpg">
		</div>
		<form name="applyFrm" id="applyFrm" method="post"
			action="${pageContext.request.contextPath}/brand"
			class="bg-white p-5 contact-form">

			<div class="form-group">

				<input type="text" name="brand" id="brand" class="form-control"
					placeholder="<spring:message code="brand.name" />">
			</div>
			<div class="form-group">
				<input type="text" name="name" id="name" class="form-control "
					placeholder="<spring:message code="brand.manager" />">

			</div>
			<div class="form-group">
				<input type="text" name="tel" id="tel" class="form-control"
					placeholder="<spring:message code="brand.phone" />">

			</div>

			<div class="form-group">
				<input type="text" name="email" id="email" class="form-control"
					placeholder="<spring:message code="brand.email" />">

			</div>
			<div class="form-group">
				<textarea id="selfIntroduction" name="selfIntroduction" cols="30"
					rows="7" class="form-control"
					placeholder="<spring:message code="brand.introduce" />"></textarea>
			</div>
			<div class="cont_add">
				<div class="cont_add_tt">
					<b><spring:message code="brand.questions" /></b><span>(<spring:message code="brand.quecheck" />)</span>
				</div>
				<div class="cont_add_in">
					<label class="radio-inline"><input type="checkbox"
						name="inquiry" id="reason_join" value="브랜드관 입점신청"> <spring:message code="brand.quecheck1" /></label> <label class="radio-inline"><input type="checkbox"
						name="inquiry" id="reason_event" value="레시피 공모전문의"> <spring:message code="brand.quecheck2" /></label> <label class="radio-inline"><input type="checkbox"
						name="inquiry" id="reason_ppl" value="PPL영상 제작문의"> <spring:message code="brand.quecheck3" />
						제작문의</label> <label class="radio-inline"><input type="checkbox"
						name="inquiry" id="reason_shop" value="쇼핑몰 입점문의"><spring:message code="brand.quecheck4" /></label>
					<label class="radio-inline"><input type="checkbox"
						name="inquiry" id="reason_etc" value="기타 홍보 문의"><spring:message code="brand.quecheck5" /></label>
				</div>
			</div>
			<div class="cont_add">
				<div class="cont_add_tt">
					<span><spring:message code="brand.idtitle" /></span>
				</div>
<!-- 				<input type="text" name="id" id="id" onchange="cheID()" -->
				<input type="text" name="id" id="id" 
					class="form-control mag_b_10 has-feedback username_input"  check_result="fail" 
					placeholder="<spring:message code="brand.id" />"
					style="width:50%; display: inline-block;">
				<button type="button" onclick="chkID()" class="btn"><spring:message code="brand.idcheck" /></button>
			</div>
			<div class="form-group brand_btn">
				<input type="submit" value="<spring:message code="brand.btn" />"
					class="btn btn-primary py-3 px-5">
			</div>
		</form>


	</div>
	</section>

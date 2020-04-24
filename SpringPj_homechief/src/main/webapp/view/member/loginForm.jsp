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
var mssg = '${mssg}';
if(mssg !=''){
	
	alert(mssg);
}
	

function chkEmail() {
	var email = document.getElementById("email").value;

$.ajax({
    type:"POST",
    url:"emailCheck",
    data:{
           "email":$('#email').val()
    },
    success:function(data){	//data : checkSignup에서 넘겨준 결과값
           if($.trim(data)=="YES"){
        
              if($('#email').val()!=''){ 
              	alert("등록되지않은 이메일입니다.");
              	/* var exptext = /^[a-z0-9]{5,12}$/;
              if (exptext.test(email) == false) {
         			alert("희망 아이디는 5~12자의 영문 소문자, 숫자만 사용 가능합니다.");
        			document.getElementById('id').focus();
        			return false;
        		}else{
        		 	alert("메일");
        		     $('.username_input').attr("check_result", "success");
        		} */
              }
          	}else{
          		var mssg = '${mssg}';
          		alert(mssg);

          		/*  alert($.trim(data));
          		if($('#email').val()!=''){
          			alert("이메일 전송되었습니다.");
                    }
          		alert(mag);  */
          		
   		   //  $('.username_input').attr("check_result", "success");
        
            /*  if($('#email').val()!=''){
                 alert("중복된 아이디입니다.");
                
         		
                 $('#email').val('');
                 $('#email').focus();} */ 
           }
        }
   }) 
};


</script>
<body >

	<!--Intro Section-->
	<section class="view intro-2">
	<div class="mask">
		<div class="container">
			<div class="row">
				<div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-lg-5">
					<div class="limiter">
						<div class="container-login100">
							<div class="wrap-login100 p-t-50 p-b-90">
								<form action="${pageContext.request.contextPath}/member/login"
									method="post">

									<span class="login100-form-title "> <img
										src="<%=request.getContextPath()%>/images/logo.png">
									</span>


									<div class="wrap-input100 validate-input m-b-16"
										data-validate="Username is required">

										<input type="text" name="email" value="${param.email}"
											class="input100 " autocomplete="off"
											placeholder="<spring:message code="form.email" />">
										<c:if test="${errors.email }">ID를 입력하세요</c:if>

									</div>


									<div class="wrap-input100 validate-input m-b-16"
										data-validate="Password is required">
										<input type="password" name="passwd" class="input100"
											placeholder="<spring:message code="form.password" />">
										<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
									</div>

									<div class="flex-sb-m w-full p-t-3 p-b-24">
										<div class="contact100-form-checkbox">
											<c:if test="${errors.idOrPwNotMatch }">
아이디와 암호가 일치하지 않습니다.
</c:if>
											<!-- <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label> -->
										</div>

										<!-- <div>
							<a href="#" class="txt1">
								Forgot?
							</a>
						</div> -->
									</div>
									<div class="form-group">
										<!-- Button -->

										<div class="col-md-offset-10 col-md-9">
											<a href="#none" data-toggle="modal" data-target="#product_view">비밀번호를 잊어버리셨나요?</a>
										</div>
									</div>
									<div class="container-login100-form-btn m-t-17">
										<button class="login100-form-btn" type="submit" value="로그인">
											<spring:message code="login" />
										</button>
									</div>

								</form>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	</section>
 <div class="form-gap"></div>


<div class="modal fade product_view" id="product_view">
    <div class="modal-dialog st2">
        <div class="modal-content">
            <div class="modal-header">
                <a href="#" data-dismiss="modal" class="class pull-right"><span class="glyphicon glyphicon-remove"></span></a>
               	<span style="text-align: center;width: 100%;"> <img
										src="<%=request.getContextPath()%>/images/logo.png">
									</span>
            </div>
            <div class="modal-body">
	<div class="row">
		<div class="col-md-12 col-md-offset-12">  
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h4 class="text-center">비밀번호 찾기</h4>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
    
                    <form id="register-form" role="form" autocomplete="off" class="form"  action="findPwd" method="post">
    
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" name="email" placeholder="<spring:message code="form.email" />" class="form-control"  type="email" check_result="fail" >
                        </div>
                      </div>
                      <div class="form-group"style=" margin: 20px 0;">
<!--                         <input name="recover-submit" class="btn btn-lg btn-primary btn-block username_input" value="Reset Password" type="submit" onclick="chkEmail()"> -->
                       	<button type="button" class="btn btn-lg btn-primary btn-block username_input" onclick="chkEmail()">안내메일발송</button>
                      </div>
                          <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                                가입하신 이메일로 아이디와 비밀번호를 전송해드리겠습니다.
                                        </div>
                                    </div>
                                </div>  


                      <input type="hidden" class="hide" name="token" id="token" value=""> 
                    </form>
    
                </div>
              </div>
            </div>
          </div>
	</div>
</div>  
            </div>
        </div>
    </div>
</div>

	<%-- 
<form action="${pageContext.request.contextPath}/member/login" method="post">
<c:if test="${errors.idOrPwNotMatch }">
아이디와 암호가 일치하지 않습니다.
</c:if>
<p>
	아이디:<br/><input type="text" name="email" value="${param.email}" autocomplete="off">
	<c:if test="${errors.email }">ID를 입력하세요</c:if>
</p>
<p>
	암호:<br/><input type="password" name="passwd">
	<c:if test="${errors.passwd }">암호를 입력하세요</c:if>
</p>
<input type="submit" value="로그인">
<a href="${pageContext.request.contextPath}/member/join">[회원가입하기]</a>
<a href="${pageContext.request.contextPath}/member/main">[메인으로]</a>
</form> --%>
</body>
</html>
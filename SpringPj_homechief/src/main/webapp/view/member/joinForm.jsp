<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		var email = document.getElementById("email").value;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		if (exptext.test(email) == false) {
			//이메일 형식이 알파벳+숫자@알파벳+숫자.알파벳+숫자 형식이 아닐경우			
			alert("이메일형식이 올바르지 않습니다.");
			document.getElementById('email').focus();
			return false;
		}
	}
</script>

</head>
<body>
<section class="view intro-2">
        <div class="mask">
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12 mx-auto mt-lg-5">
  <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<form action="${pageContext.request.contextPath}/member/join" method="post" onSubmit="return check()">

					<span class="login100-form-title ">
						<img src="<%=request.getContextPath()%>/images/logo.png">
					</span>

					
					<div class="wrap-input100 validate-input m-b-16" >
					<input type="text" name="email" value="${param.email }" id="email"  autocomplete="off"class="input100 "  placeholder="<spring:message code="form.email" />">
			<c:if test="${errors.email }">이메일주소를 입력하세요</c:if>
			<c:if test="${errors.duplicateId }">이미 사용중인 아이디 입니다.</c:if>

						
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" >
					<input type="text" name="name" value="${param.name }" autocomplete="off"class="input100 "  placeholder="<spring:message code="form.name" />">
			<c:if test="${errors.name }">이름을 입력하세요</c:if>		
					</div>
					
					
					
					<div class="wrap-input100 validate-input m-b-16" >
					   <input type="password" name="passwd" class="input100" placeholder="<spring:message code="form.password" />">
						  <c:if test="${errors.passwd }">비밀번호를 입력하세요</c:if>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16" >
					   <input type="password" name="confirmpasswd" class="input100" placeholder="<spring:message code="form.passwordcheck" />">
						  <c:if test="${errors.passwd }">비밀번호를 입력하세요</c:if>
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

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="submit" value="가입">
						<spring:message code="join" />
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
  
	
</body>
</html>
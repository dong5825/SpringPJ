<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      	<div class="row d-flex mb-5 contact-info">
          <div class="w-100"></div>
          <div class="col-md-12 d-flex">
          	<div class="info bg-white p-4">
	            <p>${brand.name}님  ${brand.tel}로 빠른시일 내로 연락드리겠습니다.</p>
<p>관련정보는 ${brand.email}로 안내해 드립니다.</p>
	          </div>
          </div>
        
        </div>
        
      </div>
    </section>

	
</body>
</html>
<!-- <script>
var idFlag = 0;
function chkID(){
    if(idFlag!=1)
    {
        var s=$("#id_brand").val();
        
        if(!s)
        {
            viewMsg("id_brand","희망 아이디는 5~12자의 영문 소문자, 숫자만 사용 가능합니다.","error");
            $("#id_brand").focus();
            return;
        }
        
        var e=/^[a-z0-9]{5,12}$/;
        if(e.test(s))
        {
            $.ajax({
            type:"POST",
            url:"/brand/ajax.html",
            data:"q_mode=checkDuplicate&item=id&id="+btoa(unescape(encodeURIComponent(s))),
            success:function(s){
                switch(s){
                    case"NO_USE":
                        viewMsg("id_brand","사용할 수 있는 아이디입니다.","success");
                        idFlag=1;
                    break;
                    case"MYID":
                        viewMsg("id_brand","본인 아이디를 브랜드관 쉐프 아이디로 사용합니다.","success");
                        idFlag=1;
                    break;
                    case"DUPLICATE":
                        viewMsg("id_brand","이미 사용중인 아이디입니다.","error");
                        $("#id_brand").focus();
                    break;
                    case"ERROR":
                        viewMsg("id_brand","오류입니다. 다시 시도해 주세요.","error");
                        $("#id_brand").focus();
                    break;
                    }
                }
            });
        }
        else
        {
            viewMsg("id_brand","희망 아이디는 5~12자의 영문 소문자, 숫자만 사용 가능합니다.","error");
            $("#id_brand").focus();
        }
    }
}

function cheID()
{
    idFlag = 0;
}

function viewMsg(type, msg, flag)
{
    if(!type || !flag) return ;

    var frms = type;

    if(flag == 'error')
    {
        $("#"+frms).removeClass("has-success").addClass("has-error");
    }
    else
    {
        $("#"+frms).removeClass("has-error").addClass("has-success");
    }
    if(msg) alert(msg);
}

function doSubmit()
{
    var company = $("#nm_company").val();
    var id = $("#id_brand").val();
    var name = $("#nm_user").val();
    var email = $("#id_email").val();
    var phone = $("#no_phone").val();
    var url = $("#tx_url").val();
    var reason = $("#tx_reason").val();
    var checked = ($("#contractCheck").prop('checked')) ? true : false;
    var reason_join_checked = ($("#reason_join").prop('checked')) ? true : false;
    var reason_event_checked = ($("#reason_event").prop('checked')) ? true : false;
    var reason_ppl_checked = ($("#reason_ppl").prop('checked')) ? true : false;
    var reason_shop_checked = ($("#reason_shop").prop('checked')) ? true : false;
    var reason_etc_checked = ($("#reason_etc").prop('checked')) ? true : false;

    if(!checked)
    {
        viewMsg('contractCheck','약관에 동의 해 주세요.','error');
        $("#contractCheck").focus();
        return ;
    }
    
    if(!company)
    {
        viewMsg('nm_company','업체명/개인명/단체명을 입력해 주세요.','error');
        $("#nm_company").focus();
        return ;
    }
    var isUrl = /^[ㄱ-ㅎ|가-힣|a-zA-Z_\-0-9\.\/:\?]{5,}$/;
    if(url && !isUrl.test(url))
    {
        viewMsg('tx_url','대표운영사이트 주소를 정확히 입력해 주세요.','error');
        $("#tx_url").focus();
        return ;
    }
    viewMsg('tx_url','','success');
    if(!id && reason_join_checked)
    {
        viewMsg('id_brand','희망 아이디를 입력해 주세요.','error');
        $("#id_brand").focus();
        return ;
    }
    if(!idFlag && reason_join_checked)
    {
        chkID();
        return ;
    }
    if(!name)
    {
        viewMsg('nm_user','담당자 명을 입력해 주세요.','error');
        $("#nm_user").focus();
        return ;
    }
    if(!phone)
    {
        viewMsg('no_phone','대표번호/담당자번호를 입력해 주세요.','error');
        $("#no_phone").focus();
        return ;
    }
    /*
    if(!/^[0-9\-]{9,14}$/.test(phone))
    {
        viewMsg('no_phone','대표번호/담당자번호를 숫자와 ( - )로만 정확히 입력해 주세요.','error');
        $("#no_phone").focus();
        return ;
    }
    */
    viewMsg('no_phone','','success');
    if(!email)
    {
        viewMsg('id_email','이메일 주소를 입력해 주세요.','error');
        $("#id_email").focus();
        return ;
    }
    
    if(reason_join_checked == false && reason_event_checked == false && reason_ppl_checked  == false && reason_shop_checked  == false && reason_etc_checked == false)
    {
        viewMsg('reason_checked','문의사항을 선택해 주세요.','error');
        $("#reason_join_checked").focus();
        return ;
    }

    $("#applyFrm").submit();
}
</script> -->
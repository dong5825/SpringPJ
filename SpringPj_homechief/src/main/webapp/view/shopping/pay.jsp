<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<title>Insert title here</title>
</head>
<body>
${price}
${email}
${phone}
${address}
dd
<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp89691835'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'Home chef 주문 결제',
            amount : ${price},
            buyer_email : '${email}',
            buyer_name : '${name}',
            buyer_tel : '${phone}',
            buyer_addr : '${address}',
            buyer_postcode : '123-456',
            m_redirect_url : 'http://www.iamport.kr/mobile/landing'
        }, function(rsp) {
        	if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
        	$(location).attr('href', '${pageContext.request.contextPath}/shopping/complete');
        	alert(msg);
        });
        
    });
    </script>
</body>
</html>
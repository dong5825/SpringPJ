<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script >
	

	function translate_Kr(city){
		var result = null;
		switch(city){
		case "Seoul" : 
		case "Gyeonggi-do" : result = "서울 경기";break;
		
		case "Gangwon" : 
		case "Gangwon-do" : result = "강원 영동";break; 
		
		case "Chungbuk" : 
		case "Chung-cheong bukdo" : result = "충청 북도";break; 
		
		case "Chungnam" : 
		case "Chungcheongnam-do" : result = "충청 남도";break; 
		
		case "Gyeongbuk" : 
		case "Gyeongsangbuk-do" : result = "경상 북도";break; 
		
		case "Gyeongnam" : 
		case "Gyeongsangnam-do" : result = "경상 남도";break; 
		
		case "Ulleungdo" : 
		case "Dokdo" : result = "울릉 독도";break;
		
		case "Jeonnam" : 
		case "Jeollanam-do" : result = "전라 남도";break;
		
		case "Jeonbuk" : 
		case "Jeollabuk do" : result = "전라 북도";break;
		
		case "Jeju" : 
		case "Jeju Island" : result = "제주";break; 
		
		}
		return result;
	}
	var key = null;
    $.get("http://ip-api.com/json", function(data) {
           console.log(data);
          key = translate_Kr(data.regionName);
           location.href = "${pageContext.request.contextPath}/recommend/weatherinfo?city="+key;
    }, "jsonp");
   
   
</script>
<title>추천 메뉴</title>
</head>
<body>



</body>
</html>
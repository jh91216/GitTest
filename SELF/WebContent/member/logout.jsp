<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/logout.jsp</h1>
	<%
		//로그인 정보(세션) 초기화
		session.invalidate();
	%>
	<script type="text/javascript">
		alert('정상적으로 로그아웃 되었습니다!');
		location.href='../main/main.jsp';
	</script>
</body>
</html>
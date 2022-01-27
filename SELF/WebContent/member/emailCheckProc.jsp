<%@page import="com.anything.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center">
		<h3>이메일 중복 확인 결과</h3>
		<%
			//사용가능한 이메일일 경우, 이메일 입력 폼에 넣기 위함
			String email =request.getParameter("email");
			MemberDAO dao = new MemberDAO();
			int cnt = dao.duplecateEmail(email);
			out.println("입력 이메일 : <strong>"+email+"</strong>");
			if(cnt==0){
				out.println("<p>사용 가능한 이메일입니다.</p>");
				out.println("<a href='javascript:apply(\""+email+"\")'>[적용]</a>");
		%>
	
	
	<script type="text/javascript">
		function apply(email){
			//중복확인 id를 부모창에 적용
			//부모창 opener
			opener.document.fr.email.value=email;
			window.close();
		}
	
	</script>
	
	<%
		}else{
			out.println("<p style='color:red'>해당 이메일은 사용하실 수 없습니다.</p>");
		}
	%>
	<hr>
	<a href="javascript:history.back()">[다시시도]</a>
	&nbsp; &nbsp;
	<a href="javascript:window.close()">[창닫기]</a>
</div>
</body>
</html>
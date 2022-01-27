<%@page import="com.anything.member.MemberDTO"%>
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
	<h1>WebContent/member/insertPro.jsp</h1>
	
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
	
		
		// 전달된 정보(파라미터) 저장 => 자바빈 MemberBean에 저장(액션태그)
				
	%>
	<jsp:useBean id="mdto" class="com.anything.member.MemberDTO"/>
	<jsp:setProperty property="*" name="mdto"/>
	
	
	<%	
		MemberDAO mdao = new MemberDAO();
		mdao.insertMember(mdto);
	%>
	
	<script type="text/javascript">
		alert("회원 가입 완료!");
		location.href = "loginForm.jsp";
	</script>
	
</body>
</html>
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
<h1>WebContent/member/deletePro.jsp</h1>
	<%
		//전달된 정보 저장
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		// MemberDAO  객체 생성 - deleteMember(id,pass);
		MemberDAO mdao = new MemberDAO();
		int result = mdao.deleteMember(id,pass);
		
		// 삭제 처리결과에 따라서 페이지 이동
		
		if(result == -1){
			%>
			<script type="text/javascript">
				alert("아이디 없음!");
				history.back();
			</script>
			<%
		}else if(result == 0){
			%>
			<script type="text/javascript">
				alert("비밀번호 오류!");
				history.back();
			</script>
			<%
		}else{ //result ==1
			//로그인 세션정보를 삭제(초기화)
			session.invalidate();
		
			%>
			<script type="text/javascript">
				alert("삭제완료!!");
				location.href="../index.jsp";
			</script>
			<%
			
		}
	%>
</body>
</html>
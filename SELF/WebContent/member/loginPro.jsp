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
	<h1>WebContent/member/loginPro.jsp</h1>
	
	<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 데이터 저장 (파라미터)
	%>
	<jsp:useBean id="mdto" class="com.anything.member.MemberDTO"/>
	<jsp:setProperty property="*" name="mdto"/>
	
	<%
	// DB연결에 해당하는 처리동작을 수행하는 
	MemberDAO mdao = new MemberDAO();
	
	int result = mdao.loginCheck(mdto.getId(), mdto.getPass());
	
	// 아이디 / 비밀번호 체크 (입력값/ DB의 값)
	// DB에서 ID/PASS 정보를 가져와서 입력값과 비교
	
	if(result == -1){
		%>
		 <script type="text/javascript">
		 	var value = confirm("아이디가 없습니다. 회원가입 하시겠습니까?");
		 	if(value){
		 		location.href ='insertForm.jsp';
		 	}else {
				history.back();
			}
		 </script>
		<%
	}else if(result == 0){
		%>
		 <script type="text/javascript">
		 	alert('비밀번호 오류!');
		 	history.back();
		 </script>
		<%
	}else{	//result == 1
		//로그인 정보를 세션 객체에 저장
		session.setAttribute("id", mdto.getId());
		
		response.sendRedirect("../main/main.jsp");
		
	}
	%>

</body>
</html>
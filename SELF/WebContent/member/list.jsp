<%@page import="com.anything.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.anything.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Anything-회원전체목록</title>
<link href="../Resources/css/table_styles.css" rel="stylesheet"/>
</head>
<body>
<div  class="list_mem">
	<h1>Anything-회원전체목록</h1>
	
	<%
		// 세션제어 (로그인X, 관리자X)
		String id= (String)session.getAttribute("id");
		if(id == null || !id.equals("admin")){
			response.sendRedirect("loginForm.jsp");
			
		}
		
		// MemberDAO 객체 생성 - getMemberList();
		MemberDAO mdao = new MemberDAO();
		ArrayList memberList =  mdao.getMemberList();
		
		
		
	
	%>
	
	<table>
	 <tr>
	 	<td>아이디</td>
	 	<td>비밀번호</td>
	 	<td>이름</td>
	 	<td>성별</td>
	 	<td>나이</td>
	 	<td>이메일</td>
	 	<td>회원가입일</td>
	 	<td>주소</td>
	 </tr>
	 <% for(int i=0;i<memberList.size();i++){ 
         MemberDTO mdto = (MemberDTO) memberList.get(i);
         if(mdto.getId().equals("admin")){
        	 continue;
         }
         
       //for(MemberBean mb : memberList){  
     %>
	     <tr>
	       <td><%=mdto.getId() %></td>
	       <td><%=mdto.getPass() %></td>
	       <td><%=mdto.getName() %></td>
	       <td><%=mdto.getGender() %></td>
	       <td><%=mdto.getAge() %></td>
	       <td><%=mdto.getEmail() %></td>
	       <td><%=mdto.getReg_date() %></td>
	       <%if(mdto.getAddress1() != null){ %>
	       <td>
	       <%=mdto.getAddress1() %>
	       <%=mdto.getAddress2() %>
	       <%=mdto.getAddress3() %>
	       </td>
	       <%} %>
	     </tr>
     <%} 
     	//}%>
     	
   </table>
   <h2><a href="../main/main.jsp">메인페이지로 이동</a></h2>
   </div>
</body>
</html>
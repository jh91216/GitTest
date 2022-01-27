<%@page import="com.anything.member.MemberDTO"%>
<%@page import="com.anything.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원정보 - Anything</title>
        <link href="../Resources/css/table_styles.css" rel="stylesheet"/>
        <link href="../Resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
    	<%
			// 로그인한 사용자의 정보를 출력하는 페이지
			// 로그인을 안한경우 -> 로그인페이지로 이동
			
			String id = (String)session.getAttribute("id");
			
			if(id == null){
				response.sendRedirect("loginForm.jsp");
			}
			
			// 로그인한 사용자의 모든 정보를 DB에서 가져와서 화면에 출력
		
			// DAO객체생성
			MemberDAO mdao = new MemberDAO();
			
			// DAO 객체 안에있는 회원정보를 가져오는 메서드 호출
			MemberDTO mdto = mdao.getMember(id);
		
		%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원정보</h3></div>
                                    <div class="card-body">
                                       	<h3> 아이디 : <%=mdto.getId() %></h3>
										<h3> 이름 : <%=mdto.getName() %></h3>
										<h3> 성별 : <%=mdto.getGender() %></h3>
										<h3> 나이 : <%=mdto.getAge() %></h3>
										<h3> 이메일 : <%=mdto.getEmail() %></h3>
										<h3> 회원가입일 : <%=mdto.getReg_date() %> </h3>
										<%if(mdto.getAddress1() != null){ %>
										<h3> [주소]</h3>
										<hr>
										<h4>
										 <%=mdto.getAddress1() %><br>
										 <%=mdto.getAddress2() %><br>
										 <%=mdto.getAddress3() %><br>
										</h4>
										 
										<%} %>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div><h4><a href="../main/main.jsp">메인페이지로 이동</a></h4></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <!-- bottom.jsp -->
                <%-- <jsp:include page="../inc/bottom.jsp"/> --%>
              <!-- bottom.jsp -->
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../Resources/js/scripts.js"></script>
    </body>
</html>
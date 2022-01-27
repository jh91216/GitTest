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
        <title>회원정보삭제 - Anything</title>
        <link href="../Resources/css/table_styles.css" rel="stylesheet"/>
        <link href="../Resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
    	<%	
			//세션값 제어
			String  id = (String)session.getAttribute("id");
			
			if(id == null){
				response.sendRedirect("loginForm.jsp");
			}
			
	
		%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원 탈퇴</h3></div>
                                    <div class="card-body">
                                        <form action="deletePro.jsp" method="post">
                                            <div class="form-floating mb-3">
                                                <input type="hidden" name="id" value="<%=id%>">                                              
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputPassword" type="password" name="pass" placeholder="비밀번호를 입력하세요">
                                                <label>비밀번호</label>
                                            </div>
                                            
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <input class="btn btn-primary" type="submit" value="삭제하기">                                                
                                            </div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div><a href="../index.jsp">Anything</a></div>
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
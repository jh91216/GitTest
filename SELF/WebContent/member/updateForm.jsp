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
        <title>회원정보수정 - Anything</title>
        <link href="../Resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
		
				function check() {
					
					if(document.fr.pass.value == ""){
						alert("비밀번호를 입력하세요!");
						document.fr.pass.focus();
						return false;
					}
					
				}
	
				//이메일 중복체크 
				function emailcheck() {
					
					//새창
					window.open("emailCheckForm.jsp", "emailch","width=500, height=350");
					
				}
		</script>
    </head>
    <body class="bg-primary">
    	<%
			// 세션값 제어
			String id = (String)session.getAttribute("id");
			
			if(id == null){
				response.sendRedirect("loginForm.jsp");
			}
			
			// 해당 회원의 모든정보를 가져와서 화면에 출력
			
			MemberDAO mdao = new MemberDAO();
			
			MemberDTO oldMdto = mdao.getMember(id);		
			
			
		%>
    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4"><a href="../index.jsp">Anything</a> 회원정보 수정</h3></div>
                                    <div class="card-body">
                                    
                                        <form action="updatePro.jsp" method="post" name="fr" onsubmit="return check();">
                                        <!-- readonly : 읽기전용 (submit 가능) / disabled : 사용불가 (submit 불가능)  -->
                                        	 <h5>아이디</h5>
											 <input type="text" name="id" value="<%=oldMdto.getId()%>" readonly="readonly">
											 <hr>
											 <h5>비밀번호</h5>
											 <input type="password" name="pass" placeholder="비밀번호를 입력하세요">
											 <hr>
											 <h5>이름</h5>
											 <input type="text" name="name" value="<%=oldMdto.getName()%>">
											 <hr>			
											 <input type="hidden" name="jumin1" value="<%=oldMdto.getJumin1()%>">								 
											 <input type="hidden" name="jumin2" value="<%=oldMdto.getJumin2()%>">								 
											 <h5>성별</h5>
											 <%=oldMdto.getGender() %>
											 <hr>
											 <h5>나이</h5>
											 <%=oldMdto.getAge() %>
											 <hr>
											 <h5>이메일</h5>
											 <input type="email" name="email" value="<%=oldMdto.getEmail()%>" readonly="readonly" onclick="emailcheck()">   
											 <input type="button" value="이메일 중복확인" onclick="emailcheck()">
											 <hr>
											 <h5>우편번호</h5>
											 <span class="input_area">
											 <input type="text" name="address1" class="postcodify_postcode5" value="<%=oldMdto.getAddress1()%>">
											 </span>
											 <button type="button" id="postcodify_search_button">검색</button>
											 <h5>도로명주소</h5>
											 <span class="input_area">
											 <input type="text" name="address2" class="postcodify_address" value="<%=oldMdto.getAddress2()%>">
											 </span>
											 <h5>상세주소</h5>
											 <span class="input_area">
											 <input type="text" name="address3" class="postcodify_details" value="<%=oldMdto.getAddress3()%>">
											 </span>
											
											 <hr>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input class="btn btn-primary" type="submit" value="회원정보 수정">
                                                <input type="reset" value="초기화" class="btn" ></div>
                                            </div>
                                        </form>
                                    <!-- 주소 API 스크립트 -->
									<!-- jQuery와 Postcodify를 로딩한다 -->
									<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
									<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
									
									<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
									<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
									
									<script>
										function validate(){
											return true;
										}
									</script>
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
        <script src="js/scripts.js"></script>
    </body>
</html>

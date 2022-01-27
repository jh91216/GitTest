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
        <title>회원가입 - Anything</title>
        <link href="../Resources/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <script type="text/javascript">
		function checkJoin() {
			
			// 1. 아이디 - 공백인지 아닌지 체크
			if(document.fr.id.value == ""){
				alert("아이디를 입력하세요!");
				document.fr.id.focus();
				return false;
			}
			
			// 2. 아이디 - 5~10자리 인지 체크
			if(!(5<=document.fr.id.value.length && document.fr.id.value.length <= 10)){
				alert("5 ~ 10 자리 아이디를 입력하세요!");
				document.fr.id.focus();
				return false;
			}
			
			
			
			// 3. 비밀번호가 공백인지 아닌지 체크
			if(document.fr.pass.value == ""){
				alert("비밀번호를 입력하세요!");
				document.fr.pass.focus();
				return false;
			}
			
			if(document.fr.pass2.value == ""){
				alert("비밀번호 확인을 입력하세요!");
				document.fr.pass2.focus();
				return false;
				
			}
			
			// 4. 비밀번호와 비밀번호 확인의 값이 같은지 체크
			if(document.fr.pass.value != document.fr.pass2.value){
				alert("비밀번호와 비밀번호 확인 데이터가 불일치!!");
				document.fr.pass2.select();
				return false;
			}
			
			// 5. 이름이 공백인지 체크
			if(document.fr.name.value == ""){
				alert("이름을 입력하세요!");
				document.fr.name.focus();
				return false;
			}
			
			// 6. 주민번호 앞자리 6자리 인지, 뒷자리 7자리 입력 되었는지 체크
			if(document.fr.jumin1.value.length != 6){
				alert("주민번호 앞자리를 입력하세요!");
				document.fr.jumin1.focus();
				return false;
			}
			
			if(document.fr.jumin2.value.length != 7){
				alert("주민번호 뒷자리를 입력하세요!");
				document.fr.jumin2.focus();
				return false;
			}
			
			// 7. 성별 체크여부
			var genderNumber = document.fr.jumin2.value.charAt(0);
			
			if(document.fr.gender[0].checked == false && document.fr.gender[1].checked == false){
				alert("성별을 체크하세요!");
				//document.fr.gender[0].focus();
				
				if(genderNumber == 1 || genderNumber == 3){
					document.fr.gender[0].focus();
				}else if (genderNumber == 2 || genderNumber == 4) {
					document.fr.gender[1].focus();
				}else {
					alert("올바른 주민번호를 입력하세요!!");
				}
				return false;
			}
			//나이계산
			var date = new Date();
			var year = document.fr.jumin1.value.substr(0,2);
			var mon = document.fr.jumin1.value.substr(2, 2);
			var day = document.fr.jumin1.value.substr(4, 2);
			
			if(genderNumber==1||genderNumber==2){
				document.fr.age.value = eval(date.getFullYear()-1900-year+1);
			}else if (genderNumber == 3 || genderNumber == 4) {
				document.fr.age.value = eval(date.getFullYear()-2000-year+1);
			}
			
			/* if(document.fr.age.value == ""){
				alert("나이를 입력하세요!");
				document.fr.age.focus();
				return false;
			} */
			
			//9. 이메일 공백
			if(document.fr.email.value == ""){
				alert("이메일을 입력하세요!");
				document.fr.email.focus();
				return false;
			}
			//10.주소 공백
			if(document.fr.address1.value == ""){
				alert("주소를 입력하세요!");
				document.fr.address1.focus();
				return false;
			}
			
				
		}
		
		function fun1() {
			if(document.fr.jumin1.value.length == 6){
				document.fr.jumin2.focus();
			}
		}
		
		//id 중복체크 
		function idcheck() {
			
			//새창
			window.open("idCheckForm.jsp", "idch","width=500, height=350");
			
		}
		
		//이메일 중복체크 
		function emailcheck() {
			
			//새창
			window.open("emailCheckForm.jsp", "emailch","width=500, height=350");
			
		}
		
		//나이계산
		function agecheck() {
			var genderNumber = document.fr.jumin2.value.charAt(0);
			var date = new Date();
			var year = document.fr.jumin1.value.substr(0,2);
			var mon = document.fr.jumin1.value.substr(2, 2);
			var day = document.fr.jumin1.value.substr(4, 2);
			
			if(genderNumber==1||genderNumber==2){
				document.fr.age.value = eval(date.getFullYear()-1900-year+1);
			}else if (genderNumber == 3 || genderNumber == 4) {
				document.fr.age.value = eval(date.getFullYear()-2000-year+1);
			}
		}
		
		
		
			
		
		
	</script>
    </head>
    <body class="bg-primary">
    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4"><a href="../index.jsp">Anything</a> 회원가입</h3></div>
                                    <div class="card-body">
                                    
                                        <form action="insertPro.jsp" method="post" name="fr" onsubmit="return checkJoin();">
                                        	 <h5>아이디</h5>
											 <input type="text" name="id" id="id" readonly="readonly" onclick="idcheck()">   
											 <input type="button" value="ID중복확인" onclick="idcheck()">
										
											 
											 <hr>
											 <h5>비밀번호</h5>
											 <input type="password" name="pass">
											 <br><br>
											 <h5>비밀번호확인</h5>
											 <input type="password" name="pass2">
											 <hr>
											 <h5>이름</h5>
											 <input type="text" name="name">
											 <hr>
											 <h5>주민번호</h5>
											 <small>
											 1900년대 내국인 남자 : 1, 1900년대 내국인 여자 : 2<br>
											 2000년대 내국인 남자 : 3, 2000년대 내국인 여자 : 4<br>
											 </small><br>
											 <input type="text" name="jumin1" maxlength="6" onkeyup="fun1();">
											 - <input type="text" name="jumin2" maxlength="7"><br>
											 <hr>
											 <h5>성별</h5>
											 <h6><input type="radio" name="gender" value="남">남
											 <input type="radio" name="gender" value="여">여</h6>
											 <hr>
											 <h5>나이(주민번호 입력 후 자동입력)</h5>
											 <input type="text" name="age" readonly="readonly" onclick="agecheck();">
											 <hr>
											 <h5>이메일</h5>
											 <input type="email" name="email" id="email" readonly="readonly" onclick="emailcheck()">   
											 <input type="button" value="이메일 중복확인" onclick="emailcheck()">
											 <hr>
											
											 
											 <h5>우편번호</h5>
											 <span class="input_area">
											 <input type="text" name="address1" class="postcodify_postcode5">
											 </span>
											 <button type="button" id="postcodify_search_button">검색</button>
											 <h5>도로명주소</h5>
											 <span class="input_area">
											 <input type="text" name="address2" class="postcodify_address">
											 </span>
											 <h5>상세주소</h5>
											 <span class="input_area">
											 <input type="text" name="address3" class="postcodify_details">
											 </span>
											 <hr>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><input class="btn btn-primary" type="submit" value="회원가입">
                                                <input type="reset" value="초기화" class="btn" ></div>
                                            </div>
                                        </form>
                                    
                                    </div>
                                    <div class="card-footer text-center py-3">
                                    <div id="table_search">
                                        <input type="button" value="로그인" class="btn" onclick="location.href='loginForm.jsp'">
                                        
                                        
                                    </div>
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

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID중복확인</title>
<script type="text/javascript">
	function blankCheck(f) {
		var id = f.id.value;
		id=id.trim();
		if(!(5<=id.length && id.length<=10)){
			alert("5 ~ 10 자리 아이디를 입력하세요!");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div style="text-align: center">
	 <h3>아이디 중복확인</h3>
	 <form action="idCheckProc.jsp" method="post" onsubmit="return blankCheck(this)">
	 	아이디 : <input type="text" name="id" autofocus="autofocus">
	 	<input type="submit" value="중복확인">
	 </form>
	</div>

</body>
</html>
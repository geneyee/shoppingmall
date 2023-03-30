<%@page import="com.project.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<title>회원 탈퇴하기</title>
<!-- <script language="javascript">
function go() {
	alert("회원이 탈퇴되셨습니다.그동안 감사했습니다. 또 보기 바래요@'-'@");
	location.href="main.do";
}
</script> -->
</head>
<body>
	<div class="w3-content w3-container"
		style="width: 400px; margin-top: 10%;">
		<div class="w3-container w3-card-4" style="height: 360px;">
			<form action="deleteAccount.do" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h4>회원 탈퇴하기</h4>
					<br>
				</div>
				<label>비밀번호를 입력해주세요</label>
				<p>

					<input type="password" class="w3-block" id="pwd" name="pwd"
						style="width: 100%; font-size: 13px; padding: 7px 0px; margin: 8px">
					<br>
				<p class="w3-center">
					<input type="submit" id=findBtn
						class="w3-button w3-block  w3-ripple w3-round" value="delete"
						style="background-color: rgba(43, 47, 58); color: white; margin-top: 30px;">
					<button type="button" onclick="window.close();"
						class="w3-button w3-block  w3-ripple w3-margin-top w3-margin-bottom w3-round"
						style="background-color: rgba(43, 47, 58); color: white;">Cancel</button>
				</p>
			</form>
		</div>

	</div>

</body>
</html>

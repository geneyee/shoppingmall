<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>아이디 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form action="idsearch.do" method="post">
				<div class="w3-center w3-large w3-margin-top">
					<h4>아이디 찾기</h4>
				</div>
				<div>
						<label>Email</label>
						<!-- <input class="w3-input" type="text" id="email" name="email" required> -->
						<p>
                                    <input class="w3-input" type="text" name="email" id="email"size="15" required/> @ 
                                    <select id="email1" name="email1" style="width:210px;font-size: 13px;padding: 7px 0px;margin: 8px">
                                        <option value="">선택</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="hanmail.net">hanmail.net</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="nate.com">nate.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option value="direct_input">직접입력</option>
                                    </select>
                                    </p>
					<p class="w3-center">
<!-- 						<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
 -->						<input type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="find">
						<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
					</p>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

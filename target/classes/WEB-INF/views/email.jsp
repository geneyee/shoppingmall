<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>이메일 인증</title>
<style>
   #box1 {
      font-size:20px;
      font:strong;
      display:inline-block;
      vertical-align:middle;
   }
   label {
      display:inline-block;
       width:100%;
      text-align:center;
   }

</style>
</head>
<body>
   <div class="w3-content w3-container" style="width:35%; margin-top:10%;">
      <div class="w3-container w3-card-4">
         <form action="auth.do" method="post">
            <div class="w3-center w3-large w3-margin-top">
            <img src="resources/img/iconmonstr-delivery-7-48.png" style="height:50px;">
               <h4 id="box1">Email 인증</h4>
            </div>
            <div>
                  <label>(이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</label>
                  <p><input class="w3-input" type="email" name="e_mail" placeholder="  이메일주소를 입력하세요. " required></p>
               <p class="w3-center">
                  <input type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="이메일 인증받기(이메일 보내기)">
                  <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
               </p>
            </div>
         </form>
      </div>
   </div> 
</body>
</html>
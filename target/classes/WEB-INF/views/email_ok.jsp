<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 인증</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
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
         <form action="join_ok.do${dice}" method="post"> <!-- //받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인    -->
            <div class="w3-center w3-large w3-margin-top">
            <img src="resources/img/iconmonstr-delivery-7-48.png" style="height:50px;">
               <h4 id="box1">Email 인증</h4>
            </div>
            <div>
                  <label>입력한 이메일로 받은 인증번호를 입력하세요.</label><label>(인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</label>
                  <p><input class="w3-input" type="number" name="email_injeung" placeholder="  인증번호를 입력하세요. " required></p>
               <p class="w3-center">
                  <input type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round" value="인증번호 전송">
                  <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
               </p>
            </div>
         </form>
      </div>
   </div> 
</body>
</html>
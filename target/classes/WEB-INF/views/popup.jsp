<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script language="JavaScript">
function notice_setCookie( name, value, expiredays ){
	var todayDate = new Date();todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
 }
function notice_closeWin() {
	if ( document.forms[0].Notice.checked ) 
		notice_setCookie( "Notice", "done" , 1);
		self.close();
	} function na_call(str){ eval(str);}
	</script>
</head>
<body>
<form name="form1">
<img src="resources/img/popup4.png">
<input type="checkbox" name="Notice" OnClick="notice_closeWin()">오늘은 이창을 다시 열지않음</form>
</body>
</html>
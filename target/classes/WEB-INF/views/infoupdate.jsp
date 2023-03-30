<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.project.user.vo.UserVO"%>
<%@page import="com.project.user.dao.UserDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<html lang="ko">
<title>회원정보 수정</title>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<!-- 회원가입 ajax -->
<link href="<c:url value="/resource/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
 <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
<style>
#alert-info{
	font-size:12px;
	color:red;
	font-weight:bold;
	margin-left:10px;
}
#alert-pwd{
	font-size:12px;
	color:red;
	font-weight:bold;
	margin-left:10px;
}
</style>
<!-- <bonobono-fixed> -->
  <link href="<c:url value="/resources/css/fixed.css" />" rel="stylesheet"></link>
  <link href="<c:url value="/resources/css/category.css" />" rel="stylesheet"></link>
  <script src="<c:url value="/js/jquery.easing.1.3.js" />"></script>
<!-- </bonobono-fixed> -->
  <link href="<c:url value="/resources/css/updateinfo.css" />" rel="stylesheet"></link>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="css/bootstral.min.css"></link>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"></link>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- added css -->
<a href="#" class="go-top">▲</a>
<script>
/*Add class when scroll down*/
$(window).scroll(function(event){
  	var scroll = $(window).scrollTop();
    if (scroll >= 50) {
        $(".go-top").addClass("show");
    } else {
        $(".go-top").removeClass("show");
    }
});
/*Animation anchor*/
$('a').click(function(){
    $('body').animate({
        scrollTop: $( $(this).attr('href') ).offset().top
    }, 1000);
});
</script>
<!-- 이용약관 동의 -->
<script language="javascript">
function go() {
	alert("회원정보가 수정되었습니다!");
	location.href="mypage.do";
}
</script>
<script type="text/javascript">
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=address]").val(data.zonecode);
           $("[name=address1]").val(fullRoadAddr);
           
           document.getElementById('address').value = data.zonecode; //5자리 새우편번호 사용
           
           document.getElementById('address1').value = fullRoadAddr;
       }
    }).open();
}

function checkIt(){
	
	
	var pwd = $('#pwd').val();
	if(!pwd){
		alert("비밀번호를 입력하세요.")
		return false;
	}
	var pwd1 = $('#pwd1').val();
	if(pwd1 != pwd){
		alert("비밀번호를 동일하게 입력하세요.")
		return false;
	}
	var tel = $('#tel').val();
	var tel1 = $('#tel1').val();
	var tel2 = $('#tel2').val();
	if(!tel || !tel1 || !tel2){
		alert("전화번호를 입력하세요.")
		return false;
	}
	var email = $('#email').val();
	var email = $('#email1').val();
	if(!email || !email1){
		alert("이메일을 입력하세요.")
		return false;
	}
	var address = $('#address').val();
	var address1 = $('#address1').val();
	var address2 = $('#address2').val();
	if(!address || !address1 || !address2){
		alert("주소를 입력하세요.")
		return false;
	}
	
}
    
</script>
<script>
$(function(){		
	$('#pwd').keyup(function(){
		
		$('font[name=ckeck]').text('');
	});//pwd keyup
	
	$('#pwd1').keyup(function(){
		if($('#pwd').val()!=$('#pwd1').val()){
			$('font[name=ckeck]').text('');
			$('font[name=check]').html("비밀번호 불일치");
		}else{
			$('font[name=ckeck]').text('');
			$('font[name=check]').html("비밀번호 일치");
		}
	});//pwd1.keyup
});
</script>
<%
            UserDAO userDAO = new UserDAO();
			//로그인 한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

			String user_id = null;
			if (session.getAttribute("user_id") != null) {
				user_id = (String) session.getAttribute("user_id");
			}
			int pageNumber = 1; //기본 페이지 넘버
			//페이지넘버값이 있을때
			if (request.getParameter("pageNumber") != null) {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
			
			 UserVO user = userDAO.searchInfo(user_id);
%>
<script language="JavaScript">
function checkemailaddy(){
		if (form.email_select.value == '1') {
			form.email1.readOnly = false;
			form.email1.value = '';
			form.email1.focus();
		}
		else {
			form.email1.readOnly = true;
			form.email1.value = form.email_select.value;
		}
	}
</script>
</head>
<body>
 <div class="wrap">
        <div class="header"style="background: rgba(249,249,249);">
            <div class="container"style="background: rgba(249,249,249);">
                <div id="header-menu">
                        <%
                 if(user_id == null){
	            %> 
	             
                    <div id="login">
                        <a href="loginForm.do"title="로그인 이동">로그인</a>
                    </div>
                    <div id="sign">
                        <a href="email.do"title="회원가입 이동">회원가입</a>
                    </div>
                    <div id="gesipan">
                        <a href="board.do"title="게시판 이동">리뷰게시판</a>
                    </div>
                    <div id="gesipan">
                        <a href="board2.do"title="게시판 이동">공지사항</a>
                    </div>
                    
                    <%   
                    } else {
    	                if(user_id.equals("admin")){%>
                        <div id="adminMain">
                        <a href="adminMain.do" title="관리자페이지">상품관리</a>
                        </div>
                        
	                     <div id="logout">
	                     <a href="logout.do" title="로그아웃">로그아웃</a>
	                     </div>
	                     <%}else{ %>
	                     <div id="logout">
	                     <a href="logout.do" title="로그아웃">로그아웃</a>
	                     </div>
	                     <div id="gesipan">
	                          <a href="board.do"title="게시판 이동">리뷰게시판</a>
	                      </div>
	                      <div id="gesipan">
	                          <a href="board2.do"title="게시판 이동">공지사항</a>
	                      </div>
	                      <div id="bagooni">
	                          <a href="Cart_list.do"title="장바구니 이동">장바구니</a>
	                      </div>
	                      <div id="mypage">
	                          <a href="mypage.do"title="마이페이지 이동">마이페이지</a>
	                      </div>
                      <%} %> 
                     <%
                      }
                     %>
                     </div>
                <!--//헤더메뉴-->
                <div id="header-logo">
            <div id="logo">
               <a href="main.do" style="font-family: 'Varela Round', sans-serif">GAZUA.</a>
            </div>
            <div id="search-text">
               <input type="text" name="search-text"
                  style="width: 400px; height: 30px; border: none; font-size: 28px; background: rgba(249, 249, 249);">
            </div>
                    <div id="search"><a href="search"title="찾기"></a></div>
                </div>
                <!--//로고&검색창-->
                
                <!--//전체 카테고리-->
            </div>
        </div>
        <div class="menu">

      <ul class="nav">

         <li><a href="#">Home</a></li>

         <li class="active sub"><a href="#">의류</a>
            <ul>
               <li class="sub"><a href="#">남성의류</a>
                  <ul>
                     <li><a href="#">반팔티셔츠</a></li>
                     <li><a href="#">긴팔티셔츠</a></li>
                     <li><a href="#">캐주얼셔츠</a></li>
                     <li><a href="#">드레스셔츠</a></li>
                     <li><a href="#">정장</a></li>
                     <li><a href="#">반바지</a></li>
                     <li><a href="#">청바지</a></li>
                     <li><a href="#">니트</a></li>
                     
                     
                  </ul></li>
                  
                  <li class="sub"><a href="#">여성의류</a>
                  <ul>
                     <li><a href="#">티셔츠</a></li>
                     <li><a href="#">셔츠/블라우스</a></li>
                     <li><a href="#">니트</a></li>
                     <li><a href="#">가디건</a></li>
                     <li><a href="#">원피스</a></li>
                     <li><a href="#">바지</a></li>
                     <li><a href="#">청바지</a></li>
                     <li><a href="#">레깅스</a></li>
                  </ul></li>

            </ul></li>

         <li class="active sub"><a href="#">뷰티 잡화</a>
            <ul>

               <li class="sub"><a href="#">화장품</a>
                  <ul>   
                     <li><a href="#">스킨</a></li>
                     <li class="last"><a href="#">로션</a></li>
                  </ul></li>
                  
                  <li class="sub"><a href="#">향수</a>
                  <ul>   
                     <li><a href="#">바디</a></li>
                     <li class="last"><a href="#">헤어</a></li>
                  </ul></li>

               <li class="sub"><a href="#">신발</a>
                  <ul>
                     <li><a href="#">남성신발</a></li>
                     <li><a href="#">여성신발</a></li>
                  </ul></li>
                  
                  <li class="sub"><a href="#">가방 패션잡화</a>
                  <ul>
                     <li><a href="#">남성가방</a></li>
                     <li><a href="#">여성가방</a></li>
                  </ul></li>
                  
            </ul></li>
            <li class="active sub"><a href="#">가구 가전 </a>
            <ul>
               <li class="sub"><a href="#">생활/취미</a>
                  <ul>
                     <li><a href="#">가구</a></li>
                     <li><a href="#">조명</a></li>
                     <li><a href="#">생활/욕실/수납용품</a></li>
                  </ul></li>
                  
                  <li class="sub"><a href="#">가전</a>
                  <ul>
                     <li><a href="#">디지털가전</a></li>
                     <li><a href="#">영상가전</a></li>
                     <li><a href="#">주방용품</a></li>
                     
                  </ul></li>
                  
                  <li class="sub"><a href="#">컴퓨터</a>
                  <ul>
                     <li><a href="#">노트북</a></li>
                     <li><a href="#">카메라</a></li>
                     <li><a href="#">음향기기</a></li>
                     
                  </ul></li>
            </ul></li>
            
            <li class="active sub"><a href="#">스포츠/레저</a>
            <ul>
               <li class="sub"><a href="#">휘트니스/수영</a>
                  <ul>
                     <li><a href="#">헬스기구</a></li>
                     <li><a href="#">웨이트기구</a></li>
                      <li><a href="#">헬스용품</a></li>
                     <li><a href="#">헬스 보충제</a></li>
                      <li><a href="#">요가/필라테스</a></li>
                     <li><a href="#">남성수영복</a></li>
                      <li><a href="#">여성수영복</a></li>
                     <li><a href="#">래쉬가드/서핑슈트</a></li>
                  
                  </ul></li>
                  
                  <li class="sub"><a href="#">등산/아웃도어</a>
                  <ul>
                     <li><a href="#">남성등산의류</a></li>
                     <li><a href="#">여성등산의류</a></li>
                     <li><a href="#">등산화/트래킹화</a></li>
                     <li><a href="#">등산배낭</a></li>
                     <li><a href="#">등산스틱</a></li>
                     <li><a href="#">등산장비용품</a></li>
                  </ul></li>

            </ul></li>
            
            <li class="active sub"><a href="#">도서 교육 티켓</a>
            <ul>
               <li class="sub"><a href="#">도서/음반</a>
                  <ul>
                     <li><a href="#">유아/아동</a></li>
                     <li><a href="#">교육/참고서</a></li>
                      <li><a href="#">문학/인문/음반</a></li>
                                       
                  </ul></li>
                  
                  <li class="sub"><a href="#">티켓</a>
                  <ul>
                     <li><a href="#">콘서트/클래식</a></li>
                     <li><a href="#">뮤지컬/연극</a></li>
                     <li><a href="#">행사/전시</a></li>
                     
                  </ul></li>

            </ul></li>
            
            <li class="active sub"><a href="#">브랜드 패션</a>
            <ul>
               <li class="sub"><a href="#">브랜드 남성의류</a>
                  <ul>
                     <li><a href="#">티셔츠</a></li>
                     <li><a href="#">남자정장</a></li>
                      <li><a href="#">팬츠</a></li>
                                       
                  </ul></li>
                  
                  <li class="sub"><a href="#">브랜드 여성의류</a>
                  <ul>
                     <li><a href="#">티셔츠</a></li>
                     <li><a href="#">원피스</a></li>
                     <li><a href="#">여성정장</a></li>
                     
                  </ul></li>

            </ul></li>
            <li class="sub"><a href="#">도서 티켓</a>
                  <ul>
                     <li><a href="#">콘서트/뮤지컬</a></li>
                     <li><a href="#">문학/인문</a></li>
                     <li><a href="#">행사/전시</a></li>
                  </ul></li>
                  
                  <li class="sub"><a href="#">기타</a>
                  <ul>
                     <li><a href="#">e티켓</a></li>
                     <li><a href="#">여행</a></li>
                     <li><a href="#">항공권</a></li>
                  </ul></li>

            </ul></li>
   </div>
        <!-- END Menu -->
        <!--//헤더-->
        <form name="form" method="post" action="infoupdate.do" onsubmit="return checkIt();">
        <div class="contents1">
            <div class="container" style="width:1000px;">
                <div id="sign-title">가즈아 회원정보</div>
                <div id="information">
                    <div id="info-title"style="font-size:27px;">1. 정보수정</div>
                    <div id="info-table">
                    
                        <table border="0">
                            <tr>
                               <td><input type="text" id="user_id" name="user_id" value="<%=user_id %>" size="55" readonly="readonly"/></td>
                            </tr>
                            <tr>
                               <td><input type="text" id="name" name="name" value="<%=user.getName() %>" size="55"readonly="readonly"/></td> 
                            </tr>
                            <tr>
                               <td><input type="password" id="pwd" name="pwd" placeholder="비밀번호" size="55"/>
                               <font name="check" size="1" color="red"></font></td>   
                            </tr>
                            <tr>
                               <td><input type="password" id="pwd1" name="pwd1" placeholder="비밀번호 확인" size="55"/>
                                <div class="alert alert-warning" id="alert-pwd">8자 이상 영문 대소문자와 숫자 혹은 특수문자 1자 이상 필수</div></td>                              
                            </tr>
                            <tr>
                                <td>
                                <select id="tel" name="tel" title="휴대폰 앞자리 선택" style="width:140px;font-size: 13px;padding: 7px 0px;margin: 8px">
                                    <option value="휴대폰 번호 선택">휴대폰 번호 선택</option>
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                </select> 
                                 -<input type="text" name="tel1" id="tel1"size="14"/>
                                -<input type="text" name="tel2" id="tel2"size="14"/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    
									<select name="email_select" class="box" id="email_select" onChange="checkemailaddy();"style="width:140px;font-size: 13px;padding: 7px 0px;margin: 8px">
										<option value="" selected>선택하세요</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="kakao.com">kakao.com</option>
										<option value="google.com">google.com</option>
										<option value="1">직접입력</option>
									</select>
									&nbsp<input name="email" type="text" class="box" id="email" size="14"/>@<input name="email1" type="text" class="box" id="email1" size="14"/>
									</form>
                                </td>
                            </tr>
                            <tr>
                               <td>
                               <!-- <input type="text" name="address" id="address" size="30">주소</input> -->
                               <input class="form-control" style="width: 9%; display: inline;" placeholder="우편번호" 
                                name="address" id="address"type="text" readonly="readonly"/>   
                               <input class="form-control" placeholder="도로명 주소" name="address1" id="address1" type="text" size="46" readonly="readonly" />
                               <button type="button" class="btn btn-default" onclick="execPostCode();"style="font-weight: bold;padding: 3px;background: rgba(114,107,101);color: white;font-size:13px;"><i class="fa-search"></i>우편번호 찾기</button><br>
                               <input class="form-control" placeholder="상세주소" name="address2" id="address2" type="text" size="55"/>
                               </td> 
                            </tr>
                        </table>
                    
                    </div>
             
                    <input type="submit" value="수정하기" id="btn1" style="border:none;width:200px;height:60px;font-weight: bold;padding: 3px;background: rgba(43,47,58);color: white;margin-left:270px;margin-top:60px;"/>
                    <input type="button" value="취소하기" id="btn2" style="border:none;width:200px;height:60px;font-weight: bold;padding: 3px;background: rgba(43,47,58);color: white;margin-left:90px;margin-top:60px;" onclick="history.back();"/>
                </div>
            </div>
        </div>
        </form>
        
        <!--//컨텐츠-->
        <div class="footer">
           <div class="container">
            <div id="footer">
                <ul>
                    <li><a href="#">사이트 도움말</a></li>
                    <li><a href="#">사이트 이용약관</a></li>
                    <li><a href="#">사이트 운영규칙</a></li>
                    <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                    <li><a href="#">책임의 한계와 법적고지</a></li>
                    <li><a href="#">게시중단요청 서비스</a></li>
                    <li><a href="#">고객센터</a></li>
                </ul>
            </div>
            <div class="footer-section footer-section-first">
						<div class="footer-section-inner">
							<h3  style="color: black;">고객센터</h3>
							<address>
								<ul>
									<li>Tel : <strong>4444-1111</strong> (평일 09:00~18:00)</li>
									<li>스마일클럽 &amp; VVIP : <strong>4567-7823</strong> (365일 09:00~18:00)</li>
									<li>서울시 종로구 돈화문로 26 5층</li>
									<li>Fax : 02-741-0000<span class="bar"></span>Mail : <a href="https://memberssl.auction.co.kr/help/Mail.aspx?topCode=M&cCode=M0711">information@corp.action.co.kr</a></li>
								</ul>
							</address>
						</div>
					</div>
            <div class="footer-section ebay_info">
                <div class="footer-section-inner">
                    <h3 style="color: black;">(주)액션꼬레아</h3>
                <ul>
                        <li>서울시 종로구 돈화문로 <span class="alpha-num">0411</span> (5층 강의실)</li>
                        <li>대표이사 : Ready-Action</li>
                        <li>사업자등록번호 : <span class="alpha-num">123-00-54321</span></li>
                        <li>통신판매업신고 : 종로 <span class="alpha-num">10630</span>호 
                            <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208183676" class="footer-button" target="_blank" >								
                                <img class="lazy" src="http://pics.iacstatic.co.kr/common/blank.gif" data-original="http://pics.iacstatic.co.kr/common/footer/button_check_biz_info.png" alt="사업자정보 확인" />
                            </a>
                        </li>
                </ul>
                </div>
            </div>
   <div class="footer-section">
                <div class="footer-section-inner">
                    <h3><a href="http://member.auction.co.kr/help/InLineHelp.aspx?newhelpcode=1&amp;code=I02042" onclick="newHelpPop('I02042'); return false;">전자금융 분쟁처리</a></h3>
                    <ul>
                        <li class="inline alpha-num">Tel : 1234-4321</li>
                        <li class="inline alpha-num">Fax : 02-456-7535</li>
                        <li class="alpha-num">Mail : <a href="mailto:mediation@corp.auction.co.kr">readyacion@corp.action.co.kr</a></li>
                        <li class="footer-links">
                            <a class="footer-link" href="#">분쟁처리절차&gt;</a></li>
                    </ul>
                </div>
    </div>
            <div class="warning" style="clear: both;border-top: 1px solid rgba(0,0,0,0.2);padding-top: 5px;">
                ㈜ 액션 사이트의 상품/판매자/쇼핑 정보, 콘텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등에 의하여 엄격히 금지됩니다. 콘텐츠산업 진흥법에 따른 표시 액션은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 액션은 상품 · 거래정보 및 거래에 대하여 책임을 지지 않습니다.
            </div>
            <address style="margin-top: 10px;">
                Copyright&copy;action.co.kr All Right Redreved
            </address>
            
            <div class="w3c" style="float: right;">
                        <a href="http://jigsaw.w3.org/css-validator/check/referer">
                            <img style="border:0;width:88px;height:31px" src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="올바른 CSS입니다!" />
                        </a>
                        <a href="http://validator.w3.org/check?uri=referer">
                            <img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" height="31" width="88" />
                        </a>
                    </div>
            </div>
        </div>
        <!--//풋터-->
    </div>
    <!--//랩-->
<!-- 비밀번호 유효성 검사  -->
<script type="text/javascript">
$(function(){
	$("#alert-pwd").hide();
	$("#pwd").keyup(function(){
		$("#alert-danger").hide();
		$("#alert-success").hide();
		var re = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,}$/
		var pwd = $("#pwd").val();
	

		v = $(this).val();
		
		if( !re.test(v) ) {
	    	 $("#alert-pwd").show();
	    	 $("#submit").attr("disabled", "disabled");

        	 $(this).val(v.replace(re,''));
		}else{
		 $("#alert-pwd").hide();
    	 $("#submit").removeAttr("disabled");
		}
		
	});
});
</script>  
</body>
</html></html>
</html>
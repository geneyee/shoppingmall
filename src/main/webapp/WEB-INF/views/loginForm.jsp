<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<html lang="ko">
<title>메인 화면</title>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- <bonobono-fixed> -->
<link href="<c:url value="/resources/css/fixed.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/category.css" />"rel="stylesheet">
<script src="<c:url value="/js/jquery.easing.1.3.js" />"></script>
<!-- </bonobono-fixed> -->
<link href="<c:url value="/resources/css/signin.css" />"rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
<!-- added css -->
         <a href="#" class="go-top">▲</a>   <script>
               window.onload = function() {

                  if (getCookie("user_id")) { // getCookie함수로 id라는 이름의 쿠키를 불러와서 있을경우
                     document.loginForm.user_id.value = getCookie("user_id"); //input 이름이 id인곳에 getCookie("id")값을 넣어줌
                     document.loginForm.idsave.checked = true; // 체크는 체크됨으로
                  }

               }

               function setCookie(name, value, expiredays) //쿠키 저장함수
               {
                  var todayDate = new Date();
                  todayDate.setDate(todayDate.getDate() + expiredays);
                  document.cookie = name + "=" + escape(value)
                        + "; path=/; expires="
                        + todayDate.toGMTString() + ";"
               }

               function getCookie(Name) { // 쿠키 불러오는 함수
                  var search = Name + "=";
                  if (document.cookie.length > 0) { // if there are any cookies
                     offset = document.cookie.indexOf(search);
                     if (offset != -1) { // if cookie exists
                        offset += search.length; // set index of beginning of value
                        end = document.cookie.indexOf(";", offset); // set index of end of cookie value
                        if (end == -1)
                           end = document.cookie.length;
                        return unescape(document.cookie.substring(
                              offset, end));
                     }
                  }
               }

               function sendit() {
                  var frm = document.loginForm;
                  /* if (!frm.user_id.value) { //아이디를 입력하지 않으면.
                      alert("아이디를 입력 해주세요!");
                      frm.user_id.focus();
                      return;
                  } */
                  /* if (!frm.pwd.value) { //패스워드를 입력하지 않으면.
                      alert("패스워드를 입력 해주세요!");
                      frm.pwd.focus();
                      return;
                  } */

                  if (document.loginForm.idsave.checked == true) { // 아이디 저장을 체크 하였을때
                     setCookie("user_id",
                           document.loginForm.user_id.value, 7); //쿠키이름을 id로 아이디입력필드값을 7일동안 저장
                  } else { // 아이디 저장을 체크 하지 않았을때
                     setCookie("user_id",
                           document.loginForm.user_id.value, 0); //날짜를 0으로 저장하여 쿠키삭제
                  }

                  document.loginForm.submit(); //유효성 검사가 통과되면 서버로 전송.

               }

               function openConfirmid() {

                  url = "idsearchForm.do";

                  open(
                        url,
                        "confirm",
                        "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=500");

               }

               function openConfirmpwd() {

                  url = "pwsearchForm.do";

                  open(
                        url,
                        "confirm",
                        "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=500");

               }
               
               $(window).scroll(function(event) {
                   var scroll = $(window).scrollTop();
                   if (scroll >= 50) {
                      $(".go-top").addClass("show");
                   } else {
                      $(".go-top").removeClass("show");
                   }
                });
                /*Animation anchor*/
                $('a').click(function() {
                   $('body').animate({
                      scrollTop : $($(this).attr('href')).offset().top
                   }, 1000);
                });
                
                function openConfirmid() {

                    url = "idsearchForm.do";

                    open(
                          url,
                          "confirm",
                          "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=500");

                 }

                 function openConfirmpwd() {

                    url = "pwsearchForm.do";

                    open(
                          url,
                          "confirm",
                          "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=500");

                 }
            </script>
</head>
<body>

   <%
      String user_id = null;
      if (session.getAttribute("user_id") != null) {
         user_id = (String) session.getAttribute("user_id");
      }
   %>
   <div class="wrap">
      <div class="header">
         <div class="container">
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
            <div id="container">
            <div id="logo">
               <a href="main.do" style="font-family: 'Varela Round', sans-serif">GAZUA.</a>
            </div>
            <div id="search-text">
               <input type="text" name="search-text"
                  style="width: 400px; height: 30px; border: none; font-size: 28px; background: rgba(249, 249, 249);">
            </div>
               <div id="search">
                  <a href="search" title="찾기"></a>
               </div>
            </div>
            <!--//로고&검색창-->

            <!--//전체 카테고리-->
         </div>
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
      <div class="contents1">
         <div class="container">
            <div id="font-cont">
               <div id="login-font">
                  <span id="lo">로</span> <span id="g">그</span> <span id="in">인</span>
               </div>
               <div id="login-cont">
                  <div id="login-box">
                    <form action="login.do" method="post" id="loginForm"
                        name="loginForm">
                        <table border=0>
                           <tr>
                              <td
                                 style="font-size: 14px; font-weight: 500; text-align: right;">아이디&nbsp;&nbsp;</td>
                              <td><input type="text" id="user_id" name="user_id"
                                 size="10" /></td>
                              <td style="font-size: 14px; font-weight: 500;"><input
                                 name="idsave" type="checkbox" id="saveOk" tabindex="4" />
                                 ID기억하기</td>
                           </tr>
                           <tr>
                              <td
                                 style="font-size: 14px; font-weight: 500; text-align: right;">비밀번호&nbsp;&nbsp;</td>
                              <td><input type="password" name="pwd" size="10"/></td>
                           </tr>

                           <tr>
                              <td></td>
                                 <td colspan="2"><input type="submit" value="로그인" onclick="sendit()"
                                    style="font-size: 15px; font-weight: bold; color: white; background: rgba(43, 47, 58); width: 105px; height: 40px; margin: 8px 0px;"/></td>
                           </tr>
                           <tr>
                              <td><input type="button" value="회원가입"
                                 style="font-size: 12px; font-weight: bold; color: black; background: white; width: 90px; height: 25px;"
                                 onclick="location.href='email.do'"/></td>

                             <td><input type="button" value="아이디 찾기"
                                 style="font-size: 12px; font-weight: bold; color: black; background: white; width: 105px; height: 25px;"
                                 onclick="openConfirmid(this.form)" /></td>
                              <td><input type="button" value="비밀번호 찾기"
                                 style="font-size: 12px; font-weight: bold; color: black; background: white; width: 105px; height: 25px;"
                                 onclick="openConfirmpwd(this.form)" /></td>
                           </tr>
                        </table><a href="https://kauth.kakao.com/oauth/authorize?client_id=7acbea97dbdc9d91c13e7c3e7cf49768&redirect_uri=https://gazua.store/kakaologin.do&response_type=code">
                                       <img src="resources/img/kakaologin.png"
                                       style="margin: 11px 8px" /></a>
            
                                 <span id="naver_id_login" style="text-align: center">
                                    <a href="${url}"><img width="150"
                                       src="resources/img/naverlogin.png" style="margin:12px 0px"/></a>
                                 </span>
                              
                     </form>
                  </div>
                  <div id="coupon-font">할인쿠폰:(1)장</div>
                  <div id="coupon-box">
                     <table border="0" style="margin: 30px 0px 0px 10px;">
                        <tr>
                           <th style="text-align: center;"><span
                              style="display: inline-block; width: 100px; border-top: 1px solid black; border-bottom: 1px solid black; background: rgba(229, 229, 229, 0.5); padding: 0;">쿠폰명</span>
                              <span
                              style="display: inline-block; width: 100px; border-top: 1px solid black; border-bottom: 1px solid black; background: rgba(229, 229, 229, 0.5); padding: 0; margin: 0;">할인액</span>
                              <span
                              style="display: inline-block; width: 100px; border-top: 1px solid black; border-bottom: 1px solid black; background: rgba(229, 229, 229, 0.5); padding: 0;">기간</span>
                           </th>
                        </tr>
                        <tr>
                           <td style="text-align: center;"><span
                              style="display: inline-block; width: 100px; height: 60px; padding-top: 35px;">할인쿠폰</span>
                              <span
                              style="display: inline-block; width: 100px; height: 60px; color: red; font-weight: bold; font-size: 18px; padding-top: 35px;">10,000원↓</span>
                              <span
                              style="display: inline-block; width: 100px; height: 60px; vertical-align: middle; margin-top: 5px; padding-top: 34px;">~
                                 11/31까지<br>(11월한정)
                           </span></td>
                        </tr>
                        <tr>
                           <td colspan=2><input type="button" value="쿠폰 받기"
                              style="font-size: 15px; font-weight: bold; color: white; background: rgba(43, 47, 58); width: 105px; height: 40px; margin: 8px 95px;"
                              onclick=""></td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
            <div id="nomember-login">
               <table border="0" style="width: 100%; height: 50px;">
                  <tr>
                     <td
                        style="font-size: 15px; font-weight: bolder; text-align: center; color: red;">비회원
                        주문조회</td>
                     <td
                        style="font-size: 12px; font-weight: 500; text-align: center;">주문자명</td>
                     <td><input type="text" size="7"></td>
                     <td
                        style="font-size: 12px; font-weight: 500; text-align: center;">핸드폰번호</td>
                     <td><input type="text" size="7" placeholder="'-'빼고입력"></td>
                     <td
                        style="font-size: 12px; font-weight: 500; text-align: center;">주문비밀번호</td>
                     <td><input type="text" size="7"></td>
                     <td
                        style="font-size: 10px; font-weight: 500; text-align: center; text-decoration: underline;"><input
                        type="button" value="확인"></td>
                     <td
                        style="font-size: 10px; font-weight: 500; text-align: center; text-decoration: underline;"><a
                        href="#">비밀번호찾기</a></td>
                  </tr>
               </table>
            </div>
         </div>
      </div>
      <!--//컨텐츠-->
        <div class="footer">
           <div class="container">
			<div id="footer" style="width: 1210px;">
				<ul>
					<li><a href="#" style="color: black;">사이트 도움말</a></li>
					<li><a href="#" style="color: black;">사이트 이용약관</a></li>
					<li><a href="#" style="color: black;">사이트 운영규칙</a></li>
					<li><a href="#" style="color: black;"><strong>개인정보취급방침</strong></a></li>
					<li><a href="#" style="color: black;">책임의 한계와 법적고지</a></li>
					<li><a href="#" style="color: black;">게시중단요청서비스</a></li>
					<li><a href="map.do" style="color: black;">찾아오시는 길</a></li>

				</ul>
			</div>
			<div class="footer-section footer-section-first">
						<div class="footer-section-inner">
							<h3  style="color: black;">고객센터</h3>
							<address>
								<ul>
									<li>Tel : <strong>4444-1111</strong> (평일 09:00~18:00)</li>
									<li>가즈아멤버 &amp; VVIP : <strong>4567-7823</strong> (365일 09:00~18:00)</li>
									<li>서울시 종로구 돈화문로 26 5층</li>
									<li>Fax : 02-741-0000<span class="bar"></span>Mail : information@corp.gazua.co.kr</li>
								</ul>
							</address>
						</div>
					</div>
            <div class="footer-section ebay_info">
                <div class="footer-section-inner">
                    <h3 style="color: black;">(주)가즈아쇼핑</h3>
                <ul>
                        <li>서울시 종로구 돈화문로 <span class="alpha-num">0411</span> (5층 강의실)</li>
                        <li>대표이사 : Gazua-Michael</li>
                        <li>사업자등록번호 : <span class="alpha-num">123-00-54321</span></li>
                        <li>통신판매업신고 : 종로 <span class="alpha-num">10630</span>호 		
                        </li>
                </ul>
                </div>
            </div>
   <div class="footer-section">
                <div class="footer-section-inner">
                    <h3>전자금융 분쟁처리</h3>
                    <ul>
                        <li class="inline alpha-num">Tel : 1234-4321</li>
                        <li class="inline alpha-num">Fax : 02-456-7535</li>
                        <li class="alpha-num">Mail : readyacion@corp.gazua.co.kr</li>
                        <li class="footer-links">
                            <a class="footer-link" href="#"style="color: black;">분쟁처리절차&gt;</a></li>
                    </ul>
                </div>
    </div>
            <div class="warning" style="clear: both;border-top: 1px solid rgba(0,0,0,0.2);padding-top: 5px;">
                ㈜ 가즈아 사이트의 상품/판매자/쇼핑 정보, 콘텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등에 의하여 엄격히 금지됩니다. 콘텐츠산업 진흥법에 따른 표시 액션은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 액션은 상품 · 거래정보 및 거래에 대하여 책임을 지지 않습니다.
            </div>
            <address style="margin-top: 10px;">
                Copyright&copy;gazua.co.kr All Right Redreved
            </address>
            
          
            </div>
        </div>
        <!--//풋터-->
    <!--//랩-->
</body>
</html>
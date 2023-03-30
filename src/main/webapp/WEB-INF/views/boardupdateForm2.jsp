<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.project.board2.vo.Board2VO"%>
<%@ page import="com.project.board2.dao.Board2DAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<html lang="ko">
<title>수정하기</title>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<!-- <bonobono-fixed> -->
  <link href="<c:url value="/resources/css/fixed.css" />" rel="stylesheet"/>
  <link href="<c:url value="/resources/css/category.css" />" rel="stylesheet"/>
  <script src="<c:url value="/js/jquery.easing.1.3.js" />"></script>
      <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
<!-- </bonobono-fixed> -->
  <link href="<c:url value="/resources/css/board-write.css" />" rel="stylesheet"/>
</head>
<body>

<%

		//로그인한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String user_id= null;

		if (session.getAttribute("user_id") != null) {
			user_id = (String) session.getAttribute("user_id");
		} 

		//로그인 안한 경우

		if(user_id == null) {

			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'loginForm.do'");
			script.println("</script>");

		}

		int board_ID = 0;
		if (request.getParameter("board_ID") != null) {
			board_ID = Integer.parseInt(request.getParameter("board_ID"));
		}

		if (board_ID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'board2.do'");
			script.println("</script>");
		}

		Board2VO board = new Board2DAO().getBoard(board_ID);
		if (!user_id.equals(board.getUser_id())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'board2.do'");
			script.println("</script>");				
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
                <!--//전체 카테고리-->
            </div>
        </div>
        <!--//헤더-->
        <div class="contents1">
            <div class="container">
               <div id="write-font">
                   수정하기
               </div>
                  <div class="container">
      <div class="row">
      <div class="col-lg-10">
         <form method="post" action="update2.do?board_ID=<%= board_ID %>">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;  margin-left: 150px; margin-top: 20px;">
               <thead>
                  <tr>
                     <th colspan="2" style="background-color: #2b2f3a;color: white; text-align: center;height: 40px; width: 500px;">게시판 글 수정</th>
                  </tr>
               </thead>
               <tbody>
                     <tr>
                     <th colspan="2" style="padding-left: 5px;padding-right: 5px;padding-bottom: 3px;padding-top: 3px; background-color: #2b2f3a;color: white; text-align: center;height: 40px; width: 900px;">
                     <input type="text" class="form-control" placeholder="글 제목" name="board_Title" maxlength="50"  style="width: inherit;height: 20px;padding: 5px; value="<%= board.getBoard_Title() %>"/>
                     </th>
                  </tr>
                  <tr>
                     <th colspan="2" style="padding-left: 2px;padding-right: 2px; background-color: #2b2f3a;color: white; text-align: center;height: 40px; width: 900px;opacity: 0.6;">
                     <textarea class="form-control" placeholder="글 내용" name="board_Content" maxlength="2048" style="height: 380px;width: 900px; padding: 5px;margin: 5px 0px;opacity: ">
                     </textarea>
                  </tr>
                  <!-- <tr>
                     <th colspan="2" style="padding-left: 2px;padding-right: 2px; background-color: #2b2f3a;color: white; text-align: center;height: 40px; width: 900px;opacity: 0.6;">
                         <input type="file" class="form-control" placeholder="파일첨부" name="bbsFile" maxlength="50" style="float: left; margin-left: 4px;"/></th>
                  </tr> -->
               </tbody>
            </table>   
            <input type="submit" class="btn btn-dark pull-right" value="수정하기" style="font-size: 16px;font-weight: bold;width: 90px;height: 30px;text-align: center;margin-left: 987px;color: white;background: #2b2f3a;border: none;"/>
         </form>
      </div>
   </div>
   </div>
            </div>
            
        </div>
        <!--//컨텐츠-->
          <div class="footer" style="background: rgba(249,249,249);font-size:10px;">
           <div class="container" style="font-size:10px;">
            <div id="footer">
                <ul>
                    <li><a href="#"style="color: black;">사이트 도움말</a></li>
                    <li><a href="#"style="color: black;">사이트 이용약관</a></li>
                    <li><a href="#"style="color: black;">사이트 운영규칙</a></li>
                    <li><a href="#"style="color: black;"><strong>개인정보취급방침</strong></a></li>
                    <li><a href="#"style="color: black;">책임의 한계와 법적고지</a></li>
                    <li><a href="#"style="color: black;">게시중단요청서비스</a></li>
                    <li><a href="map.do"style="color: black;">찾아오시는 길</a></li>
                    
                </ul>
            </div>
            <div class="footer-section footer-section-first">
						<div class="footer-section-inner">
							<h3  style="color: black;font-size: 19px;">고객센터</h3>
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
                    <h3 style="color: black;font-size: 19px;">(주)가즈아쇼핑</h3>
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
                    <h3 style="font-size: 19px;">전자금융 분쟁처리</h3>
                    <ul>
                        <li class="inline alpha-num">Tel : 1234-4321</li>
                        <li class="inline alpha-num">Fax : 02-456-7535</li>
                        <li class="alpha-num">Mail : readyaction@corp.gazua.co.kr</a></li>
                        <li class="footer-links">
                            <a class="footer-link" href="#"style="color: black;">분쟁처리절차&gt;</a></li>
                    </ul>
                </div>
    </div>
            <div class="warning" style="clear: both;border-top: 1px solid rgba(0,0,0,0.2);padding-top: 5px;">
                ㈜ 가즈아 사이트의 상품/판매자/쇼핑 정보, 콘텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등에 의하여 엄격히 금지됩니다. 콘텐츠산업 진흥법에 따른 표시 액션은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 액션은 상품 · 거래정보 및 거래에 대하여 책임을 지지 않습니다.
            </div>
            <address style="margin-top: 10px;font-size:15px">
                Copyright&copy;gazua.co.kr All Right Redreved
            </address>
            
           
            </div>
        </div>
        <!--//풋터-->
    </div>
    <!--//랩-->
</body>
</html>
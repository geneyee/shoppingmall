<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<html lang="ko">
<title>메인 화면</title>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<!-- <bonobono-fixed> -->
  <link href="<c:url value="/resources/css/fixed.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/category.css" />" rel="stylesheet">
  <script src="<c:url value="/js/jquery.easing.1.3.js" />"></script>
  <script src="<c:url value="/js/jquery.eislideshow.js" />"></script>
<!-- </bonobono-fixed> -->
  <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/main-c-hp.css" />"rel="stylesheet">
<link href="<c:url value="/resources/css/main-c-item_list_wrap.css" />"rel="stylesheet">
  <link href="<c:url value="/resources/css/main-banner-img.css" />" rel="stylesheet">
  <link href="<c:url value="/resources/css/item_list_wrap.css" />" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
<!-- added css -->
<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script>
<!-- 챗봇 -->
<script language="JavaScript">
function notice_getCookie( name ){
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
			var y = (x+nameOfCookie.length);
			if ( document.cookie.substring( x, y ) == nameOfCookie ) {
					if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
							endOfCookie = document.cookie.length;
					return unescape( document.cookie.substring( y, endOfCookie ) );
			}
			x = document.cookie.indexOf( " ", x ) + 1;
			if ( x == 0 )
					break;
	}
	return "";
}
if ( notice_getCookie( "Notice" ) != "done" )
{
        window.open('popup.do','','width=620,height=480'); // 팝업윈도우의 경로와 크기를 설정 하세요
}
</script>
<!-- 팝업창 -->
<script type="text/javascript">
	 var stmnLEFT = 25; // 오른쪽 여백 
	 var stmnGAP1 = 0; // 위쪽 여백 
	 var stmnGAP2 = 210; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
	 var stmnBASE = 210; // 스크롤 시작위치 
	 var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
	 var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
	 var stmnTimer; 
 
	 function RefreshStaticMenu() { 
	  	var stmnStartPoint, stmnEndPoint; 
		  stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
		  stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
		 	 if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
		  		if (stmnStartPoint != stmnEndPoint) { 
		   stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
		   document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
		   stmnRefreshTimer = stmnScrollSpeed; 
		   }
	  stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
	  } 
	 function InitializeStaticMenu() {
	  document.getElementById('STATICMENU').style.left = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
	  document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
	  RefreshStaticMenu();
  }
</script>
<a href="#" class="go-top" style="margin:0px 10px 78px 0px;">▲</a>
<script>
    // 태그가 전부 그려진 후에 실행 할 수 있도록 한다.
    $(document).ready(function () {
        resize();
    });
    // 화면 크기가 변경될 때 마다 동적으로 사이즈를 조정한다.
    $(window).on('resize', function () {
        resize();
    });

    function resize() {
        if (window.innerHeight > $('html').height()) {
            $('.footer').css('position', 'absolute');
            $('.footer').css('bottom', '0');
        } else {
            $('.footer').css('position', 'relative');
        }
    }
</script>
<!-- footer 고정 -->
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
<style type="text/css">
#STATICMENU { margin: 0pt; padding: 0pt;  position:absolute; right: 0px; top: 0px;}
</style>
</head>
<body onload="InitializeStaticMenu();">
<div id="frogue-container" class="position-left-bottom" data-chatbot="5a75197c-d443-4857-a854-532769d9aedf" data-user="사용자ID" data-init-key="value">
</div>
   <div id="STATICMENU" style=" top: 300px;width: 200px;height: 350px;">
   <div class="image-container">
        <img src="resources/img/side_sale2.jpg" alt="">
    </div>
</div>
<% 
 String user_id = null;
if(session.getAttribute("user_id") != null){
	user_id = (String) session.getAttribute("user_id");
}
%>
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
    	                <span>&emsp;&emsp;&emsp;&emsp;&emsp;</span>
                        <div id="adminMain">
                        <a href="adminMain.do" title="관리자페이지">상품관리</a>
                        </div>
                        <div id="gesipan">
                        <a href="board2.do"title="게시판 이동">공지사항</a>
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
		<!-- 헤더 -->
		<div class="banner">
            <div class="container">
            	<div id="ei-slider" class="ei-slider"style="width:1000px;margin-top:15px;">
                    <ul class="ei-slider-large">
                  <li>
                            <img src="resources/img/banner1.jpg" alt="banner1"/>
                            <div class="ei-title">
                                <!-- <h2>Passionate</h2>
                                <h3>Seeker</h3> -->
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/banner2.jpg" alt="banner2" />
                            <div class="ei-title">
                               <!--  <h2>Creative</h2>
                                <h3>Duet</h3> -->
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/banner3.jpg" alt="banner3" />
                            <div class="ei-title">
                               <!--  <h2>Friendly</h2>
                                <h3>Devil</h3> -->
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/banner4.jpg" alt="banner4"/>
                            <div class="ei-title">
                                <!-- <h2>Tranquilent</h2>
                                <h3>Sexy</h3> -->
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/banner5.jpg" alt="banner5"/>
                            <div class="ei-title">
                               <!--  <h2>Insecure</h2>
                                <h3>Hussler</h3> -->
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/banner6.jpg" alt="banner6"/>
                            <div class="ei-title">
                                <!-- <h2>Loving</h2>
                                <h3>Rebel</h3> -->
                            </div>
                        </li>
                        <li>
                            <img src="resources/img/banner7.jpg" alt="banner7"/>
                            <div class="ei-title">
                                <!-- <h2>Crazy</h2>
                                <h3>Friend</h3> -->
                            </div>
                        </li>
                    </ul><!-- ei-slider-large -->
                    <ul class="ei-slider-thumbs">
                        <li class="ei-slider-element">Current</li>
                        <li><a href="#">Slide 6</a><img src="resources/img/banner1s.jpg" alt="thumb06" /></li>
                        <li><a href="#">Slide 1</a><img src="resources/img/banner2s.jpg" alt="thumb01" /></li>
                        <li><a href="#">Slide 2</a><img src="resources/img/banner3s.jpg" alt="thumb02" /></li>
                        <li><a href="#">Slide 3</a><img src="resources/img/banner4s.jpg" alt="thumb03" /></li>
                        <li><a href="#">Slide 4</a><img src="resources/img/banner5s.jpg" alt="thumb04" /></li>
                        <li><a href="#">Slide 5</a><img src="resources/img/banner6s.jpg" alt="thumb05" /></li>
                        <li><a href="#">Slide 7</a><img src="resources/img/banner7s.jpg" alt="thumb07" /></li>
                    </ul><!-- ei-slider-thumbs -->
                </div><!-- ei-slider -->
            </div>
        </div>
       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
       <script src="<c:url value="/js/jquery.eislideshow.js" />"></script>
        <script type="text/javascript">
            $(function() {
                $('#ei-slider').eislideshow({
               animation         : 'center',
               autoplay         : true,
               slideshow_interval   : 2000,
               titlesFactor      : 0
                });
            });
        </script>
       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
       <script src="<c:url value="/js/jquery.eislideshow.js" />"></script>
        <script type="text/javascript">
            $(function() {
                $('#ei-slider').eislideshow({
               animation         : 'center',
               autoplay         : true,
               slideshow_interval   : 2000,
               titlesFactor      : 0
                });
            });
        </script>
        <!--//배너-->
        <div class="contents1">
            <div class="container">
            <div class="item_list_type1" style="padding-top: 20px; padding-left: 100px;">
               
                     <div class="item_list_wrap" style="float: none; top: 0px; left: 0px; width: 980px;">
                        
                        <ul class="item_list" >
                        
                        <li><div class="inner">
                        <a onclick="javascript:pvprofiler.sendEvt('click', '100000502', 'Link',{'ASN':0, 'itemno':'B749001762'});" data-montelena-acode="100000502" class="img_box h_type3" href="setProduct.do">
                        <img class="thumb lazy" src="resources/img/co1.jpg"  alt="" title="" style="display: inline;">
                        <span class="title">미니멀 울 트렌치 코트</span></a><div class="info"><em class="sale">
                        <strong>5%</strong><span>할인</span></em><span class="price"><strong>142,500<span>원</span></strong><del>150,000원</del></span><span class="tags"><span class="tag">
                        최대 <strong class="tag_strong">2.3% 적립</strong></span></span>
                        <span class="option"><span class="buy">구매 <strong>79</strong></span></span></div></div></li><li>
                        
                        
                     
                        <li><div class="inner">
                        <a onclick="javascript:pvprofiler.sendEvt('click', '100000502', 'Link',{'ASN':1, 'itemno':'B744683341'});" data-montelena-acode="100000502" class="img_box h_type3" >
                        <img class="thumb lazy" src="resources/img/1_2.jpg" alt="" title="" style="display: inline;">
                        <span class="title">[카드10%] 에버랜드 할로윈 패밀리 세트권</span></a>
                        <div class="info">
                        <em class="sale">
                        <strong>30%</strong><span>할인</span></em><span class="price"><strong>70,000<span>원</span></strong><del>100,000원</del></span><span class="tags"><span class="tag">
                        	 최대 <strong class="tag_strong">2.3% 적립</strong></span></span>
                        <span class="option"><span class="buy">구매 <strong>99</strong></span></span></div></div></li><li>
                        
                        <div class="inner"><span class="sm_akill bt_smileclub">스마일클럽</span>
                        <a onclick="javascript:pvprofiler.sendEvt('click', '100000502', 'Link',{'ASN':2, 'itemno':'B457779730'});" data-montelena-acode="100000502" class="img_box h_type3" >
                        <img class="thumb lazy" src="resources/img/1_3.jpg" >
                        <span class="title">NEW피지오겔 스페셜 패키지 </span></a>
                        <div class="info"><em class="sale"><strong>15%</strong><span>할인</span></em><span class="price"><strong>59,410<span>원</span></strong><del>69,900원</del></span><span class="tags"><span class="tag"> 최대 <strong class="tag_strong">2.3% 적립</strong></span><span class="tag"><span class="ico_bar"></span>무료배송</span></span><span class="option"><span class="buy">구매 <strong>302</strong></span></span></div></div></li></ul>
   
   
   
   
                     <ul class="item_list"><li><div class="inner"><span class="sm_akill bt_smileclub">스마일클럽</span>
                     <a onclick="javascript:pvprofiler.sendEvt('click', '100000502', 'Link',{'ASN':3, 'itemno':'B752310897'});" data-montelena-acode="100000502" class="img_box h_type3"  alt="" title="" style="display: inline;">
                     <img class="thumb lazy" src="resources/img/1_4.jpg" >
                     <span class="title">위니아딤채 뚜껑형 김치냉장고</span></a><div class="info"><em class="sale"><strong>10%</strong><span>할인</span></em><span class="price"><strong>639,000<span>원</span></strong><del>710,000원</del></span><span class="tags"><span class="tag">최대 <strong class="tag_strong">2.3% 적립</strong></span><span class="tag"><span class="ico_bar"></span>무료배송</span></span><span class="option"><span class="buy">구매 <strong>1</strong></span></span></div></div></li><li>
                     
                     <div class="inner"><span class="sm_akill bt_smileclub">스마일클럽</span><a onclick="javascript:pvprofiler.sendEvt('click', '100000502', 'Link',{'ASN':4, 'itemno':'B672978705'});" data-montelena-acode="100000502" class="img_box h_type3" >
                     <img class="thumb lazy" src="resources/img/1_5.jpg" alt="" title="" style="display: inline;">
                     <span class="title">특등급 이상의 완전미 고시히카리 쌀 10KG</span></a><div class="info"><em class="sale"><strong>20%</strong><span>할인</span></em><span class="price"><strong>35,900<span>원</span></strong><del>44,900원</del></span><span class="tags"><span class="tag">최대 <strong class="tag_strong">2.3% 적립</strong></span><span class="tag"><span class="ico_bar"></span>무료배송</span></span><span class="option"><span class="buy">구매 <strong>997</strong></span></span></div></div></li><li>
                     
                     <div class="inner"><span class="sm_akill bt_smileclub">스마일클럽</span><a onclick="javascript:pvprofiler.sendEvt('click', '100000502', 'Link',{'ASN':5, 'itemno':'B214749086'});" data-montelena-acode="100000502" class="img_box h_type3" >
                     <img class="thumb lazy" src="resources/img/1_6.jpg"  alt="" title="" style="display: inline;">
                     <span class="title">BYC 외 브랜드 남녀 내복상하세트</span></a><div class="info"><em class="sale"><strong>70%</strong><span>할인</span></em><span class="price"><strong>9,900<span>원</span></strong><del>33,000원</del></span><span class="tags"><span class="tag"> 최대 <strong class="tag_strong">2.3% 적립</strong></span><span class="tag"><span class="ico_bar"></span>무료배송</span></span><span class="option"><span class="buy">구매 <strong>24,124</strong></span></span></div></div></li></ul></div>
                  
               
               </div>
            </div>
        </div>
      <div class="contents2">
      <div class="container">
      
      <div class="hotspot" style="margin-left: 100px;">

            <div class="hotspot_tit" style="
    margin-right: 100px;
">
               <h3>파트너 서비스</h3>
               
            </div>
            <ul class="hotspot_bnr_lst" style="
    margin-top: 50px;
">



               <li style="z-index: 0;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':1, 'serviceName':'쿠폰포인트'});" data-montelena-acode="100000243"  target="_blank"><img src=resources/img/2_1.jpg alt="쿠폰포인트"></a></li>
               <li style="z-index: 0;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':2, 'serviceName':'롯데백화점'});" data-montelena-acode="100000243"  target="_blank"><img src="resources/img/2_2.jpg" alt="롯데백화점"></a></li>
               <li style="z-index: 0;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':3, 'serviceName':'당일배송'});" data-montelena-acode="100000243"  target="_blank"><img src="resources/img/2_3.jpg" alt="당일배송"></a></li>
               <li style="z-index: 1;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':4, 'serviceName':'스마일클럽'});" data-montelena-acode="100000243"  target="_blank"><img src="resources/img/2_4.jpg" alt="스마일클럽"></a><span style="z-index: 1;">현명한 쇼핑 습관 스마일클럽</span></li>
               <li style="z-index: 0;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':5, 'serviceName':'스마일카드'});" data-montelena-acode="100000243"  target="_blank"><img src="resources/img/2_5.jpg" alt="스마일카드"></a></li>
               <li style="z-index: 0;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':6, 'serviceName':'스마일배송'});" data-montelena-acode="100000243"  target="_blank"><img src="resources/img/2_6.jpg" alt="스마일배송"></a></li>
               <li style="z-index: 0;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':7, 'serviceName':'옥션티켓'});" data-montelena-acode="100000243"  target="_blank"><img src="resources/img/2_7.jpg" alt="옥션티켓"></a></li>
               <li style="z-index: 0;"><a onclick="javascript:pvprofiler.sendEvt('click','100000243','utility', {'ASN':8, 'serviceName':'중고장터'});" data-montelena-acode="100000243"  target="_blank"><img src="resources/img/2_8.jpg" alt="중고장터"></a></li>
            </ul>



            <div class="hotspot_brand">
               <ul class="hotspot_brand_lst">

                  <li class="on"><a onclick="javascript:pvprofiler.sendEvt('click','100001837','link',{'category':'스마일배송'});"class="brand_tab type1" target="_blank" data-montelena-acode="100001837">가즈아배송</a>
                     <div class="brand_cont bg1">
                        <ul class="brand_bnr_lst">
                           <li class="bnr_big"><a onclick="javascript:pvprofiler.sendEvt('click','100001838','link',{'category':'스마일배송'});"  target="_blank" data-montelena-acode="100001838"><img src="resources/img/3_1.jpg" alt="1101 BSD 스마일배송 메인" class="bnr"></a></li>
                           <li class="bnr_s1"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'스마일배송', 'item_no':'B751623305', 'asn':1});"  target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_1.jpg" alt="1101 BSD 스마일배송 1" class="bnr"></a></li>
                           <li class="bnr_s2"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'스마일배송', 'item_no':'B637069431', 'asn':2});"  target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_2.jpg" alt="1101 BSD 스마일배송 2" class="bnr"></a></li>
                           <li class="bnr_s3"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'스마일배송', 'item_no':'B669258729', 'asn':3});"  target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_3.jpg" alt="1101 BSD 스마일배송 3" class="bnr"></a></li>
                           <li class="bnr_s4"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'스마일배송', 'item_no':'B441916714', 'asn':4});"  target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_4.jpg" alt="1101 BSD 스마일배송 4" class="bnr"></a></li>
                        </ul>
                     </div></li>
                  <li><a onclick="javascript:pvprofiler.sendEvt('click','100001837','link',{'category':'롯데백화점'});"class="brand_tab type2" target="_blank" data-montelena-acode="100001837">가즈아 브랜드샵</a>
                     <div class="brand_cont bg2">
                        <ul class="brand_bnr_lst">
                           <li class="bnr_big"><a onclick="javascript:pvprofiler.sendEvt('click','100001838','link',{'category':'롯데백화점'});" target="_blank" data-montelena-acode="100001838"><img src="resources/img/gazua_G.jpg" alt="롯데백화점빅배너" class="bnr"></a></li>
                           <li class="bnr_s1"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'롯데백화점', 'item_no':'B274329890', 'asn':1});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_5.jpg" alt="롯데백화점우상단" class="bnr"></a></li>
                           <li class="bnr_s2"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'롯데백화점', 'item_no':'B527271339', 'asn':2});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_6.jpg" alt="롯데백화점좌상단" class="bnr"></a></li>
                           <li class="bnr_s3"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'롯데백화점', 'item_no':'B760890884', 'asn':3});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_7.jpg" alt="롯데백화점좌하단" class="bnr"></a></li>
                           <li class="bnr_s4"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'롯데백화점', 'item_no':'B712008916', 'asn':4});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_8.jpg" alt="롯데백화점우하단" class="bnr"></a></li>
                        </ul>
                     </div></li>
                  <li><a onclick="javascript:pvprofiler.sendEvt('click','100001837','link',{'category':'CJmall'});" class="brand_tab type3" target="_blank" data-montelena-acode="100001837">가즈아 몰</a>
                     <div class="brand_cont bg3">
                        <ul class="brand_bnr_lst">
                           <li class="bnr_big"><a onclick="javascript:pvprofiler.sendEvt('click','100001838','link',{'category':'CJmall'});" target="_blank" data-montelena-acode="100001838"><img src="resources/img/gazua_mall.jpg" alt="CJmall 메인배너" class="bnr"></a></li>
                           <li class="bnr_s1"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'CJmall', 'item_no':'B541973429', 'asn':1});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_9.jpg" alt="CJmall 서브배너1" class="bnr"></a></li>
                           <li class="bnr_s2"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'CJmall', 'item_no':'B750313916', 'asn':2});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_10.jpg" alt="CJmall 서브배너2" class="bnr"></a></li>
                           <li class="bnr_s3"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'CJmall', 'item_no':'B500546492', 'asn':3});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_11.jpg" alt="CJmall 서브배너3" class="bnr"></a></li>
                           <li class="bnr_s4"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'CJmall', 'item_no':'B541348666', 'asn':4});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_12.jpg" alt="CJmall 서브배너4" class="bnr"></a></li>
                        </ul>
                     </div></li>
                  <li><a onclick="javascript:pvprofiler.sendEvt('click','100001837','link',{'category':'당일배송'});"  class="brand_tab type4" target="_blank" data-montelena-acode="100001837">당일배송</a>
                     <div class="brand_cont bg4">
                        <ul class="brand_bnr_lst">
                           <li class="bnr_big"><a onclick="javascript:pvprofiler.sendEvt('click','100001838','link',{'category':'당일배송'});" ><img src="resources/img/gazua_home.jpg" alt="당일배송 빅매너 (A.마트)" class="bnr"></a></li>
                           <li class="bnr_s1"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'당일배송', 'item_no':'B674702537', 'asn':1});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_13.jpg" alt="당일배송우상단 1." class="bnr"></a></li>
                           <li class="bnr_s2"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'당일배송', 'item_no':'B275426841', 'asn':2});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_14.jpg" alt="당일배송좌하단 2." class="bnr"></a></li>
                           <li class="bnr_s3"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'당일배송', 'item_no':'B585520342', 'asn':3});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_15.jpg" alt="당일배송 좌 배너3." class="bnr"></a></li>
                           <li class="bnr_s4"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'당일배송', 'item_no':'B340507698', 'asn':4});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_16.jpg" alt="당일배송우하단 4." class="bnr"></a></li>
                        </ul>
                     </div></li>
                  <li><a onclick="javascript:pvprofiler.sendEvt('click','100001837','link',{'category':'여행'});" class="brand_tab type5" target="_blank" data-montelena-acode="100001837">여행</a>
                     <div class="brand_cont bg5">
                        <ul class="brand_bnr_lst">
                           <li class="bnr_big"><a onclick="javascript:pvprofiler.sendEvt('click','100001838','link',{'category':'여행'});"  target="_blank" data-montelena-acode="100001838"><img src="resources/img/gazua_big.jpg" alt="[숙박] 국내서브" class="bnr"></a></li>
                           <li class="bnr_s1"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'여행', 'item_no':'B581081208', 'asn':1});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_17.jpg" alt="[숙박] 국내서브" class="bnr"></a></li>
                           <li class="bnr_s2"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'여행', 'item_no':'678293821 ', 'asn':2});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_18.jpg" alt="[숙박] 국내서브" class="bnr"></a></li>
                           <li class="bnr_s3"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'여행', 'item_no':'B581052458', 'asn':3});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_19.jpg" alt="[숙박] 국내서브" class="bnr"></a></li>
                           <li class="bnr_s4"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'여행', 'item_no':'B750451441', 'asn':4});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_20.jpg" alt="[숙박] 국내서브" class="bnr"></a></li>
                        </ul>
                     </div></li>
                  <li><a onclick="javascript:pvprofiler.sendEvt('click','100001837','link',{'category':'해외직구'});" class="brand_tab type6" target="_blank" data-montelena-acode="100001837">해외직구</a>
                     <div class="brand_cont bg6">
                        <ul class="brand_bnr_lst">
                           <li class="bnr_big"><a onclick="javascript:pvprofiler.sendEvt('click','100001838','link',{'category':'해외직구'});"  target="_blank" data-montelena-acode="100001838"><img src="resources/img/gazua_gic.jpg" alt="11/5전문관" class="bnr"></a></li>
                           <li class="bnr_s1"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'해외직구', 'item_no':'B757879105', 'asn':1});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_21.jpg" alt="11/5전문관" class="bnr"></a></li>
                           <li class="bnr_s2"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'해외직구', 'item_no':'B723454872', 'asn':2});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_22.jpg" alt="11/5전문관" class="bnr"></a></li>
                           <li class="bnr_s3"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'해외직구', 'item_no':'B757510776', 'asn':3});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_23.jpg" alt="11/5전문관" class="bnr"></a></li>
                           <li class="bnr_s4"><a onclick="javascript:pvprofiler.sendEvt('click','100001839','item',{'category':'해외직구', 'item_no':'755416321 ', 'asn':4});" target="_blank" data-montelena-acode="100001839"><img src="resources/img/5_24.jpg" alt="11/5전문관" class="bnr"></a></li>
                        </ul>
                     </div></li>
               </ul>
               <a class="prev" href="javascript:;">이전</a> <a class="next" href="javascript:;">다음</a>

            </div>

         </div>

         




      </div>
   </div>
   <div class="contents3" style="
    margin-top: 100px;
">
      <div class="container">

<!-- 추천 기획전 -->
         <div class="hp_thema" style="margin-top: 0px;">
            <div class="event_tit" style="
    margin-top: 20px;
    margin-bottom: 20px;
">추천 기획전</div>
            <!-- //딜카드 -->
            <div class="item_list_type1">



               <div id="touchSlider_thema_1" class="touchSlider-box">
                  <div class="touchSlider" style="width: 980px;overflow: visible;margin-left: 100px;" id="themeList">
                     <ul style="float: none; display: block; top: 0px; left: 0px; width: 990px;">
                        <li><a onclick="javascript:pvprofiler.sendEvt('click','100002152',{'asn':1});" target="_blank" data-montelena-acode="100002152" data-montelena-asn="1"> <img src="resources/img/4_1.jpg" alt="항공캐시백"></a></li>
                        <li><a onclick="javascript:pvprofiler.sendEvt('click','100002152',{'asn':2});" target="_blank" data-montelena-acode="100002152" data-montelena-asn="2"> <img src="resources/img/4_2.jpg" alt="여행혜택"></a></li>
                        <li><a onclick="javascript:pvprofiler.sendEvt('click','100002152',{'asn':3});" target="_blank" data-montelena-acode="100002152" data-montelena-asn="3"> <img src="resources/img/4_3.jpg" alt="빠른직구"></a></li>
                     </ul>
                     <ul style="float: none; display: block; top: 0px; left: 990px; width: 990px;">
                        <li><a onclick="javascript:pvprofiler.sendEvt('click','100002152',{'asn':4});" target="_blank" data-montelena-acode="100002152" data-montelena-asn="4"> <img src="resources/img/4_4.jpg" alt="키즈 겨울나기 F/W 프리뷰"></a></li>
                        <li><a onclick="javascript:pvprofiler.sendEvt('click','100002152',{'asn':5});" target="_blank" data-montelena-acode="100002152" data-montelena-asn="5"> <img src="resources/img/4_5.jpg" alt="시공 브랜드위크"></a></li>
                        <li><a onclick="javascript:pvprofiler.sendEvt('click','100002152',{'asn':6});" target="_blank" data-montelena-acode="100002152" data-montelena-asn="6"> <img src="resources/img/4_6.jpg" alt="쿠쿠 브랜드위크"></a></li>
                     </ul>
                  </div>



               </div>
            </div>
            <!-- //딜카드 -->
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
<%@page import="com.project.shop.dao.ShopDAO"%>
<%@page import="com.project.shop.vo.ShopVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.project.board1.vo.Board1VO"%>
<%@page import="com.project.board1.dao.Board1DAO"%>
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
  <link href="<c:url value="/resources/css/fixed.css" />" rel="stylesheet"></link>
  <link href="<c:url value="/resources/css/category.css" />" rel="stylesheet"></link>
  <script src="<c:url value="/js/jquery.easing.1.3.js" />"></script>
   <link href="<c:url value="/resources/css/board.css" />" rel="stylesheet"/>
<!-- </bonobono-fixed> -->
<link href="<c:url value="/resources/css/setproduct.css" />" rel="stylesheet"></link>
<link href="<c:url value="/resources/css/setproduct-menubar.css" />" rel="stylesheet"></link>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <link href="resources/css/sumogallery.css" rel="stylesheet" />
  <link href="resources/css/magnify.css" rel="stylesheet" type="text/css">
    <script src="<c:url value="/js/bootstrap.js" />"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet"/>
   <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
   <link href="https://fonts.googleapis.com/css?family=Varela+Round&display=swap" rel="stylesheet">
<!-- added css -->
<a href="#" class="go-top" style="z-index: 100;">▲</a>
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
<!-- top으로 올리는 삼각버튼 -->
<script>
$(document).ready(function(){
  var navOff = $( 'nav' ).offset();
  $(window).scroll(function(){
    if ($(document).scrollTop() > navOff.top) {
      $('nav').addClass('navfixed');
    }
    else {
      $('nav').removeClass('navfixed');
    }
  });
});
</script>
<!-- 탭 메뉴바 고정 -->
<script type="text/javascript">
$(document).ready(function () {

  // Intial Border Position
  var activePos = $('.tabs-header .active').position();

  // Change Position
  function changePos() {

    // Update Position
    activePos = $('.tabs-header .active').position();

    // Change Position & Width
    $('.border').stop().css({
      left: activePos.left,
      width: $('.tabs-header .active').width()
    });
  }

  changePos();

  // Intial Tab Height
  var tabHeight = $('.tab.active').height();

  // Animate Tab Height
  function animateTabHeight() {

    // Update Tab Height
    tabHeight = $('.tab.active').height();

    // Animate Height
    $('.tabs-content').stop().css({
      height: tabHeight + 'px'
    });
  }

  animateTabHeight();

  // Change Tab
  function changeTab() {
    var getTabId = $('.tabs-header .active a').attr('tab-id');

    // Remove Active State
    $('.tab').stop().fadeOut(300, function () {
      // Remove Class
      $(this).removeClass('active');
    }).hide();

    $('.tab[tab-id=' + getTabId + ']').stop().fadeIn(300, function () {
      // Add Class
      $(this).addClass('active');

      // Animate Height
      animateTabHeight();
    });
  }

  // Tabs
  $('.tabs-header a').on('click', function (e) {
    e.preventDefault();

    // Tab Id
    var tabId = $(this).attr('tab-id');

    // Remove Active State
    $('.tabs-header a').stop().parent().removeClass('active');

    // Add Active State
    $(this).stop().parent().addClass('active');

    changePos();

    // Update Current Itm
    tabCurrentItem = tabItems.filter('.active');

    // Remove Active State
    $('.tab').stop().fadeOut(300, function () {
      // Remove Class
      $(this).removeClass('active');
    }).hide();

    // Add Active State
    $('.tab[tab-id="' + tabId + '"]').stop().fadeIn(300, function () {
      // Add Class
      $(this).addClass('active');

      // Animate Height
      animateTabHeight();
    });
  });

  // Tab Items
  var tabItems = $('.tabs-header ul li');

  // Tab Current Item
  var tabCurrentItem = tabItems.filter('.active');

  // Next Button
  $('#next').on('click', function (e) {
    e.preventDefault();

    var nextItem = tabCurrentItem.next();

    tabCurrentItem.removeClass('active');

    if (nextItem.length) {
      tabCurrentItem = nextItem.addClass('active');
    } else {
      tabCurrentItem = tabItems.first().addClass('active');
    }

    changePos();
    changeTab();
  });

  // Prev Button
  $('#prev').on('click', function (e) {
    e.preventDefault();

    var prevItem = tabCurrentItem.prev();

    tabCurrentItem.removeClass('active');

    if (prevItem.length) {
      tabCurrentItem = prevItem.addClass('active');
    } else {
      tabCurrentItem = tabItems.last().addClass('active');
    }

    changePos();
    changeTab();
  });

  // Ripple
  $('[ripple]').on('click', function (e) {
    var rippleDiv = $('<div class="ripple" ></div>'),
      rippleOffset = $(this).offset(),
      rippleY = e.pageY - rippleOffset.top,
      rippleX = e.pageX - rippleOffset.left,
      ripple = $('.ripple');

    rippleDiv.css({
      top: rippleY - (ripple.height() / 2),
      left: rippleX - (ripple.width() / 2),
      background: $(this).attr("ripple-color")
    }).appendTo($(this));

    window.setTimeout(function () {
      rippleDiv.remove();
    }, 1500);
  });
});
</script>
<!-- 탭 메뉴 -->
<script>
      
        $(document).ready(function() {
         $("#content-slider").lightSlider({
                loop:true,
                 auto:true,
                keyPress:true
            });
            $('#image-gallery').lightSlider({
                gallery:true,
                item:1,
                thumbItem:9,
                slideMargin: 0,
                speed:500,
                auto:true,
                loop:true,
                onSliderLoad: function() {
                    $('#image-gallery').removeClass('cS-hidden');
                }  
            });
      });
    </script>
<!-- 사진 넘기기 -->
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
<!-- footer위치 고정 -->
<script>
var w=window; var d=document;
var nav=navigator.appName.indexOf("Microsoft");
var referrer=top.document.referrer
var D=new Date(); 
var Exp=new Date(); Ta=(D.getYear()<1900)?1903:3; Exp.setYear(D.getYear()+Ta);

function STBinit() {
   STBs=new String(); STBs=cookie("PopupMin");
   Ta=new Array(); if(STBs!=null){Ta=STBs.split("&");}
   STBa=new Array(); 
   for(x in Ta){ Tb=new Array();Tb=Ta[x].split(":");STBa[Tb[0]]=Tb[1];}
}

function SetC(n){ if(typeof(STBa)!="object") STBinit(); d.write((STBa[n]==1)?"<tr id=\""+n+"\" style=\"display:none\">":"<tr id=\""+n+"\">"); }

function STB(n){STBs=new String();STBa[n]=(STBa[n]==1)?0:1;
   Exp=new Date(); Ta=1; Ta+=(D.getYear()<1900)?1900:0; Exp.setYear(D.getYear()+Ta);
   for(id in STBa){STBs+=(STBa[id]==1)?"&"+id+":1":"";}
      d.cookie="PopupMin="+escape(STBs.substr(1))+"; expires="+Exp.toGMTString();
   if(nav>=0){Ta=eval(n).style.display;
   switch(Ta) {
      case "block": eval(n).style.display = "none"; break;
      case "": eval(n).style.display = "none"; break;
      default : eval(n).style.display = "block"; }}
   else{d.location.reload();}
}

function cookie(n){Ta=d.cookie.indexOf(n+"=");Tb=Ta+n.length+1;
   if((Ta==-1)||((!Ta)&& (n != d.cookie.substring(0,n.length)))) return null;
      Tc=d.cookie.indexOf(";",Tb);if(Tc==-1)Tc=d.cookie.length;
   return unescape(d.cookie.substring(Tb,Tc));}

function cookie_s(n,v,e,r){ 
   d.cookie=escape(n)+"="+escape(v)+"; expires="+e.toGMTString(); if(r)d.location.reload(); }
</script>
<!-- 레이어 메뉴 펼치기 -->
</head>
<body>
<% 
 String user_id = null;
if(session.getAttribute("user_id") != null){
   user_id = (String) session.getAttribute("user_id");
}

int pageNumber = 1; //기본 페이지 넘버
//페이지넘버값이 있을때
if (request.getParameter("pageNumber") != null) {
   pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}

ArrayList<ShopVO> bvo = new ShopDAO().Product_list();
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
      <div class="contents1">
       <div class="container">
         <div id="sangpum">
      <div id="sangpum_img">
         <div style="border:1px solid black;">
             <img src="resources/img/co3.jpg" alt="" class="magnify-image" data-magnify-src="resources/img/co2.jpg">
            </div>
                  <div id="sangpum_imgs">
   <img data-sgallery="group2" title="이미지 제목1" data-full="resources/img/coat1.jpg" data-thumb="resources/img/s-coat1.jpg" src="resources/img/s-coat1.jpg">
   <img data-sgallery="group2" title="이미지 제목1" data-full="resources/img/coat2.jpg" data-thumb="resources/img/s-coat2.jpg" src="resources/img/s-coat2.jpg">
   <img data-sgallery="group2" title="이미지 제목1" data-full="resources/img/coat3.jpg" data-thumb="resources/img/s-coat3.jpg" src="resources/img/s-coat3.jpg">
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
   <script src="resources/js/jquery.sumogallery.js"></script>
        </div>
        </div>
          <div id="sangpum_sel">
          <form action="addCart.do" method="post" id="button">
          <div id="product_name" style="font-size:33px;" >
                 미니멀 울 트렌치 코트
          </div>
          <input type="hidden" name="product_name"value="미니멀 울 트렌치 코트"></input>  
          <input type="hidden" name="user_id" value=<%=user_id %>></input> 
        <div id="price">5%</div>
        <div id="price4">
           <div id="price2">150,000원</div>
           <span id="price3" >142,500원</span>
           <input type="hidden" name="price3" value=142500></input>   
        </div>
        <td valign=top>
      <table border="0" width="200" cellspacing="0" cellpadding="2" class="b">
      <tr>
         <th id="header1">
         <div style="border-top:1px solid rgba(100,100,100,0.2);width:450px; height:30px; padding-top:10px;">
         <span>택배 - </span><span style="color:skyblue;">무료배송</span><a target=_self href="javascript:STB('C01')"><span style="float:right;"><img src="resources/img/arrow1.png" border=0 align=absmiddle></span></a></div></th></tr>
         
         <script>SetC("C01");</script>
         <td id="backgr1" class="cell1">
         <div style="background:rgba(214,207,201,0.1);">
            <font style="color:rgba(0,0,0,0.5);">추가배송비 </font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제주도 3,000원/기타도서 5,000원<br>
            <font style="color:rgba(0,0,0,0.5);">묶음배송 </font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp가능
         </div>   
         </td>
      </table>
      <table border="0" width="200" cellspacing="0" cellpadding="2" class="b">
      <tr>
         <th id="header2">
         <div style="border-top:1px solid rgba(100,100,100,0.2); width:450px; height:30px; padding-top:10px;">
         <span>가즈아 클럽 </span><span style="color:skyblue;">최대 2.3% 캐시 적립</span><a target=_self href="javascript:STB('C02')"><span style="float:right;"><img src="resources/img/arrow1.png" border=0 align=absmiddle></span></a></div> </th></tr>
         
         <script>SetC("C02");</script>
         <td id="backgr2" class="cell2">
         <div style="background:rgba(214,207,201,0.1);">
         <div style="border-bottom:1px solid rgba(0,0,0,0.1);">
            <font style="color:rgba(0,0,0,0.5);font-size: 16px;">가즈아클럽 적립* </font><font style="color:skyblue;text-align:right;font-size: 15px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp0.3%</font><br>
         <font style="color:rgba(0,0,0,0.5);font-size: 16px;">가즈아카드 적립** </font><font style="color:skyblue;text-align:right;font-size: 15px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2.0%</font><br>   
         </div>
         <font style="color:rgba(0,0,0,0.5);font-size: 14px;">적립 합계</font><font style="color:skyblue;font-weight:bold;font-size: 16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp최대 2.3%</font><br>
         <br>
         <div>
         <font style="font-size:13px;font-weight:bold;color:brown;">가즈아클럽 적립*</font><br>
         <font style="font-size:13px;color:brown;">가즈아클럽은 누구나 무료이용 신청이 가능하며 가입 즉시 가즈아캐시 3만 7천원과 최대 1% 적립, 추가할인 혜택을 받습니다.<br></font>
         </div><br>
         <ul class="info_lefttitle list__infomation"style="font-size:13px;">
               <li class="list-item">
                  <strong class="text__title">적립한도</strong>
                  <span class="text__data">가즈아클럽 적립 최대 5,000원 (기본 적립 포함)</span>
               </li>
               <li class="list-item">
                  <strong class="text__title">적립기준</strong>
                  <span class="text__data">주문완료 즉시 “적립예정”상태로 바로 적립</span>
               </li>
               <li class="list-item">
                  <strong class="text__title">가용시점</strong>
                  <span class="text__data">주문완료 30일 후 “사용가능”한 상태로 변경</span>
               </li>
               <li class="list-item">
                  <strong class="text__title">유효기간</strong>
                  <span class="text__data">“사용가능”상태로부터 6개월</span>
               </li>
               <li class="list-item">
                  <strong class="text__title">유의사항</strong>
                  <span class="text__data">본 혜택은 가즈아페이로 결제 시 적용되며 당사 사정에 따라 사전
                   <div style="margin-left:56px;">예고 없이 변경/삭제 될 수 있습니다. 판매자 제공 적립은 가즈아</div><div style="margin-left:56px;">페이와 무관하게 적용됩니다.</div><br></span>
               </li>
            </ul>
            <div class="box__smile-reward box__smile-reward--card">
            <dl class="list__smile-reward">
               <font style="font-size:13px;font-weight:bold;color:orange;">가즈아카드 적립**</font><br>
               <dd class="list__smile-reward--data"style="font-size:13px;">가즈아카드로 결제 시 전월실적, 적립한도 없이 쓸 때마다 최대 2% 적립됨. <a  class="link__more" target="_blank" title="새 창 열기" onclick="pvprofiler.sendEvt('click', '100002173', 'link');" data-montelena-acode="100002173"></a>
            </dl><br>
            <ul class="info_lefttitle list__infomation"style="font-size:13px;">
               <li class="list-item">
                  <strong class="text__title">적립한도</strong>
                  <span class="text__data">한도 제한 없음</span>
               </li>
               <li class="list-item">
                  <strong class="text__title">적립기준</strong>
                  <span class="text__data">카드대금 납부 10일 이내 적립</span>
               </li>
               <li class="list-item">
                  <strong class="text__title">가용시점</strong>
                  <span class="text__data">적립 후 5년</span>
               </li>
               <li class="list-item">
                  <strong class="text__title">유의사항</strong>
                  <span class="text__data">가즈아페이 결제 시 2% 적립, 일반결제 시 1% 적립(무이자할부 및<div style="margin-left: 56px;"> 청구할인 시 적립제외)</div></span>
               </li>
            </ul>
         </div>
         </div>
         </td>
      </table>
      <table border="0" width="200" cellspacing="0" cellpadding="2" class="b">
      <tr>
         <th id="header3">
         <div style="border-top:1px solid rgba(100,100,100,0.2);width:450px; height:30px; padding-top:10px;">
            <div style="float:left;"><img src="resources/img/card1.png"></div><div style="float:left;margin:4px 0px 0px 3px;">카드무이자</div><div style="float:left;margin-left:3px;"><img src="resources/img/card2.png"></div><div style="float:left;margin:4px 0px 0px 3px;">카드추가혜택</div><a target=_self href="javascript:STB('C03')"><span style="float:right;"><img src="resources/img/arrow1.png" border=0 align=absmiddle></span></a></div></th></tr>
         <script>SetC("C03");</script>
         <td id="backgr3" class="cell1">
         <div style="background:rgba(214,207,201,0.1);">
            <font style="color:rgba(0,0,0,0.5);">카드무이자 </font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp최대 12개월 무이자(월20,750원 X 12개월)<br>
            <font style="color:rgba(0,0,0,0.5);">카드추가혜택</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제휴카드 결제시 최대 15% 할인
         </div>   
         </td>
      </table>
      <div style="border-top:1px solid rgba(100,100,100,0.2);border-bottom:1px solid rgba(100,100,100,0.2); width:450px; height:30px; padding-top:10px;">
      원산지 - 국내산
      </div>
      <div class="plcc_banner">
                  <a  class="btn_banner" onclick="pvprofiler.sendEvt('click', '100001140', 'link');" data-montelena-acode="100001140" target="_blank">
                     <img src="resources/img/ssss.png" alt="가즈아카드" 3만원="" 청구할인=""style="width:450px;height:70px;">
                  </a>
               </div><br><br>
      옵션선택<br>
            <select name="poption"style="width:450px;height:40px;">
              <%for(ShopVO vo : bvo) {%>
                  <option value=<%=vo.getPoption() %>><%=vo.getPoption() %></option>
              <%} %>
              </select> <br><br>
      
          수량 <br>
              <input type="text" name="cnt" value="1" required="true"style="width:350px;height:40px;">
              <input type="button" value="▲" onclick="javascript:this.form.cnt.value++;"style="width:40px;height:40px;background:rgba(43,47,58);color:white;">
              <input type="button" value="▼" onclick="javascript:this.form.cnt.value--;"style="width:40px;height:40px;background:rgba(43,47,58);color:white;"><br><br>
       <br><br>
      
       <div style="margin-left:230px;">
          <font>상품금액</font><font style="font-size: 23px;font-weight: bold;">&nbsp&nbsp142,500원</font>
       </div>
          <input type="submit" value="주문하기" id="btn1" style="border:none;width:215px;height:80px;font-weight: bold;font-size:25px;padding: 3px;background: rgba(43,47,58);color: white;margin-left:10px;margin-top:60px;"/>
          <input type="button" value="장바구니" id="btn1" style="margin-right:10px;border:none;width:215px;height:80px;font-weight: bold;font-size:25px;padding: 3px;background: rgba(214,207,201);color: black;margin-top:30px;"onclick="location.href='Cart_list.do'"/>
       </div>
        </div>
     </div>
     </div>
</div>
</div>
</form> 

<div class="footer" style="clear:both;background: rgba(249,249,249);">
    <div class="contents2">
    <nav>
    <div class="tabs-header" style="background:rgba(43,47,58);">
    <div class="border" style="background: rgba(249,249,249);"></div>
    <ul>
      <li class="active"><a href="#tab-1" tab-id="1" ripple="ripple" ripple-color="#FFF" style="font-size: 20px;text-align: center;margin-left: 160px;">상세설명</a></li>
      <li><a href="#tab-2" tab-id="2" ripple="ripple" ripple-color="#FFF" style="font-size: 20px;text-align: center;padding-left: 30px;padding-right: 20px;">구매후기</a></li>
      <li><a href="#tab-3" tab-id="3" ripple="ripple" ripple-color="#FFF" style="font-size: 20px;text-align: center;padding-left: 30px;padding-right: 20px;">상품문의</a></li>
      <li><a href="#tab-4" tab-id="4" ripple="ripple" ripple-color="#FFF" style="font-size: 20px;text-align: center;padding-left: 30px;padding-right: 20px;">교환/반품</a></li>
    </ul>
    </nav>
          <div class="container">
 <div class="tabs-content">
    <div tab-id="1" class="tab active"><div style="text-align:center;"><img src="resources/img/coat_scroll.jpg"></div></div>
    <div tab-id="2" class="tab"><div class="box__vip-review box__vip-review--none" style="border-top:3px solid rgba(0,0,0,0.2);border-bottom:3px solid rgba(0,0,0,0.2);width:800px;height:330px;margin-left: 160px;">
            <div style="display:inline-block;margin:40px 0px 0px 330px;">
               <img src="resources/img/chat.png"></img>
            </div>
            <div style="margin:50px 0px 0px 289px;">
               <p class="text" style="font-weight:bold; color:rgba(0,0,0,0.2);">&nbsp&nbsp&nbsp&nbsp아직 후기가 없습니다.<br>첫번째 후기를 남겨주세요.</p>
            </div>
      </div><br><br>
     </div>
    <div tab-id="3" class="tab">
            <div class="container">
               <div id="board-font">
                   게시판
               </div>
               <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;margin-top: 20px;margin-left: 40px;width:90%;">
               <thead>
                  <tr>
                     <th style="background-color: #2b2f3a;color: white;text-align: center;padding: 0px 70px;height:30px;">번호</th>
                     <th style="background-color: #2b2f3a;color: white; text-align: center;padding: 0px 200px;">제목</th>
                     <th style="background-color: #2b2f3a;color: white;text-align: center;padding: 0px 90px;">작성자</th>
                     <th style="background-color: #2b2f3a;color: white; text-align: center;padding: 0px 90px;">작성일</th>
                  </tr>
               </thead>
               <tbody>
               <%
                      Board1DAO board1DAO = new Board1DAO();
                     ArrayList<Board1VO> list = board1DAO.getList1(pageNumber); 
                     for (int i = 0; i < list.size(); i++) {
                        Board1VO board1 = list.get(i);
                  %>
                  <tr>  
                    <td><%=board1.getBoard_ID()%></td>
                    <td><a href="view1.do?board_ID=<%=board1.getBoard_ID()%>">
                    <%
                        for(int j=0; j < board1.getBoard_level(); j++){
                    %>
                        RE : 
                     <%
                     }
                     %>
               <%=board1.getBoard_Title()%></a></td>
               <td><%=board1.getUser_id()%></td>
               <td><%=board1.getBoard_Date()%></td>
                  </tr>
                 
                 <%
                     }
                  %>
               </tbody>
            </table>
            
            <div id="gul">
                      
            <input type="button"value="글쓰기" onClick="location.href='boardwrite1.do'"style="font-size: 16px;font-weight: bold;width: 90px;height: 30px;text-align: center;margin:20px 0px 40px 1030px;color: white;background: #2b2f3a;border: none;"/>
            <ul class="pagination" style="margin: 0px 500px;">
               <% 
                 int startPage = (pageNumber / 10) * 10 + 1 ;
               if(pageNumber % 10 == 0) startPage -= 10;
               int targetPage = new Board1DAO().targetPage(pageNumber);
               if(startPage != 1){
               %>
                     <li><a href ="board1.do?pageNumber=<%= startPage -1 %>"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                    <%
               } else {
                    %>
                     <li><span class="glyphicon glyphicon-chevron-left" style="color: gray;"></span></li>
                     <%
                     }
                for(int i = startPage; i<pageNumber; i++){
                     %>
                       <li><a href ="board1.do?pageNumber=<%= i %>"><%=i %></a></li>
                     <%
                     }
                     %>  
                     <li class="active"><a href ="board1.do?pageNumber=<%= pageNumber %>"><%= pageNumber %></a></li>
                     <%
                     for(int i = pageNumber +1; i<= targetPage + pageNumber; i++){
                        if(i < startPage + 10) {
                     %>       
                     <li><a href ="board1.do?pageNumber=<%= i %>"><%=i %></a></li>
                     <% 
                        }
                     }
                     if(targetPage + pageNumber > startPage + 9) {
                     %>
                     <li><a href ="board1.do?pageNumber=<%= startPage + 10 %>"><span class="glyphicon glyphicon-chevron-right"></span></a></li>    
                     <%
                     } else {
                     %>
                       <li><span class="glyphicon glyphicon-chevron-right" style="color: gray;"></span></li>
                     <%
                     }
                     %>
                    </ul>
            </div>
        </div>
       </div><br><br>
     </div>
    <div tab-id="4" class="tab"><div class="deli-notice" style="font-size:14px;margin-left:160px;">
      <ul class="notice-as">
         <li>AS 관련 문의, 소비자 피해보상 또는 불만 처리는 “판매자 정보” 또는 “상품일반정보”를 참고하여 주세요.<br><br></li>
      </ul>
      <table border=1 style="font-size:12px;">
         <caption style="font-size:14px;"><상품 배송/반품/교환 상세정보></caption>
         <colgroup>
            <col style="width:177px;">
            <col>
         </colgroup>
         <tbody>
            <tr>
               <th style="text-align:center;background:rgba(114,107,101,0.1);">
                  <strong>반품/교환 안내</strong>
                  <p>반품/교환에 관한 일반적인<br>사항은 판매자 제시사항보다<br>관계법령이 우선합니다.<br><a href="#" target="_blank" style="text-decoration:underline;">자세히 보기</a></p>
               </th>
               <td>
                  <ul>
                     <!--<li>판매자 반품 택배사 : </li>-->
                     <li>반품/교환 배송비(편도) : 2,500원</li>
                     <li>보내실 곳 : [10291] 서울시 종로구 돈화문로 0411 (5층 강의실)</li>
                     <li>연락처 : 02-930-2550</li>
                  </ul>
               </td>
            </tr>
            <tr>
               <th rowspan="2" style="text-align:center;background:rgba(114,107,101,0.1);">
                  <strong>반품/교환 가능기간</strong>
                  <p>먼저 판매자와 연락하여<br>반품사유, 택배사, 배송비,<br>반품주소 등을 협의 후에<br>상품을 발송해 주십시오.</p>
               </th>
               <td>
                  <ul>
                     <li>구매자 단순 변심 : 상품 수령일로부터 7일 이내 (배송비 : 구매자 부담)</li>
                     <li>표시/광고와 상이, 상품 하자 : 상품 수령 후 3개월 이내 및 표시/광고와 다른 사실을 안 날 또는 알 수 있었던 날부터 30일 이내<br>(배송비 : 판매자 부담)</li>
                  </ul>
               </td>
            </tr>
            <tr>
               <td>
                  <p>소비자가 전자상거래 등에서의 소비자 보호에 관한 법률 (이하 전상법) 제 17조 제 1항 또는 제 3항에 따라 청약철회를 한 후<br>그 상품을 판매자에게 반환하였음에 불구하고 정당한 사유 없이 현금 결제대금의 환급이 3영업일을 넘게 지연된 경우, 소비자는 <br>전상법에 따라 지연기간에 대하여 전상법 시행령으로 정하는 이율을 곱하여 산정한 지연이자(지연배상금)를 신청할 수 있습니다.</p>
               </td>               
            </tr>
            <tr>
               <th style="text-align:center;background:rgba(114,107,101,0.1);">
                  <strong>반품/교환 불가사유</strong>
                  <p>이 경우에는 반품/교환이 불가능합니다.</p>
               </th>
               <td>
                  <ul>
                     <li>반품 요청 가능 기간이 지난 경우</li>
                     <li>구매자 책임 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품 내용 확인을 위해 포장 등을 훼손한 경우는 제외)</li>
                     <li>포장을 개봉하였으나, 포장이 훼손되어 상품가치가 현저히 상실된 경우 (예 : 식품, 화장품, 향수, 음반 등)</li>
                     <li>구매자의 사용 또는 일부 소비에 의하여 상품가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는 태그가 떨어진 브랜드 상품 등)</li>
                     <li>시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</li>
                     <li>복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)</li>
                  </ul>
               </td>
            </tr>
         </tbody>
      </table>
   <div class="seller-warning"style="font-size:13px;">
      <h4 class="seller-warning-title"><br>주의사항</h4>
      <div class="tns_notice">
         <ul>
            <li><span class="ico"></span>전자상거래 등에서의 소비자보호에 관한 법률에 의거하여 미성년자가 체결한 계약은 법정대리인이 동의하지 않은 경우 본인 또는 법정대리인이 <br>취소할 수 있습니다.</li>
            <li><span class="ico"></span>액션에 등록된 판매상품과 상품의 내용은 판매자가 등록한 것으로 (주)액션꼬레아에서는 그 등록내역에 대하여 일체의 책임을 지지 않습니다.</li>
         </ul>
      </div><br><br>
   </div>
   </div>
  </div>
</div>
 </div>
</div>
  <!--//컨텐츠-->
        <!--//컨텐츠-->
          <div class="footer" style="background: rgba(249,249,249);font-size:10px;">
           <div class="container" style="font-size:10px;width:1200px;">
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
<script src="resources/js/jquery.magnify.js"></script>
<script>
$(document).ready(function() {
   $('.magnify-image').magnify();
});
</script>
</body>
</html>
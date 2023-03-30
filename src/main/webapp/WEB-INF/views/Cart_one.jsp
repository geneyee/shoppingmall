<%@page import="com.project.shop.dao.ShopDAO"%>
<%@page import="com.project.shop.vo.ShopVO"%>
<%@page import="java.util.ArrayList"%>
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
<!-- </bonobono-fixed> -->
<link href="<c:url value="/resources/css/setproduct.css" />" rel="stylesheet"></link>
<link href="<c:url value="/resources/css/setproduct-menubar.css" />" rel="stylesheet"></link>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <link href="resources/css/sumogallery.css" rel="stylesheet" />
  <link href="resources/css/magnify.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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
ArrayList<ShopVO> bvo = new ShopDAO().Cart_list();
int tot =0;
int cott=0;
int dvprice= 3000;
int saleprice=0;
int ltot=0;
String pname=null;
if(session.getAttribute("pname")!=null){
	pname=(String) session.getAttribute("pname");
}
String poption2=null;
if(session.getAttribute("poption")!=null){
	poption2=(String) session.getAttribute("poption");
}
poption2=request.getParameter("poption");
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
                        <a href="signUpForm.do"title="회원가입 이동">회원가입</a>
                    </div>
                    <div id="gesipan">
                        <a href="board.do"title="게시판 이동">게시판</a>
                    </div>
                    <div id="custm_center"style="border: none;">
                        <a href="customer_center"title="고객센터 이동">고객센터</a>
                    </div>
                    
                    <%   
                    } else {
	                %>   
	                
	                <div id="logout">
	                <a href="logout.do" title="로그아웃">로그아웃</a>
	                </div>
	                <div id="gesipan">
                        <a href="board.do"title="게시판 이동">게시판</a>
                    </div>
                    <div id="bagooni">
                        <a href="cartForm.do"title="장바구니 이동">장바구니</a>
                    </div>
                    <div id="mypage">
                        <a href="mypage.do"title="마이페이지 이동">마이페이지</a>
                    </div>
                    <div id="custm_center"style="border: none;">
                        <a href="customer_center"title="고객센터 이동">고객센터</a>
                    </div>
                    <!-- </div> -->
                    
                    
                     <%
                      }
                     %>
                     </div>
                <!--//헤더메뉴-->
                <div id="header-logo">
                    <div id="logo"><a href="main.do">Action.</a></div>
                    <div id="search-text">
                        <input type="text"name="search-text" style="width:490px;height:30px;border:none;font-size: 28px;background:rgba(249,249,249);">
                    </div>
                    <div id="search"><a href="search"title="찾기"></a></div>
                </div>
                <!--//로고&검색창-->
                <!--//전체 카테고리-->
            </div>
        </div>
        <div class='menu'>
			<ul>
				<li>
					<a href='#'>Home</a>
				</li>
				<li>
					<a href='#'>About Us</a>
				</li>
				<li class='active sub'>
					<a href='#'>Tutorials</a>
					<ul>
						<li class='sub'>
							<a href='#'>HTML</a>
							<ul>
								<li>
									<a href='#'>HTML Basic</a>
								</li>
								<li class='last'>
									<a href='#'>HTML Advanced</a>
								</li>
							</ul>
						</li>
						<li class='sub'>
							<a href='#'>CSS Tutorials</a>
							<ul>
								<li>
									<a href='#'>CSS Basic</a>
								</li>
								<li class='last'>
									<a href='#'>CSS Advanced</a>
								</li>
							</ul>
						</li>
					</ul>
				</li>
				<li>
					<a href='#'>Demos</a>
				</li>
				<li class='last'>
					<a href='#'>Downloads</a>
				</li>
			</ul>
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
          <form action="updateCart.do" method="post" id="button">
          <div id="product_name" >
           		미니멀 울 트렌치 코트
          </div>
          <input type="hidden" name="product_name" value="미니멀 울 트렌치 코트"></input>  
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
			<div style="border-top:1px solid rgba(100,100,100,0.2);border-bottom:1px solid rgba(100,100,100,0.2); width:450px; height:30px; padding-top:10px;">
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
			<div style="border-bottom:1px solid rgba(100,100,100,0.2); width:450px; height:30px; padding-top:10px;">
			<span>스마일 클럽 </span><span style="color:skyblue;">최대 2.3% 캐시 적립</span><a target=_self href="javascript:STB('C02')"><span style="float:right;"><img src="resources/img/arrow1.png" border=0 align=absmiddle></span></a></div> </th></tr>
			
			<script>SetC("C02");</script>
			<td id="backgr2" class="cell2">
			<div style="background:rgba(214,207,201,0.1);">
			<div style="border-bottom:1px solid rgba(0,0,0,0.1);">
				<font style="color:rgba(0,0,0,0.5);font-size: 16px;">스마일클럽 적립* </font><font style="color:skyblue;text-align:right;font-size: 15px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp0.3%</font><br>
			<font style="color:rgba(0,0,0,0.5);font-size: 16px;">스마일카드 적립** </font><font style="color:skyblue;text-align:right;font-size: 15px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2.0%</font><br>	
			</div>
			<font style="color:rgba(0,0,0,0.5);font-size: 14px;">적립 합계</font><font style="color:skyblue;font-weight:bold;font-size: 16px;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp최대 2.3%</font><br>
			<br>
			<div>
			<font style="font-size:13px;font-weight:bold;color:brown;">스마일클럽 적립*</font><br>
			<font style="font-size:13px;color:brown;">스마일클럽은 누구나 무료이용 신청이 가능하며 가입 즉시 스마일캐시 3만 7천원과 최대 1% 적립, 추가할인 혜택을 받습니다.<br></font>
			</div><br>
			<ul class="info_lefttitle list__infomation"style="font-size:13px;">
					<li class="list-item">
						<strong class="text__title">적립한도</strong>
						<span class="text__data">스마일클럽 적립 최대 5,000원 (기본 적립 포함)</span>
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
						<span class="text__data">본 혜택은 스마일페이로 결제 시 적용되며 당사 사정에 따라 사전
						 <div style="margin-left:56px;">예고 없이 변경/삭제 될 수 있습니다. 판매자 제공 적립은 스마일</div><div style="margin-left:56px;">페이와 무관하게 적용됩니다.</div><br></span>
					</li>
				</ul>
				<div class="box__smile-reward box__smile-reward--card">
				<dl class="list__smile-reward">
					<font style="font-size:13px;font-weight:bold;color:orange;">스마일카드 적립**</font><br>
					<dd class="list__smile-reward--data"style="font-size:13px;">스마일카드로 결제 시 전월실적, 적립한도 없이 쓸 때마다 최대 2% 적립됨. <a href="https://spweb.auction.co.kr/ko/plcc/intro/index?source=ebaykorea&amp;medium=A_P_WEB_H&amp;userType=P" class="link__more" target="_blank" title="새 창 열기" onclick="pvprofiler.sendEvt('click', '100002173', 'link');" data-montelena-acode="100002173"></a>
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
						<span class="text__data">스마일페이 결제 시 2% 적립, 일반결제 시 1% 적립(무이자할부 및<div style="margin-left: 56px;"> 청구할인 시 적립제외)</div></span>
					</li>
				</ul>
			</div>
			</div>
			</td>
		</table>
		<table border="0" width="200" cellspacing="0" cellpadding="2" class="b">
		<tr>
			<th id="header3">
			<div style="border-top:1px solid rgba(100,100,100,0.2); width:450px; height:30px; padding-top:10px;">
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
						<a href="https://spweb.auction.co.kr/ko/plcc/intro/index?type=basicBenefit/index?medium=A_U_U_V&amp;medium=A_P_WEB_V&amp;userType=" class="btn_banner" onclick="pvprofiler.sendEvt('click', '100001140', 'link');" data-montelena-acode="100001140" target="_blank">
							<img src="http://pics.auction.co.kr/vip/2019/1101_pc_vip_plcc_bn.png" alt="스마일카드" 3만원="" 청구할인=""style="width:450px;height:70px;">
						</a>
					</div><br><br>
		옵션<br>
		<input type="hidden" name="poption3" value=<%=poption2 %>></input> 
		<div style="border-top:1px solid rgba(100,100,100,0.2);border-bottom:1px solid rgba(100,100,100,0.2); width:450px; height:30px; padding-top:10px;">
		<span><%=poption2 %> </span><br></br>
		</div>
		
		    수량 <br>
              <input type="text" name="cnt" value="0" required="true"style="width:350px;height:40px;">
              <input type="button" value="▲" onclick="javascript:this.form.cnt.value++;"style="width:40px;height:40px;background:rgba(43,47,58);color:white;">
              <input type="button" value="▼" onclick="javascript:this.form.cnt.value--;"style="width:40px;height:40px;background:rgba(43,47,58);color:white;"><br><br>
		 <br><br>
		 <div style="margin-left:230px;">
		 	<font>상품금액</font><font style="font-size: 23px;font-weight: bold;">&nbsp&nbsp142,500원</font>
		 </div>
		 	<input type="submit" value="수정하기" id="btn1" style="border:none;width:215px;height:80px;font-weight: bold;font-size:25px;padding: 3px;background: rgba(43,47,58);color: white;margin-left:10px;margin-top:60px;"/>
		 	<input type="button" value="장바구니" id="btn1" style="margin-right:10px;border:none;width:215px;height:80px;font-weight: bold;font-size:25px;padding: 3px;background: rgba(214,207,201);color: black;margin-top:30px;"onclick="location.href='Cart_list.do'"/>
		 </div>
        </div>
     </div>
     </div>
</div>
</div>
</form> 
<div class="footer" style="clear:both;">
    <div class="contents2">
    <nav>
    <div class="tabs-header" style="background:rgba(43,47,58);">
    <div class="border"></div>
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
    <div tab-id="2" class="tab">2. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam.</div>
    <div tab-id="3" class="tab">3. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor.</div>
    <div tab-id="4" class="tab">4. Donec ullamcorper nulla non metus auctor fringilla. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Curabitur blandit tempus porttitor. Maecenas faucibus mollis interdum. Donec ullamcorper nulla non metus auctor fringilla. Aenean lacinia bibendum nulla sed consectetur. Aenean lacinia bibendum nulla sed consectetur.</div>
  </div>
</div>
 </div>
</div>
  <!--//컨텐츠-->
  <div class="footer" style="border-top:1px solid black;">
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

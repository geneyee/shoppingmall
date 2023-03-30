<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko" class=" js"><head>
<title>옥션 - 고객센터</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-type" content="text/html; charset=KSC_5601">
<meta http-equiv="Cache-control" content="No-cache">
<meta http-equiv="Pragma" content="No-cache">
<meta content="Http://Schemas.Microsoft.Com/Intellisense/Ie5" name="Vs_targetschema">
<meta content="" name="Description">
<meta content="" name="Keywords">
 
<link rel="stylesheet" href="http://script.auction.co.kr/pc/style/css/member_customer.css">

<script async="" src="https://montelena.auction.co.kr/montelena.js?path=http://member.auction.co.kr/help/home.aspx"></script><script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/common/jquery.js"></script>
<script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/style/js/common.js"></script>
<script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/style/js/ui.header.js"></script>
<script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/common/base64.js"></script>
<script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/common/help.js"></script><!-- 문의채널의 고객문의 처리절차 안내 팝업 -->
<script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/style/js/jquery.customer.js"></script>
<script language="JavaScript" type="text/javascript" src="http://script.auction.co.kr/pc/style/js/member_customer.js"></script>
<script type="text/javascript" src="/MyAuction/js/MyAuctionGlobalEnvironmentJS.aspx"></script>
<script language="JavaScript" type="text/javascript" src="/help/js/customer.js"></script>

<script language="javascript" type="text/javascript">
	var pageSizeCount = "10";
	var selectedTCode = "M01";
	var selectedMCode = "";
	var topCode = "M";
	var pageUrl = "Home.aspx";
	var customSortCount = "44";
	var IsLogin = "No";
	var mailCount = "0";
    var emailSupport = "javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&helpmain=1&url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&cCode=','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()";
</script>
<script type="text/javascript">
    window.onload = function () {
	    
	}
	function chatopen() {
		window.open('https://chatc.auction.co.kr/guide/A-S-201', 'chatc', 'top=' + (screen.availHeight / 2 - 200) + ', left=' + (screen.availWidth / 2 - 300) + ',scrollbars=no,toolbar=no,location=no,direction=no,status=no,menubar=no,resizable=no,width=485,height=520');
	}

	function GetCookie(name) {
	    var prefix = name + "=";
	    var cookieStartIndex = document.cookie.indexOf(prefix);
	    if (cookieStartIndex == -1) { return (null); };
	    var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	    if (cookieEndIndex == -1) { cookieEndIndex = document.cookie.length; };
	    return (unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex)));
	}
</script>

<!-- 마크업 확인용 스크립트 -->
<script type="text/javascript">
    

    $(document).ready(function () {
        //레이어 팝업 
        var temp1 = "";
        var tmpCookies = GetCookie("pop_layer_" + "0");

        //레이어 팝업 다시보지 않기로 구분
        if (tmpCookies != null && tmpCookies == "") {
            //레이어 팝업 표시
            if (temp1 != "") {

                //팝업 높이 설정
                //var iframeTop = ($(window).height() / 2) - ($("#layer_pop iframe").height() / 2);
                //var iFrameTop = "";

                //$("#layer_pop iframe").css("top", iframeTop);

                $("#layer_pop").show();
            }
        }

        //레이어 팝업 리사이징
        //$(window).resize(function () {
        //    var iframeTop = ($(window).height() / 2) - ($("#layer_pop iframe").height() / 2);
        //    $("#layer_pop iframe").css("top", iframeTop);
        //});

        var notiTimer;
        //TEXT 공지사랑 롤링
        if ($('#noticeList li').length > 0) {
            $(".notice_area").show();

            $("#noticeList .text_area").bind('mouseenter focusin', function (event) {
                window.clearInterval(notiTimer);
            }).bind('mouseleave focusout', function (event) {
                window.clearInterval(notiTimer);

                notiTimer = window.setInterval(function () {
                    rolling();
                }, 3000);
            });
            notiTimer = window.setInterval(
                    function () {
                        rolling();
                    }, 3000);
        } else {
            $(".notice_area").hide();
        }

        
    });

    function rolling() {
        if ($('#noticeList li').length > 1) {
            if ($.browser.msie && $.browser.version === '7.0') {
                $("#noticeList li:first-child").fadeOut(100, function () {
                    $(this).appendTo(this.parentNode).show();
                });
            } else {
                $("#noticeList li:first-child").slideUp(400, function () {
                    $(this).appendTo(this.parentNode).show();
                });
            }
        }
	}
</script>
<!-- 마크업 확인용 스크립트 -->
<link rel="search" type="application/opensearchdescription+xml" href="http://script.auction.co.kr/common/opensearch_description.xml" title="Auction"></head>
<body><div id="accessibility"><ul><li><a href="#txtKeyword">검색 바로가기</a></li><li><a href="#core_gnb">메뉴 바로가기</a></li></ul></div><hr>
<!-- //wrap -->
<div id="wrap">
	<!--simple header-->
	<script type="text/javascript">
		var headerType = "SIMPLE";
		var ShWidth900px = true;
		var ShFontColor = "#000000";
		var ShIconBlack = true;
		var wingType = "N";
		document.domain = "auction.co.kr";
	</script>
	<script src="http://script.auction.co.kr/common/header.js" type="text/javascript"></script><script language="javascript" src="http://script.auction.co.kr/common/shared_object.js"></script><div style="width:0px; height:0px; position:absolute; left:-100000px;">
<embed src="http://script.auction.co.kr/common/swf/SOUniversalWing.swf" quality="high" wmode="" bgcolor="" width="0" height="0" id="shared" name="shared" flashvars="swfParam" align="middle" allowscriptaccess="always" allowfullscreen="true" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">
</div>

<script language="javascript" src="http://script.auction.co.kr/common/SORecentMDID.js"></script>
<script language="javascript" src="http://script.auction.co.kr/ad/log.js"></script>
<script language="javascript" src="http://script.auction.co.kr/ad/arche.ad.enumtypes.js"></script>
<script language="javascript" src="http://script.auction.co.kr/PDS/PdsService.js"></script>
<script language="javascript" src="http://script.auction.co.kr/listing/PersonalRecommendService.js"></script>
<script language="javascript" src="http://script.auction.co.kr/style/js/common.js"></script>
<script language="javascript" src="http://script.auction.co.kr/Common/header_stop.js"></script>
<script type="text/javascript" src="http://script.auction.co.kr/Common/library/ua-parser.min.js"></script>
<script type="text/javascript" src="http://script.auction.co.kr/Common/useragent_control.js" charset="utf-8"></script>
<script language="javascript" src="http://script.auction.co.kr/common/impression.js"></script><script type="text/javascript" src="http://script.auction.co.kr/common/shared_object.js"></script>
<table cellpadding="0" cellspacing="0" style="display:none;"><tbody><tr><td><img src="http://implog3.auction.co.kr/common/weblog.asp?cu=http://member.auction.co.kr/help/home.aspx&amp;referrer=" width="0" height="0" border="0"></td></tr></tbody></table>
<div id="wrap"><div id="min_width">
<div id="leftbox">
<script language="javascript" src="http://script.auction.co.kr/pc/style/js/ui.header.js"></script>
<script language="javascript" src="http://script.auction.co.kr/common/header_display.js"></script><link rel="stylesheet" type="text/css" href="//script.auction.co.kr/pc/style/css/common.css "><div id="header_simple"><div id="simple_container"><h1><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//www.auction.co.kr/%3Fredirect%3D1" target="_top"><img src="//pics.auction.co.kr/renewal/common/header/simple_logo.gif" alt="AUCTION"></a></h1><div class="layout_left"><div class="core_search"><form id="where" class="search-wrap" name="search_top" method="get" accept-charset="utf-8" onsubmit="document.getElementById('_searchCcLog').src='http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=justlog'; return TopHeader_search_start.OnSubmit(this);"><div class="search_inner"> <input type="hidden" name="keyword"><input type="hidden" name="itemno"><input type="hidden" name="nickname"><input type="hidden" name="encKeyword"><input type="hidden" name="arraycategory"><input type="hidden" name="frm"><input type="hidden" name="dom" value="auction"><input type="hidden" name="isSuggestion" value="No"><input type="hidden" name="retry"><input type="text" class="search_input_keyword" id="txtKeyword"> <input type="submit" value="검색" class="search_btn_ok"> </div></form> <img id="_searchCcLog" width="0" height="0" alt="" src="http://pics.auction.co.kr/common/blank.gif"></div></div><div class="layout_right"><div class="usermenu"><ul><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//member.auction.co.kr/Authenticate/%3Furl%3Dhttp%253A//member.auction.co.kr/help/home.aspx" target="_top">로그인</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=https%3A//memberssl.auction.co.kr/Membership/Signup/ChoiceMemberType.aspx" target="_top">회원가입</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=https%3A//cart.auction.co.kr/ko/cart">장바구니</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//escrow.auction.co.kr/close/OrderProcessList.aspx%3FloginType%3D50">주문배송</a></li><li class="has_sub"><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//member.auction.co.kr/myauction/Default.aspx">마이옥션</a><ul><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//member.auction.co.kr/myauction/Default.aspx">마이옥션 홈</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//escrow.auction.co.kr/close/OrderProcessList.aspx%3FloginType%3D50" target="_top">주문내역</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//favorite.auction.co.kr/BuyerTools/Favorites/FavoriteItemHome.aspx%3FUse_Yn%3DN" target="_top">관심상품</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//reward.auction.co.kr/MyCoupon/BuyerCouponList.aspx%3FUse_Yn%3DN" target="_top">쿠폰관리</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//reward.auction.co.kr/MyPoint/SmilePointList.aspx" target="_top">Smile Point</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//escrow.auction.co.kr/SmilePG/MySmileCash.aspx">Smile Cash</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=https%3A//memberssl.auction.co.kr/membership/MyInfo/MyInfo.aspx">회원정보</a></li></ul></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//member.auction.co.kr/help/home.aspx">고객센터</a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//sell3.auction.co.kr/SellBasic/SellBasicBridge.aspx">판매하기</a></li></ul></div></div></div></div><h2 class="hide">메뉴</h2><div id="core_gnb" style=""><div class="gnb_container"><div class="layout_left"><div class="corenavi navi_allmenu"><a href="javascript:;" class="navi_opener"><span>전체 카테고리</span> <em class="ico_arrow type_down"></em></a><div class="navi_dropdown" style="display: none;"><div class="allmenu" id="allmenu"><ul><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate10">브랜드 패션</a></li><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate01">의류</a></li><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate02">뷰티/잡화</a></li><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate03">식품/마트/유아</a></li><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate04">가구/생활/건강/렌탈</a></li><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate05">가전/디지털/컴퓨터</a></li><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate06">스포츠/자동차/공구</a></li><li><a href="javascript:;" class="allmenu_depth1 allmenu_cate07">도서/티켓/여행/e쿠폰</a></li><li><a class="allmenu_cate08" href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=13FD&amp;next=http://bizplus.auction.co.kr/corner/bizplus.aspx">BIZ+</a><a class="allmenu_cate09" href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=13FE&amp;next=http://babyplus.auction.co.kr/BabyPlus/default.aspx">BABY+</a></li></ul></div></div></div><ul class="corenavi primary">	<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http://promotion.auction.co.kr/promotion/MD/eventview.aspx?txtMD=01982C89B6" class="primary_1">쿠폰포인트</a></li>	<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http://corners.auction.co.kr/corner/categorybest.aspx" class="primary_2">옥션베스트</a></li>	<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http://shop.auction.co.kr/SmartDelivery/default.aspx" class="primary_3">스마트배송</a></li>	<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http://corners.auction.co.kr/corner/smileclub.aspx" class="primary_4">스마일클럽</a><span class="bnr_smileclub_premium">프리미엄 멤버십</span></li></ul></div><div class="layout_right"><div class="corenavi navi_member"><a href="javascript:;" class="navi_opener"><span>멤버십 서비스</span> <em class="ico_arrow type_down"></em></a><div class="navi_dropdown type_normal" style="display: none;"><div class="biz_tit">멤버십 서비스에 가입해 보세요</div><ul class="type_biz"><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//bizplus.auction.co.kr">사업자 회원이라면 <span>비즈플러스</span></a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//babyplus.auction.co.kr">엄마,아빠라면 <span>베이비플러스</span></a></li><li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=&amp;next=http%3A//petplus.auction.co.kr/petplus/">반려동물과 함께라면 <span>펫플러스</span></a></li></ul></div></div><div class="corenavi navi_latest"><a href="javascript:;" class="navi_opener"><span>최근 본 상품/코너</span> <em class="ico_arrow type_down"></em></a><div class="navi_dropdown" style="display: none;"><div class="column1"><div class="column_latest_key"><div class="column_tit">최근 검색어</div></div><div class="column_hot_key"><div class="column_tit">인기 검색어</div></div></div><div class="column2"><div class="column_hot_corner"><div class="column_tit">인기코너</div></div></div><div class="column3"><div class="column_latest_item module_slot"><div class="column_tit">최근 본 상품</div></div></div></div></div></div></div></div></div>
<script language="javascript" src="http://script.auction.co.kr/common/popup.js"></script>
<script type="text/javascript" src="http://script.auction.co.kr/common/arche.web.shortcut.js"></script>

	<!--//simple header-->
	
	<!-- 긴급공지 레이어팝업 : 959.20151230 -->
	<div class="layer_popup">
		<div class="bg_mask" id="layer_pop" style="display:none;">
		    <iframe src="pop_layer.aspx?content=&amp;seqno=0" frameborder="0" width="0" height="0" scrolling="no" id="popup_iframe" name="popup_iframe" style="top:;left:;margin:-200px 0 0 -189px"></iframe>
        </div>
	</div>
	<!-- //긴급공지 레이어팝업 : 959.20151230 -->

	<div id="header">
		<h1><a href="#"><img src="http://pics.auction.co.kr/customer/h1_customer.png" alt="고객센터"></a></h1>
		<div class="guest-header">
			<ul class="guest-tab"><li class="on" code="M"><a href="http://member.auction.co.kr/help/Home.aspx?tcode=M01&amp;topCode=M">구매 고객</a></li><li code="N"><a href="http://member.auction.co.kr/help/Home.aspx?tcode=N01&amp;topCode=N">판매 고객</a></li><li code="Z"><a href="http://member.auction.co.kr/help/Ticket.aspx?tcode=Z01&amp;topCode=Z">티 켓</a></li><li class="trip"><a href="http://member.auction.co.kr/help/FAQ2.aspx?tcode=M09&amp;mcode=&amp;topCode=M">숙박/여행</a></li><li class="ebayshopping"><a href="http://ebay.auction.co.kr/?dir=cscenter" target="_blank">이베이쇼핑</a></li></ul>
		</div>
	</div>
	<!-- //header -->

	<!-- body -->
	<div id="body">
		<!-- locbar -->
		<div id="locbar">
			<div class="loc-right"><a href="http://www.auction.co.kr">홈</a>&gt;<a href="#"><strong>고객센터</strong></a></div>
		</div>
		<!-- //locbar -->

		<form id="frmHome" name="frmHome" method="post">
			<input type="hidden" id="payno" name="payno" value="">
			<input type="password" id="payPassword" name="payPassword" value="" style="display:none">
			<input type="hidden" id="loginType" name="loginType" value="">
			<input type="hidden" id="url" name="url" value="">
		</form>

		<!-- contents -->
		<div id="contents">
			<!-- lnb -->
			<div id="lnb">
                <ul class="lnb-menu"><li class="depth_li" id="leftMenu_M01"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M01');">회원정보</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M01', '01', 'M');">회원가입/정보수정</a></li><li><a href="javascript:fnFAQGoSearch('M01', '02', 'M');">아이디/비밀번호</a></li><li><a href="javascript:fnFAQGoSearch('M01', '03', 'M');">로그인</a></li><li><a href="javascript:fnFAQGoSearch('M01', '04', 'M');">탈퇴/재가입</a></li><li><a href="javascript:fnFAQGoSearch('M01', '05', 'M');">구매등급</a></li></ul></li><li class="depth_li" id="leftMenu_M02"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M02');">주문</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M02', '01', 'M');">주문방법</a></li><li><a href="javascript:fnFAQGoSearch('M02', '02', 'M');">주문내역/확인</a></li><li><a href="javascript:fnFAQGoSearch('M02', '03', 'M');">상품찾기/문의</a></li><li><a href="javascript:fnFAQGoSearch('M02', '05', 'M');">구매결정/후기</a></li></ul></li><li class="depth_li" id="leftMenu_M03"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M03');">결제</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M03', '01', 'M');">입금확인</a></li><li><a href="javascript:fnFAQGoSearch('M03', '02', 'M');">무통장입금</a></li><li><a href="javascript:fnFAQGoSearch('M03', '03', 'M');">카드결제</a></li><li><a href="javascript:fnFAQGoSearch('M03', '04', 'M');">스마일페이</a></li><li><a href="javascript:fnFAQGoSearch('M03', '05', 'M');">영수증</a></li><li><a href="javascript:fnFAQGoSearch('M03', '06', 'M');">결제기타</a></li></ul></li><li class="depth_li" id="leftMenu_M04"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M04');">배송</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M04', '01', 'M');">배송기간/확인</a></li><li><a href="javascript:fnFAQGoSearch('M04', '03', 'M');">배송지연</a></li><li><a href="javascript:fnFAQGoSearch('M04', '04', 'M');">배송비</a></li></ul></li><li class="depth_li" id="leftMenu_M05"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M05');">취소/환불</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M05', '01', 'M');">주문취소</a></li><li><a href="javascript:fnFAQGoSearch('M05', '02', 'M');">경매취소</a></li><li><a href="javascript:fnFAQGoSearch('M05', '03', 'M');">환불확인/기간</a></li></ul></li><li class="depth_li" id="leftMenu_M06"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M06');">반품/교환/AS</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M06', '01', 'M');">반품요청/승인</a></li><li><a href="javascript:fnFAQGoSearch('M06', '02', 'M');">반품환불지연</a></li><li><a href="javascript:fnFAQGoSearch('M06', '03', 'M');">반품운송비</a></li><li><a href="javascript:fnFAQGoSearch('M06', '04', 'M');">A/S 및 교환</a></li></ul></li><li class="depth_li" id="leftMenu_M07"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M07');">서비스/불편사항</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M07', '01', 'M');">이벤트</a></li><li><a href="javascript:fnFAQGoSearch('M07', '02', 'M');">Smile Cash</a></li><li><a href="javascript:fnFAQGoSearch('M07', '03', 'M');">쿠폰/Smile Point</a></li><li><a href="javascript:fnFAQGoSearch('M07', '10', 'M');">스마일클럽</a></li><li><a href="javascript:fnFAQGoSearch('M07', '04', 'M');">모바일옥션</a></li><li><a href="javascript:fnFAQGoSearch('M07', '05', 'M');">사이트오류</a></li></ul></li><li class="depth_li" id="leftMenu_M09"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M09');">여행/숙박</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M09', '01', 'M');">국내숙박</a></li><li><a href="javascript:fnFAQGoSearch('M09', '02', 'M');">항공권</a></li><li><a href="javascript:fnFAQGoSearch('M09', '03', 'M');">해외여행</a></li><li><a href="javascript:fnFAQGoSearch('M09', '04', 'M');">국내여행</a></li></ul></li><li class="depth_li" id="leftMenu_M08"><h2 class="depth-title" onclick="fnFAQLeftMenuShow('M08');">안전거래</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('M08', '04', 'M');">정보불량/침해</a></li><li><a href="javascript:fnFAQGoSearch('M08', '09', 'M');">매매불가</a></li><li><a href="javascript:fnFAQGoSearch('M08', '10', 'M');">매매주의</a></li><li><a href="javascript:fnFAQGoSearch('M08', '11', 'M');">지식재산권침해</a></li><li><a href="javascript:fnFAQGoSearch('M08', '12', 'M');">서비스이용정책</a></li></ul></li><li class="depth_li" id="leftMenu_Z01"><h2 class="depth-title">티켓센터</h2><ul class="sub-depth"><li><a href="javascript:fnFAQGoSearch('Z01', '01', 'Z');">주문/결제</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '02', 'Z');">취소/환불/수수료</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '03', 'Z');">가입/로그인</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '04', 'Z');">이벤트</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '05', 'Z');">쿠폰/포인트</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '06', 'Z');">레드카펫</a></li></ul></li></ul>
			    <div class="lnb-menu sub">
                    <div id="buyer_inquiry">
				            <ul>
					            <li class="subtab1"><a href="javascript:newHelpPop('I02041');">고객문의 처리절차</a></li>
					            <li class="subtab2"><a href="#" onclick="arsLayer(); return false;">전화상담안내</a></li>
					            <li class="subtab3"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">1:1 문의하기</a></li>
					            <li class="subtab5"><a href="http://member.auction.co.kr/help/FAQUserMailList.aspx?topCode=M">고객센터 문의내역</a></li>
					            <li class="subtab6"><a href="http://buy.auction.co.kr/buy/QnA/MyQnAList.aspx">상품 문의내역</a></li>
					            <li class="subtab7"><script language="javascript"> function livestart() { window.open('http://member.auction.co.kr/help/remote.html', 'LiveSupportGO', 'top=' + (screen.availHeight / 2 - 200) + ', left=' + (screen.availWidth / 2 - 300) + ',scrollbars=no,toolbar=no,location=no,direction=no,status=no,menubar=no,resizable=no,width=600,height=400'); }</script><a href="#" onclick="livestart();">원격지원안내</a></li>
				                <li class="subtab8"><a href="javascript:window.open('http://member.auction.co.kr/SecurityCenter/Main.aspx?code=A0000','안전거래센터','menubar=no,toolbar=no,location=no,status=no').focus();"> 안전거래센터</a></li>	
                            </ul>
                    </div>
                    <div id="seller_inquiry" style="display:none">
                    <ul>
					            <li class="subtab1"><a href="javascript:newHelpPop('I02041');">고객문의 처리절차</a></li>
					            <li class="subtab2"><a href="#" onclick="arsLayer(); return false;">전화상담안내</a></li>
					            <li class="subtab3"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">1:1 문의하기</a></li>
                                <li class="subtab4"><a href="javascript:chatopen();">1:1 채팅문의</a></li>
					            <li class="subtab5"><a href="http://member.auction.co.kr/help/FAQUserMailList.aspx?topCode=M">고객센터 문의내역</a></li>
					            <li class="subtab6"><a href="http://buy.auction.co.kr/buy/QnA/MyQnAList.aspx">상품 문의내역</a></li>
					            <li class="subtab7"><script language="javascript"> function livestart() { window.open('http://member.auction.co.kr/help/remote.html', 'LiveSupportGO', 'top=' + (screen.availHeight / 2 - 200) + ', left=' + (screen.availWidth / 2 - 300) + ',scrollbars=no,toolbar=no,location=no,direction=no,status=no,menubar=no,resizable=no,width=600,height=400'); }</script><a href="#" onclick="livestart();">원격지원안내</a></li>
		                        <li class="subtab8"><a href="javascript:window.open('http://member.auction.co.kr/SecurityCenter/Main.aspx?code=A0000','안전거래센터','menubar=no,toolbar=no,location=no,status=no').focus();"> 안전거래센터</a></li>		
                    </ul>
                    </div>
			    </div>
			    
			</div>
			<!-- //lnb -->
			

			<!-- cont -->
			<div id="cont">
				<div class="customer-step">
					<h2>언제나 고객의 의견을 소중히 생각합니다.</h2>
					<ol>
						<li>자주묻는 질문 중에서 찾아주세요</li>
						<li>이메일 문의하기를 이용해주세요.</li>
						<li>고객센터 상담원에게 전화문의를 해주세요.</li>
					</ol>
				</div>

				<dl class="inquiry-search"> 
					<dt><label for="inquirySearch"><img src="http://pics.auction.co.kr/customer/title_inquiry.gif" alt="자주찾는 문의"></label></dt>
					<dd class="search-input">									
						<p class="input-box"><input type="text" class="txt" name="sw" id="sw" onkeydown="if(event.keyCode==13) {document.location.href='http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0DB0&amp;next=http://member.auction.co.kr/help/Search.aspx?topCode=M&amp;searchword='+base64Encode(escape(document.getElementById('sw').value));return false;}" onfocus="this.value='';" value="문의사항을 입력하세요" title="자주찾는 문의"></p>
						<a href="#" onclick="document.location.href='http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0DB0&amp;next=http://member.auction.co.kr/help/Search.aspx?topCode=M&amp;searchword='+base64Encode(escape(document.getElementById('sw').value));return false;" class="search-btn">검색</a>					
					</dd>
					<dd class="search-keyword"><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0DB1&amp;next=http://member.auction.co.kr/help/Search.aspx%3Fsearchword=JXVCQzMwJXVDMUExJXVDOUMwJXVDNUYw&amp;topCode=M">배송지연</a>&nbsp;<a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0DB1&amp;next=http://member.auction.co.kr/help/Search.aspx%3Fsearchword=JXVCQzE4JXVENDg4&amp;topCode=M">반품</a>&nbsp;<a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0DB1&amp;next=http://member.auction.co.kr/help/Search.aspx%3Fsearchword=JXVBQ0IwJXVDODFD&amp;topCode=M">결제</a>&nbsp;<a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0DB1&amp;next=http://member.auction.co.kr/help/Search.aspx%3Fsearchword=U21pbGUlMjBQb2ludA==&amp;topCode=M">Smile Point</a>&nbsp;<a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0DB1&amp;next=http://member.auction.co.kr/help/Search.aspx%3Fsearchword=U21pbGUlMjBDYXNo&amp;topCode=M">Smile Cash</a></dd>
				</dl>

                <!-- 공지 추가 : 959.20160121 -->
				<div class="notice_area" style="display:none">
					<!-- [D] 공지사항이 2개 이상일 경우 상하롤링되게 해주세요 -->
					<ul id="noticeList">
						<!--  롤링 위치 수정 : 959.20160125 -->
                        
						<!--  //롤링 위치 수정 : 959.20160125 -->
					</ul>
				</div>

                <!-- 퀵 메뉴 링크 -->
				<div id="buyer_quick" style="">
				<ul class="quick-menu-link">
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D80&amp;next=https%3a%2f%2fmemberssl.auction.co.kr%2fmembership%2fIDPW%2fFindID.aspx%3furl%3dhttp%3a%2f%2fwww.auction.co.kr%2f" target="_top"> <img src="http://pics.auction.co.kr/customer/quick_menu_buy1.jpg" alt="아이디 비밀번호 찾기"></a></li> 
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D81&amp;next=http://escrow.auction.co.kr/Close/BuyInProgress.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_buy2.jpg" alt="주문/배송 조회"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D82&amp;next=http://escrow.auction.co.kr/Close/OrderProcessList.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_buy3.jpg" alt="반품/취소 요청 "></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D83&amp;next=https://memberssl.auction.co.kr/membership/MyInfo/MyInfo.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_buy4.jpg" alt="회원정보 수정"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D84&amp;next=http://reward.auction.co.kr/MyPoint/SmilePointList.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_buy5.jpg" alt="Smile Point 내역조회"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D85&amp;next=http://escrow.auction.co.kr/SmilePG/MySmileCash.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_buy6.jpg" alt="Smile Cash 내역조회"></a></li>
                    <li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D86&amp;next=http://promotion.auction.co.kr/promotion/MyEvent/EventList.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_buy7.jpg" alt="이벤트 응모당첨내역"></a></li>
					<li><a href="javascript:window.open('http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D87&amp;next=http://member.auction.co.kr/SecurityCenter/Main.aspx?code=A0000','안전거래센터','menubar=no,toolbar=no,location=no,status=no').focus();"><img src="http://pics.auction.co.kr/customer/quick_menu_buy8.jpg" alt="Security Center"></a></li>
				</ul>
				</div>

				<div id="seller_quick" style="display:none">
				<ul class="quick-menu-link">
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D8A&amp;next=https://memberssl.auction.co.kr/Membership/MyInfo/MyInfo.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_sell1.jpg" alt="회원정보 수정"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D8B&amp;next=http://www.esmplus.com/Home/Home#HTDM100" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_sell2.jpg" alt="상품 관리"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D8C&amp;next=http://www.esmplus.com/Home/Home#HTDM134" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_sell3.jpg" alt="판매예치금 조회"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D8D&amp;next=http://www.esmplus.com/Home/Home#HTDM298" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_sell4.jpg" alt="정산 내역 관리"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D8E&amp;next=http://www.esmplus.com/Home/Home#HTDM140" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_sell5.jpg" alt="고객문의 응대관리"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D8F&amp;next=http://ecenter.auction.co.kr/" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_sell6.jpg" alt="판매자 교육센터"></a></li>
					<li><a href="http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D90&amp;next=http://adcenter.auction.co.kr/Guide/ad_guide4_1.aspx" target="_blank"><img src="http://pics.auction.co.kr/customer/quick_menu_sell7.jpg" alt="판매자 광고센터"></a></li>
					<li><a href="javascript:window.open('http://through.auction.co.kr/common/SafeRedirect.aspx?cc=0D87&amp;next=http://member.auction.co.kr/SecurityCenter/Main.aspx?code=A0000','안전거래센터','menubar=no,toolbar=no,location=no,status=no').focus();"><img src="http://pics.auction.co.kr/customer/quick_menu_sell8.jpg" alt="Security Center"></a></li>
				</ul>
				</div>
				<!-- //퀵 메뉴 링크 -->

				<!-- 자주묻는 질문 Top 10 -->
				<div class="one-tab-area">
					<!-- 전체메뉴 보기 -->
					<span class="all-view-btn">전체보기</span>
					<div class="all-view-layer">
						<ul class="all-one-depth"><li class="depth-child1"><strong>회원정보</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M01', '01', 'M');">회원가입/정보수정</a></li><li><a href="javascript:fnFAQGoSearch('M01', '02', 'M');">아이디/비밀번호</a></li><li><a href="javascript:fnFAQGoSearch('M01', '03', 'M');">로그인</a></li><li><a href="javascript:fnFAQGoSearch('M01', '04', 'M');">탈퇴/재가입</a></li><li><a href="javascript:fnFAQGoSearch('M01', '05', 'M');">구매등급</a></li></ul></li><li class="depth-child1"><strong>주문</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M02', '01', 'M');">주문방법</a></li><li><a href="javascript:fnFAQGoSearch('M02', '02', 'M');">주문내역/확인</a></li><li><a href="javascript:fnFAQGoSearch('M02', '03', 'M');">상품찾기/문의</a></li><li><a href="javascript:fnFAQGoSearch('M02', '05', 'M');">구매결정/후기</a></li></ul></li><li class="depth-child1"><strong>결제</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M03', '01', 'M');">입금확인</a></li><li><a href="javascript:fnFAQGoSearch('M03', '02', 'M');">무통장입금</a></li><li><a href="javascript:fnFAQGoSearch('M03', '03', 'M');">카드결제</a></li><li><a href="javascript:fnFAQGoSearch('M03', '04', 'M');">스마일페이</a></li><li><a href="javascript:fnFAQGoSearch('M03', '05', 'M');">영수증</a></li><li><a href="javascript:fnFAQGoSearch('M03', '06', 'M');">결제기타</a></li></ul></li><li class="depth-child1"><strong>배송</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M04', '01', 'M');">배송기간/확인</a></li><li><a href="javascript:fnFAQGoSearch('M04', '03', 'M');">배송지연</a></li><li><a href="javascript:fnFAQGoSearch('M04', '04', 'M');">배송비</a></li></ul></li><li class="depth-child1"><strong>취소/환불</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M05', '01', 'M');">주문취소</a></li><li><a href="javascript:fnFAQGoSearch('M05', '02', 'M');">경매취소</a></li><li><a href="javascript:fnFAQGoSearch('M05', '03', 'M');">환불확인/기간</a></li></ul></li><li class="depth-child1"><strong>반품/교환/AS</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M06', '01', 'M');">반품요청/승인</a></li><li><a href="javascript:fnFAQGoSearch('M06', '02', 'M');">반품환불지연</a></li><li><a href="javascript:fnFAQGoSearch('M06', '03', 'M');">반품운송비</a></li><li><a href="javascript:fnFAQGoSearch('M06', '04', 'M');">A/S 및 교환</a></li></ul></li><li class="depth-child1"><strong>서비스/불편사항</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M07', '01', 'M');">이벤트</a></li><li><a href="javascript:fnFAQGoSearch('M07', '02', 'M');">Smile Cash</a></li><li><a href="javascript:fnFAQGoSearch('M07', '03', 'M');">쿠폰/Smile Point</a></li><li><a href="javascript:fnFAQGoSearch('M07', '10', 'M');">스마일클럽</a></li><li><a href="javascript:fnFAQGoSearch('M07', '04', 'M');">모바일옥션</a></li><li><a href="javascript:fnFAQGoSearch('M07', '05', 'M');">사이트오류</a></li></ul></li><li class="depth-child1"><strong>여행/숙박</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M09', '01', 'M');">국내숙박</a></li><li><a href="javascript:fnFAQGoSearch('M09', '02', 'M');">항공권</a></li><li><a href="javascript:fnFAQGoSearch('M09', '03', 'M');">해외여행</a></li><li><a href="javascript:fnFAQGoSearch('M09', '04', 'M');">국내여행</a></li></ul></li><li class="depth-child1"><strong>안전거래</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('M08', '04', 'M');">정보불량/침해</a></li><li><a href="javascript:fnFAQGoSearch('M08', '09', 'M');">매매불가</a></li><li><a href="javascript:fnFAQGoSearch('M08', '10', 'M');">매매주의</a></li><li><a href="javascript:fnFAQGoSearch('M08', '11', 'M');">지식재산권침해</a></li><li><a href="javascript:fnFAQGoSearch('M08', '12', 'M');">서비스이용정책</a></li></ul></li><li class="depth-child1"><strong>티켓센터</strong><ul class="all-view-list"><li><a href="javascript:fnFAQGoSearch('Z01', '01', 'Z');">주문/결제</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '02', 'Z');">취소/환불/수수료</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '03', 'Z');">가입/로그인</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '04', 'Z');">이벤트</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '05', 'Z');">쿠폰/포인트</a></li><li><a href="javascript:fnFAQGoSearch('Z01', '06', 'Z');">레드카펫</a></li></ul></li></ul>
					</div>
					<!-- //전체메뉴 보기 -->
					<ul class="one-tab"><li id="li_M01" class="on"><a href="javascript:fnFAQGoSearch('M01', '', 'M');">회원정보</a></li><li id="li_M02"><a href="javascript:fnFAQGoSearch('M02', '', 'M');">주문</a></li><li id="li_M03"><a href="javascript:fnFAQGoSearch('M03', '', 'M');">결제</a></li><li id="li_M04"><a href="javascript:fnFAQGoSearch('M04', '', 'M');">배송</a></li><li id="li_M05"><a href="javascript:fnFAQGoSearch('M05', '', 'M');">취소/환불</a></li><li id="li_M06"><a href="javascript:fnFAQGoSearch('M06', '', 'M');">반품/교환/AS</a></li><li id="li_M07"><a href="javascript:fnFAQGoSearch('M07', '', 'M');">서비스/불편사항</a></li><li id="li_M09"><a href="javascript:fnFAQGoSearch('M09', '', 'M');">여행/숙박</a></li><li class="last-tab" id="li_M08"><a href="javascript:fnFAQGoSearch('M08', '', 'M');">안전거래</a></li></ul>
				</div>
				<div id="tabCont1" class="tab-cont" style="display: block;">
					<h2 class="title-hidden">판매</h2>
					<ul class="two-tab"><li id="subLi_" class="on"><a href="javascript:fnFAQGoSearch('M01', '', 'M');"><p style="letter-spacing:-2px;">전체(44)</p></a></li><li id="subLi_01"><a href="javascript:fnFAQGoSearch('M01', '01', 'M');"><p style="letter-spacing:-2px;">회원가입/정보수정</p></a></li><li id="subLi_02"><a href="javascript:fnFAQGoSearch('M01', '02', 'M');"><p style="letter-spacing:-2px;">아이디/비밀번호</p></a></li><li id="subLi_03"><a href="javascript:fnFAQGoSearch('M01', '03', 'M');"><p style="letter-spacing:-2px;">로그인</p></a></li><li id="subLi_04"><a href="javascript:fnFAQGoSearch('M01', '04', 'M');"><p style="letter-spacing:-2px;">탈퇴/재가입</p></a></li><li id="subLi_05"><a href="javascript:fnFAQGoSearch('M01', '05', 'M');"><p style="letter-spacing:-2px;">구매등급</p></a></li></ul>
					<div id="tabCont1-0" class="subtab-cont" style="display: block;">
						<h3 class="title-hidden">판매 - 전체</h3>
						<div class="inquiry-board qna-board">
							<table summary="자주찾는 문의의 구분, 질문제목 및 답변">
								<caption>판매 - 전체 자주찾는 문의</caption>
								<colgroup>
									<col style="width:14%;">
									<col>
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">질문제목 및 답변</th>
									</tr>
								</thead>
								<tbody id="faqListTbody"><tr id="M0103001" class="questions"><td class="division">로그인</td><td onclick="fnFaqContentShow('M0103001');">	<div class="subject">		<strong>로그인이 안돼요.                                                                      </strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0103001"></a></span>	</div></td></tr><tr class="answer" id="M0103001_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0103001_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0103001', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0103001', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0103001_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0103001');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0103001');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0103001','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0104001" class="questions"><td class="division">탈퇴/재가입</td><td onclick="fnFaqContentShow('M0104001');">	<div class="subject">		<strong>회원탈퇴는 어떻게 하나요?</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0104001"></a></span>	</div></td></tr><tr class="answer" id="M0104001_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0104001_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0104001', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0104001', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0104001_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0104001');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0104001');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0104001','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0101001" class="questions"><td class="division">회원가입/정보수정</td><td onclick="fnFaqContentShow('M0101001');">	<div class="subject">		<strong>회원 정보를 변경하고 싶어요.</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0101001"></a></span>	</div></td></tr><tr class="answer" id="M0101001_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0101001_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0101001', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0101001', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0101001_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0101001');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0101001');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0101001','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0105001" class="questions"><td class="division">구매등급</td><td onclick="fnFaqContentShow('M0105001');">	<div class="subject">		<strong>회원등급은 언제 반영되나요?</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0105001"></a></span>	</div></td></tr><tr class="answer" id="M0105001_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0105001_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0105001', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0105001', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0105001_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0105001');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0105001');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0105001','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0103002" class="questions"><td class="division">로그인</td><td onclick="fnFaqContentShow('M0103002');">	<div class="subject">		<strong>이용제한 상태로 로그인이 되지 않아요.</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0103002"></a></span>	</div></td></tr><tr class="answer" id="M0103002_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0103002_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0103002', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0103002', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0103002_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0103002');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0103002');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0103002','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0104002" class="questions"><td class="division">탈퇴/재가입</td><td onclick="fnFaqContentShow('M0104002');">	<div class="subject">		<strong>재가입은 어떻게 하나요?</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0104002"></a></span>	</div></td></tr><tr class="answer" id="M0104002_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0104002_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0104002', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0104002', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0104002_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0104002');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0104002');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0104002','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0105002" class="questions"><td class="division">구매등급</td><td onclick="fnFaqContentShow('M0105002');">	<div class="subject">		<strong>나의 회원상태를 알고 싶어요.</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0105002"></a></span>	</div></td></tr><tr class="answer" id="M0105002_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0105002_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0105002', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0105002', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0105002_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0105002');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0105002');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0105002','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0104003" class="questions"><td class="division">탈퇴/재가입</td><td onclick="fnFaqContentShow('M0104003');">	<div class="subject">		<strong>새로운 아이디로 재가입 할 수 있나요?</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0104003"></a></span>	</div></td></tr><tr class="answer" id="M0104003_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0104003_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0104003', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0104003', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0104003_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0104003');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0104003');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0104003','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0105003" class="questions"><td class="division">구매등급</td><td onclick="fnFaqContentShow('M0105003');">	<div class="subject">		<strong>구매등급은 어떻게 계산되나요?</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0105003"></a></span>	</div></td></tr><tr class="answer" id="M0105003_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0105003_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0105003', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0105003', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0105003_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0105003');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0105003');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0105003','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr><tr id="M0101002" class="questions"><td class="division">회원가입/정보수정</td><td onclick="fnFaqContentShow('M0101002');">	<div class="subject">		<strong>아이디를  변경하고 싶어요.</strong>		<span class="vh-btn"><a><img src="http://pics.auction.co.kr/customer/ico_view.gif" class="faqListIcons" id="faqListIcon_M0101002"></a></span>	</div></td></tr><tr class="answer" id="M0101002_sub" style="display: none;"><td class="division"></td><td>	<div class="answer-cont">		<div id="M0101002_content"></div>		<dl class="answer-radio">			<dt>궁금하신 내용이 해결 되었나요?</dt>			<dd><label><input id="checky" type="radio" onclick="fnFAQTextBoxShow('M0101002', false);" name="yesorno" value="Y">예</label></dd>			<dd><label class="no-click"><input id="checkn" type="radio" onclick="fnFAQTextBoxShow('M0101002', true);" name="yesorno" value="N">아니오</label></dd>		</dl>		<div class="star-input" id="M0101002_textbox">			<div class="textarea"><textarea class="text_area" rows="10" cols="10" title="평가글" onfocus="fnFaqTextArea('M0101002');" onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea></div>			<p class="text-byte">(<strong><span class="areacount">0</span></strong>/200)</p>		</div>		<div class="rating-btn"><span class="btn-type1"><a href="#" style="cursor:pointer" onclick="fnFAQEvaluateConfirm('M0101002');">평가하기</a></span></div>		<p class="dot-text">더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0101002','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span></p>	</div></td></tr></tbody>
							</table>
						</div>
					</div>
				</div>
				<!-- //자주묻는 질문 Top 10 -->
				
				<!-- 공지사항 이벤트 -->
				<div class="note-event" id="note-event">
					<div class="note-area">
						<div class="title-more">
							<h3 class="sub-title">공지사항</h3>
							<p class="more"><span class="more-link"><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=">더보기</a></span></p>
						</div>
						<ul class="note-event-list"><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13555"><strong>[한국소비자원] OECD 글로벌 인식 개선 캠페인</strong>  </a><span class="date">2019-10-23</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13543"><strong>[안내] 개인정보처리방침 변경 안내</strong>  </a><span class="date">2019-10-18</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13545"><strong>[안내] ㈜이베이코리아 사칭 피해 주의</strong>  </a><span class="date">2019-10-23</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13536"><strong>[점검] 옥션 사이트 이용 일시 중단</strong>  </a><span class="date">2019-10-18</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13509"><strong>[안내] 옥션 사이트 사칭 피해 주의</strong>  </a><span class="date">2019-10-01</span></li></ul>
					</div>
					<div class="event-area">
						<div class="title-more">
							<h3 class="sub-title">이벤트 당첨</h3>
							<p class="more"><span class="more-link"><a href="Notice.aspx?tcode=E&amp;topcode=M&amp;gubun=E" )%="">더보기</a></span></p>
						</div>
						<ul class="note-event-list"><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13559"><strong>[발표] 옥션 싱글데이 『최인아 대표 강연 100원딜』 이벤트 당첨자</strong>  </a><span class="date">2019-10-23</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13515"><strong>[발표]  『필립스 소닉케어 증정』 이벤트 당첨자 안내</strong>  </a><span class="date">2019-10-04</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13512"><strong>[발표] 옥션 『최애의 최애템 프로미스나인 100원 기부딜』 이벤트 당첨자</strong>  </a><span class="date">2019-10-02</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13330"><strong>[발표] 『스마일클럽 7월 친구초대』 이벤트 당첨자</strong>  </a><span class="date">2019-08-09</span></li><li><a href="Notice.aspx?tcode=&amp;topcode=M&amp;gubun=&amp;seqno=13318"><strong>[발표] 옥션 취향존중 『이승우 슈퍼콘 광고 착용의상 100원딜』 이벤트 당첨자</strong>  </a><span class="date">2019-08-05</span></li></ul>
					</div>
				</div>
				<!-- //공지사항 이벤트 -->
				<!-- 고객센터 문의 내역 -->
				<div class="title-more" id="title-more" style="display:none">
					<h3 class="sub-title">고객센터 문의 내역</h3>
				
				</div>

				<div class="inquiry-list-board" style="display:none">
					
					</div>
					
					<div id="plz_login_notice" align="center">
						<br>
						<span><a href="http://member.auction.co.kr/help/FAQUserMailList.aspx?topCode=M">로그인</a> 하시면 문의하신 내역을 확인하실 수 있습니다.</span>
					</div>
					<p></p>
				<!-- //고객센터 문의 내역 -->
				<!-- 문의채널 -->
				
				<!-- //문의채널 -->

			</div>
			<!-- //cont -->
		</div>
		<!-- //contents -->
	</div>
	<!-- //body -->

	<!-- footer -->
	<script src="http://script.auction.co.kr/common/footer.js" type="text/javascript"></script><script type="text/javascript" charset="euc-kr" src="http://script.auction.co.kr/homepage/categoryinfo.js"></script>
<script type="text/javascript" charset="euc-kr" src="http://script.auction.co.kr/common/footer_function.js"></script><div class="footer" role="contentinfo">
	<div class="footer-block footer-block-cs">
		<div class="footer-container">
			<h2>고객센터 및 분쟁처리</h2>
			<div class="footer-section footer-section-first">
				<div class="footer-section-inner">
					<h3>고객센터</h3>
					<address>
						<ul>
							<li>Tel : <strong>1588-0184</strong> (평일 09:00~18:00)</li>
							<li>스마일클럽 &amp; VVIP : <strong>1522-8900</strong> (365일 09:00~18:00)</li>
							<li>경기도 부천시 원미구 부일로 223 (상동) 투나빌딩 6층</li>
							<li class="inline alpha-num">Fax : 02-589-8829<span class="bar"></span>Mail : <a href="https://memberssl.auction.co.kr/help/Mail.aspx?topCode=M&amp;cCode=">information@corp.auction.co.kr</a></li>
						</ul>
					</address>
				</div>
			</div>
			<div class="footer-section">
				<div class="footer-section-inner">
					<h3>(주)이베이코리아</h3>
					<ul>
						<li>서울시 강남구 테헤란로 <span class="alpha-num">152</span> (역삼동 강남파이낸스센터)</li>
						<li>대표이사 : 변광윤</li>
						<li>사업자등록번호 : <span class="alpha-num">220-81-83676</span></li>
						<li>통신판매업신고 : 강남 <span class="alpha-num">10630</span>호 <a href="http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2208183676" class="footer-button" target="_blank"><img src="http://pics.auction.co.kr/common/footer/button_check_biz_info.png" alt="사업자정보 확인"></a></li>
					</ul>
				</div>
			</div>
			<div class="footer-section">
				<div class="footer-section-inner">
					<h3><a href="http://member.auction.co.kr/help/InLineHelp.aspx?newhelpcode=1&amp;code=I02042" onclick="newHelpPop('I02042'); return false;">전자금융 분쟁처리</a></h3>
					<ul>
						<li class="inline alpha-num">Tel : 1588-0184</li>
						<li class="inline alpha-num">Fax : 02-589-8833</li>
						<li class="alpha-num">Mail : <a href="mailto:mediation@corp.auction.co.kr">mediation@corp.auction.co.kr</a></li>
						<li class="footer-links">							<a class="footer-link" href="#" onclick="openLayer('layer-complainprocess__wrap');return false">분쟁처리절차&gt;</a>							<!-- .layer-contentspromotion__wrap -->							<div id="layer-complainprocess__wrap" class="layer-footerdimmed__wrap" style="display:none">								<div class="layer-footerdimmed layer-complainprocess">									<div class="layer-footerdimmed__inner">										<h4 class="layer-footerdimmed__title">고객 불만/불편사항 처리절차 안내</h4>										<div class="layer-footerdimmed__content">											<p class="layer-complainprocess__description"><strong>옥션은 거래 과정에서 발생하는 판매자와의 분쟁</strong> 또는 <strong>옥션이 제공하는 서비스에 대한 불만을 신속, 공정하게 해결</strong>하기 위해 고객님의 목소리에 귀를 기울이고 분쟁해결을 위해 최선을 다하겠습니다.</p>											<p class="layer-complainprocess__diagram sprite-footer">												<span class="forA11y">처리절차 - 고객문의 접수, 문의내용 분석, 문의해결, 처리결과 안내, 서비스 개선 </span>											</p>											<strong class="layer-complainprocess__list-title">처리절차 및 결과 안내, 서비스 개선</strong>											<ol class="layer-complainprocess__list">												<li>1. 고객 문의에 대한 ‘판/구매자’, ‘정책’, ‘시스템’ 내용을 분석합니다.</li>												<li>2. 문의 일로부터 3영업일 이내 처리결과를 고객에게 안내합니다.</li>												<li>3. 문의 분석 내용에 따라 추가 확인이 필요한 경우 10영업일 이내 처리결과 또는 향후 진행상황을 고객에게 안내합니다.</li>												<li>4. 문의 유형에 따라 처리 해결이 10영업일 이상 소요될 수 있습니다.</li>												<li>5. 사이트 개선, 정책 개선, 판매자 서비스 등을 개선합니다.</li>											</ol>											<strong class="layer-complainprocess__list-title">옥션 고객센터 이용 안내</strong>											<ol class="layer-complainprocess__list">												<li>1. 대표전화 : 1588-0184</li>												<li>2. 상담가능시간 : 평일 오전 9시 ~ 오후 6시 (공휴일 휴무)</li>												<li>3. 메일 문의 : 옥션 &gt; 고객센터 &gt; <a href="https://memberssl.auction.co.kr/help/mail.aspx?topCode=M&amp;seller=AUCTION_HELP&amp;seqno=" target="_blank" title="새창">1:1 문의하기</a></li>											</ol>										</div>										<button class="button-layerclose sprite-footer" onclick="closeLayer('layer-complainprocess__wrap');return false;">닫기</button>									</div>								</div>								<div class="dimmed"></div>							</div>							<!-- // .layer-contentspromotion__wrap -->						</li>						<li class="footer-links"><a class="footer-link" href="http://www.auction.co.kr/IScenter/securitycenterguide_1_1.html" onclick="fn_WindowPopup('http://securitycenter.auction.co.kr/apps/main/?code=A0000',960,650);return false;">안전거래센터&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="footer-block footer-block-compressed">
		<div class="footer-container">
			<ul class="footer-horiz-list">
				<li><a href="https://recruit.ebaykorea.com/">채용정보</a></li>
				<li><a href="http://member.auction.co.kr/Membership/signup/UserStipulation.aspx">이용약관</a></li>
				<li><a href="http://member.auction.co.kr/Membership/signup/Finance.aspx">전자금융거래약관</a></li>
				<li><a href="http://member.auction.co.kr/Membership/Signup/Privacy.aspx"><strong>개인정보 처리방침</strong></a></li>
				<li><a href="http://adcenter.auction.co.kr/BrandAd/" target="_blank">브랜드 광고센터</a></li>
				<li><a href="http://adcenter.auction.co.kr/" target="_blank">판매자 광고센터</a></li>
			</ul>
		</div>
	</div>
	<div class="footer-block footer-block-copyright">
		<div class="footer-container">
			<p>㈜ 이베이코리아 사이트의 상품/판매자/쇼핑 정보, 콘텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등에 의하여 엄격히 금지됩니다. <a href="#" class="link--emphasis" onclick="openLayer('layer-contentspromotion__wrap');return false">콘텐츠산업 진흥법에 따른 표시</a></p>			<!-- .layer-contentspromotion__wrap -->			<div id="layer-contentspromotion__wrap" class="layer-footerdimmed__wrap" style="display:none">				<div class="layer-footerdimmed layer-contentspromotion">					<div class="layer-footerdimmed__inner">						<h4 class="layer-footerdimmed__title">콘텐츠산업 진흥법에 따른 표시</h4>						<div class="layer-footerdimmed__content">							<strong class="layer-contentspromotion__content-title"><span class="layer-contentspromotion__icon sprite-footer"></span>콘텐츠산업 진흥법에 따른 표시</strong>							<ol class="layer-contentspromotion__list">								<li>1. 콘텐츠의 명칭 : 상품/판매자/쇼핑정보</li>								<li>2. 제작연월일 : 개별콘텐츠의 개시일 또는 갱신일</li>								<li>3. 제작자 : (주)이베이코리아 및 개별판매자</li>							</ol>							<p class="layer-contentspromotion__discription">(주)이베이코리아 사이트 상의 콘텐츠는 <strong>‘콘텐츠산업 진흥법’</strong>에 따라<br>개시일 또는 갱신일로부터 5년간 보호됩니다.</p>							<p class="layer-footerdimmed__bts">								<button class="layer-footerdimmed__button-close" onclick="closeLayer('layer-contentspromotion__wrap');return false;">닫기</button>							</p>						</div>						<button class="button-layerclose sprite-footer" onclick="closeLayer('layer-contentspromotion__wrap');return false;">닫기</button>					</div>				</div>				<div class="dimmed"></div>			</div>			<!-- // .layer-contentspromotion__wrap -->			<p><em>옥션은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 옥션은 상품 · 거래정보 및 거래에 대하여 책임을 지지 않습니다.</em></p>
			<p class="footer-copyright">Copyright © <strong>eBay Korea Co., Ltd.</strong> All rights reserved.</p>
		</div>
	</div>
</div><div id="min_fixed"></div><div id="divuwing"></div></div></div><img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?id=322230407984978&amp;ev=PixelInitialized">
<script type="text/javascript" charset="euc-kr" src="http://script.auction.co.kr/common/happynote.js"></script>

	<!-- //footer -->
</div>
<!-- //wrap -->

	<!-- ARS 레이어 팝업 -->
	<div class="ars-area">
		<div class="ars-layer">
			<div class="ars-title">ARS구성도</div>
			<div class="ars-cont">
				<div id="ars-buyer" style="">
					<img src="http://pics.auction.co.kr/customer/img_ars_buy.gif" alt="ARS구성도(구매전용)">
				</div>
				<div id="ars-seller" style="display:none;">
					<img src="http://pics.auction.co.kr/customer/img_ars_sell.gif" alt="ARS구성도(판매전용)">
				</div>
			</div>
			<span class="ars-close" onclick="arsLayer();"><img src="http://pics.auction.co.kr/customer/btn_ars_close.png" alt="닫기"></span>
		</div>
		<div class="dimed-area" onclick="arsLayer();">dimed영역</div>
	</div>
	<!-- //ARS 레이어 팝업 -->




</div><div class="core_skip_top" style="display: none;"><a href="#" id="btnSkipTop" title="상단으로 이동">상단으로 이동</a></div><div class="core_sitemap" id="coreSitemap" style="position: absolute; top: 0px; left: 40px; z-index: 1000002; display: none;"></div></body></html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>YHMH</title>

<!-- Bootstrap core CSS -->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="./vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="./vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./css/creative.min.css" rel="stylesheet">
</head>
<script language=JavaScript>
	
	var guselectbox = new Array('강서구','금정구','기장군','남구','동구','동래구','부산진구','북구','사상구','사하구','	서구','수영구','연제구','영도구','	중구','해운대구');
	var dongselectbox = new Array();
	dongselectbox[0] = new Array('명지동','신호동','지사동');		//강서구
	dongselectbox[1] = new Array('구서동','금사동','남산동','	부곡동','서동','장전동','청룡동','	회동동');		//금정구
	dongselectbox[2] = new Array('기장읍교리','기장읍대라리','	기장읍동부리','	기장읍서부리','	기장읍청강리','	일광면삼성리','	일광면이천리','	정관읍달산리','	정관읍모전리','	정관읍용수리','	기장읍내리','정관읍매학리',
			'정관읍방곡리','기장읍대변리','철마면고촌리','	장안읍명례리','	장안읍좌천리');		//기장군
	dongselectbox[3] = new Array('감만동','대연동','문현동','	용당동','용호동','우암동');		//남구
	dongselectbox[4] = new Array('범일동','수정동','좌천동','초량동');		//동구
	dongselectbox[5] = new Array('낙민동','명륜동','명장동','복천동','사직동','수안동','안락동','온천동','칠산동');		//동래구
	dongselectbox[6] = new Array('가야동','개금동','당감동','범천동','부암동','부전동','양정동','연지동','전포동','초읍동','범전동');		//부산진구
	dongselectbox[7] = new Array('구포동','금곡동','덕천동','	만덕동','화명동');		//북구
	dongselectbox[8] = new Array('괘법동','덕포동','모라동','삼락동','엄궁동','주례동','학장동','감전동');		//사상구
	dongselectbox[9] = new Array('감천동','괴정동','구평동','	다대동','당리동','신평동','장림동','하단동');		//사하구
	dongselectbox[10] = new Array('남부민동','	동대신동','부민동','서대신동','암남동','토성동','아미동','충무동','부용동','초장동');		//서구
	dongselectbox[11] = new Array('광안동','남천동','망미동','민락동','수영동');		//수영구
	dongselectbox[12] = new Array('거제동','연산동');		//연제구
	dongselectbox[13] = new Array('동삼동','봉래동','신선동','영선동','청학동','남항동','대평동','대교동');		//영도구
	dongselectbox[14] = new Array('동광동','보수동','부평동','신창동','영주동','대청동','대창동','중앙동');		//중구
	dongselectbox[15] = new Array('반송동','반여동','송정동','우동','재송동','좌동','중동');		//해운대구



function init(f) {
	var gu = f.selectgu;
	var dong = f.selectdong;
	
	gu.options[0] = new Option("구를 선택하세요","");
	dong.options[1] = new Option("동을 선택하세요","");
	
	for(var i = 0; i < guselectbox.length; i++) {
		gu.options[i+1] = new Option(guselectbox[i], guselectbox[i]);
		}
	}

function itemChange(f) {
	var gu = f.selectgu;
	var dong = f.selectdong;
	
	var sel = gu.selectedIndex;
	for(var i=dong.length; i>=0; i--) {
		dong.options[i] = null;
	}
	
	dong.options[0] = new Option("동을 선택하세요","");
	
	if(sel != 0){
		for(var i=0; i<dongselectbox[sel-1].length; i++) {
			dong.options[i+1] = new Option(dongselectbox[sel-1][i], dongselectbox[sel-1][i]);
		}
	}
}

function goDetail() {
	var textGu = document.form.selectgu.options[document.form.selectgu.selectedIndex].text;
	var indexGu = document.form.selectgu.selectedIndex;
	var textDong = document.form.selectdong.options[document.form.selectdong.selectedIndex].text;
	var indexDong = document.form.selectdong.selectedIndex;

//	location.href="./searchDetail.jsp"
    location.href="./searchDetail.jsp?textGu=" + textGu +"&indexGu=" + indexGu+"&textDong=" + textDong+"&indexDong=" + indexDong; 
//	location.href="/YHMH/mainController?action=goDetail&gu=" + gu + "&dong=" + dong;
}

	
</script>
<body onload="init(this.form);">
<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav"> <a class="navbar-brand" href="#page-top">YHMH</a>
	<button class="navbar-toggler navbar-toggler-right" type="button"
		data-toggle="collapse" data-target="#navbarResponsive"
		aria-controls="navbarResponsive" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="#about">About</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#services">Services</a>
			</li>

			<li class="nav-item"><a class="nav-link" href="#contact">Contact</a>
			</li>
		</ul>
	</div>
	</nav>

	<header class="masthead">
	<div class="header-content">
		<div class="header-content-inner">
			<h1 id="homeHeading">Your Home My Home</h1>
			<hr>
			<a class="btn btn-primary btn-xl" href="#about">Find Out More</a>
		</div>
	</div>
	</header>

	<section class="bg-primary" id="about">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mx-auto text-center">
				<h2 class="section-heading text-white">Budongsan Analsyis</h2>
				<p>부산 지역의 부동산 시세 예측</p>
				<hr class="light">
				<a class="btn btn-default btn-xl sr-button" href="#services">Get
					Started!</a>
			</div>
		</div>
	</div>
	</section>

	<section id="services">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">

				<form name="form">
					<select align="right" name="selectgu" id="selectgu"
						onchange="itemChange(this.form)"></select> <select align="right"
						name="selectdong" id="selectdong"></select> <input align="right"
						type="button" value="검색" onclick="goDetail()">
				</form>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive"></div>
				<hr class="primary">
			</div>
			<div class="text-center" align="center">

      <iframe width="1200" height="400" src="pusan2016.html" frameborder="1">
			</div>
		</div>
	</div>
	</section>


	<div class="call-to-action bg-dark">
		<div class="container text-center"></div>
	</div>

	<section id="contact">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mx-auto text-center">
				<h2 class="section-heading">빅데이터 청년인재 양성교육</h2>
				<hr class="primary">
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4 ml-auto text-center">
				<i class="fa fa-phone fa-3x sr-contact"></i>
				<p>010-0000-0000</p>
			</div>
			<div class="col-lg-4 mr-auto text-center">
				<i class="fa fa-envelope-o fa-3x sr-contact"></i>
				<p>
					<a href="mailto:your-email@your-domain.com">feedback@naver.com</a>
				</p>
			</div>
		</div>
	</div>
	</section>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/popper/popper.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/creative.min.js"></script>

</body>
</html>
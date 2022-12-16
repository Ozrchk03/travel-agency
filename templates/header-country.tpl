{* smarty *}

<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<title>TRAVEL</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">
	{*	<link rel="stylesheet" href="libs/css/bootstrap-icons-1.8.1/bootstrap-icons.css">*}
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.spincrement.min.js"></script>
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

	<script>
		const pageType='{$pageType}';
		const loggedIn=parseInt({$userLoggedIn});
	</script>
</head>
<body>

<div class="blackout-bg"></div>
<div class="banner">
	{if $mainHeader==true}<div class="bg-img {$headerBG}" style="{if strlen($headerBGImage)}background: url('{$headerBGImage}');background-size:cover;{/if}"></div>{/if}
	<div class="header-menu">
		<div class="container">
			<div class="menu-btn">
				<img src="images/menu.png">
				<span id="menu" class="menu-title">МЕНЮ</span>
			</div>
			<div id="menu-line" class="menu-container hidden">
				<nav>
					<li><a class="menu-line-item" href="#tours">Тури</a></li>
					<li><a class="menu-line-item" href="#photos">Фото</a></li>
					<li id="main-page-country"><a class="menu-line-item" href="index.php">Головна сторінка</a></li>
					<li id="countries-country"><a class="menu-line-item" href="countries.php">Країни</a></li>
				</nav>
			</div>
			<div class="search">
				<input name="search" class="search-input" id="srch" placeholder="Введіть країну">
				<ul class="search-input">
					<li><div>Україна</div></li>
					<li><div>Бразилія</div></li>
					<li><div>Греція</div></li>
					<li><div>Мальдіви</div></li>
					<li><div>Таїланд</div></li>
				</ul>
				<div id="search-img">
					<img id="search-icon" class="bi-search" src="images/search-icon.png">
				</div>
			</div>
			<div class="profile">
				<a href="signIn.php"><img class="bi-person-circle" src="images/userAccount.png"></a>
			</div>
		</div>
	</div>

	{if $mainHeader==true}

	<div class="content-align" data-aos="fade-up" data-aos-duration="1000">
		<div class="travel-header">
			<img src="{$main_image_caption}" class="letter">
		</div>
		<div class="title-company">{$region_name}</div>
		<div class="info-banner">
			<div class="text-info" data-aos="fade-up" data-aos-duration="1000" data-aos-delay="50">
				{$country_description}
			</div>
		</div>
	</div>
	{/if}
</div>
<!--            end banner-->

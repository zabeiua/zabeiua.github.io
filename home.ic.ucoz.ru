


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>News</title>

<link rel="icon" type="image/ico" href="http://ic.ucoz.ru/favicon/favicon.ico" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script src="js/jquery-ui-1.9.0.custom.js"></script>

<link href="css/smoothness/jquery-ui-1.9.0.custom.css" rel="stylesheet">

<!--function ChangeSrc BEGIN -->

<script type="text/javascript">

function ChangeSrc(src){

  var iframe = document.getElementById('iframe_id');

  iframe.setAttribute('src',s);

}

</script>

 <script>

  $(function() {

    $( "#accordion" ).accordion({

      heightStyle: "content"

    });

  });

  </script>

<!--function ChangeSrc END -->

<script>

$(document).ready(function(){

	  $( ".fadeout" ).delay( 20000 ).slideUp( 900 );

///////BUTTON//////////

$(".a")

    .button()

    .click(function( event ) {

      event.preventDefault();

   $("#iframe_id").removeAttr( "sandbox" )

;

/////////makes iframe simple, without sandbox////////////

    });

	

	

	

$(".b")

    .button()

    .click(function( event ) {

      event.preventDefault();

   $("#iframe_id").attr("sandbox", "allow-forms allow-scripts allow-same-origin");

/////////makes iframe with sandbox////////////

    });

$(".c")

    .button()

	

	

	

	

	

	

	

	

    ////////TABS////////////

$(function() {

  $( "#tabs" ).tabs({

    event: "mouseover"

  });

});

/////end tabs/////////////

/////scrolling="yes"///////

    $('#settingsbutton').attr('title', 'HIDE SETTINGS').click(function() {

         $(this)

            .toggleClass('checked')

            .attr('title', $(this).hasClass('checked') ? "SHOW SETTINGS":'HIDE SETTINGS');

			$("#settings").toggle('bounce');

    });











//////end scrolling="yes"/////////////////////

/////SHOW-HIDE/////////////////

$("#button3").click(function () {

   $(this).hide( "drop" );

   $("#tabs").toggle( "drop" );

       $("#button4").fadeIn();

               $("#iframe_id").animate({"width":"99%"});

$("#iframe_id").animate({"left":"10px"});

$("#links").hide();

$("#settings").hide();

$("#settingsbutton").hide();



//$('#iframe_id').contents().find( "a" ).css( "background-color", "#BADA55" );



       });

$("#button4").click(function () {

   $(this).hide( "drop", {direction: "right"} );

   $("#tabs").toggle( "drop" );

   $("#button3").fadeIn("slow");

   $("#iframe_id").animate({"left":"535px"});

   $("#iframe_id").animate({"width":"61%"});

      $("#links").fadeIn(3000);

	        $("#settings").fadeIn(3000);

				        $("#settingsbutton").fadeIn(3000);











   });

   

$("#button5").click(function () {

    $(this).css({"display" : "none"});

   $("#button6").css({"display" : "inline-block"});

    $("#iframe_id").animate({"height":"100%" });

});

$("#button6").click(function () {

    $(this).css({"display" : "none"});

   $("#button5").css({"display" : "inline-block"});

    $("#iframe_id").animate({"height":"1500" });

});





$("#button7").click(function () {

    $(this).css({"display" : "none"});

   $("#button8").css({"display" : "inline-block"});

    $("body").css({"background-color":"black" });

	$("#logo").css({"display" : "none"});

});



$("#button8").click(function () {

    $(this).css({"display" : "none"});

   $("#button7").css({"display" : "inline-block"});

    $("body").css({"background-color":"#F8F8F8"});

		$("#logo").css({"display" : "inline-block"});



});







});

</script>

<style>

body {

	font: 62.5% "Trebuchet MS", sans-serif;

	overflow: hidden;

	margin-right:-3px;

}

img {

	border:0px

}

.a {

	margin:2px;

	min-width:135px;

}

.b {

	margin:2px;

	min-width:135px;

}

.c {

	margin:2px;

	min-width:135px;

}

.tabs_class {

	text-align:center;

}

.bubble_101 {

	border:0px;

	-moz-box-shadow: 5px 5px 5px #888;

	-webkit-box-shadow: 5px 5px 5px #888;

	box-shadow: 5px 5px 5px #888;

	margin:5px;

	width: 59px;

	height: 60px;

}

.bubble_101:hover {

	-moz-box-shadow: 10px 10px 10px #888;

	-webkit-box-shadow: 10px 10px 10px #888;

	box-shadow: 10px 10px 10px #888;

}

#settingsbutton {

	opacity:0.4;

	filter:alpha(opacity=40); /* For IE8 and earlier */

}

#settingsbutton:hover {

	opacity:1.0;

	filter:alpha(opacity=100); /* For IE8 and earlier */

}

a {

	margin-right:5px;

	text-decoration:none;

}

a:hover {

	text-decoration:underline;

	color:blue;

}

#button3 {

	z-index:2;

	position:absolute;

	left:528px;

	top:350px;

	cursor: pointer;

	-webkit-border-top-right-radius: 4px;

	-webkit-border-bottom-right-radius: 4px;

	-moz-border-radius-topright: 4px;

	-moz-border-radius-bottomright: 4px;

	border-top-right-radius: 4px;

	border-bottom-right-radius: 4px;

	border-top:1px solid #aaaaaa;

	border-bottom:1px solid #aaaaaa;

	border-right:1px solid #aaaaaa;

}

#button3:hover {

	-moz-box-shadow: 5px 5px 5px #888;

	-webkit-box-shadow: 5px 5px 5px #888;

	box-shadow: 5px 5px 5px #888;

}

#button4 {

	z-index:2;

	position:absolute;

	left:0px;

	top:350px;

	opacity:0.4;

	filter:alpha(opacity=40);

	cursor: pointer;

	-webkit-border-top-right-radius: 4px;

	-webkit-border-bottom-right-radius: 4px;

	-moz-border-radius-topright: 4px;

	-moz-border-radius-bottomright: 4px;

	border-top-right-radius: 4px;

	border-bottom-right-radius: 4px;

	display:none;

	border-top:1px solid #aaaaaa;

	border-bottom:1px solid #aaaaaa;

	border-right:1px solid #aaaaaa;

}

#button4:hover {

	opacity:1.0;

	filter:alpha(opacity=100); /* For IE8 and earlier */

	-moz-box-shadow: 5px 5px 5px #888;

	-webkit-box-shadow: 5px 5px 5px #888;

	box-shadow: 5px 5px 5px #888;

}

.bold {

	font-weight:bold

}

</style>

</head>



<body marginwidth="0" style="background-color:#F8F8F8; font-size:10px">

<?php

include("../mysql/Visitor-Tracker/ip_tracker.php");

?>

<img id="settingsbutton" style="position:absolute; left:10px; top:10px; cursor: pointer;" src="settingsbutton.png" width="24" height="23" />

<div id="settings" style="position:absolute; left:40px; top:6px;">

  <span class="a" id="button5" style="display:none">

  LOW

  </span>

  <span class="a" id="button6" >

  HIGH

  </span>

  <span class="a" id="button7" >

  DARK

  </span>

  <span class="a" id="button8" style="display:none">

  LIGHT

  </span>

</div>

<img id="button3" src="http://ic.ucoz.ru/img/arrow_hide.png"/> <img id="button4" src="http://ic.ucoz.ru/img/arrow_show.png"/>

<div id="tabs" style="position:absolute; top:40px; left:10px; width:32%; min-width:515px; min-height:90%;">

  <ul>

    <li><a href="#tabs-1">WORLD</a></li>    <li><a href="#tabs-2">RUSSIA</a></li>



    <li><a href="#tabs-3">ONLINE TV</a></li>

    <li><a href="#tabs-4">TWITTER</a></li>

        <li><a href="#tabs-5">RADIO</a></li>



  </ul>

  <div id="tabs-1" class="tabs_class">

    <span class="bold">

    USA:

    </span>

    <br />

    <span class="a" onclick="s='http://www.voanews.com/';ChangeSrc();">

    VOA

    </span>

    <span class="a" onclick="s='http://edition.cnn.com/';ChangeSrc();">

    CNN

    </span>

    <span class="a" onclick="s='http://www.foxnews.com/';ChangeSrc();">

    FOX news

    </span>

    <span class="a" onclick="s='http://live.cnbc.com/Event/Ukraine_crisis_Latest_developments';ChangeSrc();">

    NBC

    </span>

    <span class="a" onclick="s='http://abcnews.go.com/international';ChangeSrc();">

    ABC news

    </span>

    <span class="a" onclick="s='http://www.nytimes.com/';ChangeSrc();">

    NY Times

    </span>

    <span class="a" onclick="s='http://www.washingtonpost.com/';ChangeSrc();">

    washington post

    </span>

    <span class="a" onclick="s='http://www.cbc.ca/';ChangeSrc();">

    cbc canada

    </span> <span class="a" onclick="s='http://www.globalresearch.ca/';ChangeSrc();">globalresearch.ca</span>

    <br />

    <span class="bold">

    UK:

    </span>

    <br /> <span class="a" onclick="s='http://www.bbc.com/news/';ChangeSrc();">

    bbc.co.uk

    </span>

    <span class="a" onclick="s='http://news.sky.com/';ChangeSrc();">

    Sky news

    </span>

    <span class="a" onclick="s='http://www.theguardian.com/';ChangeSrc();">

    theguardian

    </span>

    <br />

    <span class="bold">

    EUROPE:

    </span>

    <br />

   

    <span class="a" onclick="s='http://www.dw.de/';ChangeSrc();">

    dw.de

    </span>

    <span class="a" onclick="s='http://www.thenews.pl/#Logo';ChangeSrc();">

    thenews.pl

    </span>

    <span class="a" onclick="s='http://www.english.rfi.fr/';ChangeSrc();">

    rfi.fr

    </span>

    <span class="a" onclick="s='http://www.france24.com/en/';ChangeSrc();">

    france24

    </span>

    <span class="a" onclick="s='http://www.rtve.es/';ChangeSrc();">

    rtve.es

    </span> <span class="a" onclick="s='http://internacional.elpais.com/';ChangeSrc();">el pais</span>

    <span class="a" onclick="s='http://www.rainews.it/';ChangeSrc();">

    rai.it

    </span>

    <span class="a" onclick="s='http://www.reuters.com/';ChangeSrc();">

    Reuters

    </span>

    <span class="a" onclick="s='http://www.afp.com/en/home/';ChangeSrc();">

    France Press

    </span>

    <span class="a" onclick="s='http://www.spiegel.de/international/';ChangeSrc();">

    spiegel.de

    </span>

    <br />

    <span class="bold">

    UKRAINE:

    </span>

    <br />

    <span class="a" onclick="s='http://espreso.tv/';ChangeSrc();">

    espreso.tv

    </span>

    <span class="a" onclick="s='http://korrespondent.net/';ChangeSrc();">

    korrespondent.net

    </span>

    <span class="a" onclick="s='http://eramedia.com.ua/#main-theme-block';ChangeSrc();">

    Радио Эра. Киев

    </span>

    <span class="a" onclick="s='http://www.unian.net/';ChangeSrc();">

    unian.net

    </span>

    <span class="a" onclick="s='http://podrobnosti.ua/';ChangeSrc();">

    podrobnosti.ua

    </span>

    <span class="a" onclick="s='http://finance.ua/ru/';ChangeSrc();">

    finance.ua

    </span>

    <span class="a" onclick="s='http://ru.tsn.ua/';ChangeSrc();">

    tsn.ua

    </span> <span class="a" onclick="s='http://112.ua/';ChangeSrc();">112.ua</span> <span class="a" onclick="s='http://ukrstream.tv/';ChangeSrc();">ukrstream.tv</span>

    

    <br />

    <span class="bold">

    WORLD:

    </span>

    <br />

    <a class="c" href="https://news.google.com" target="_blank">news.google.com</a>

    <span class="a" onclick="s='http://www.aljazeera.com/';ChangeSrc();">

    aljazeera

    </span> <span class="a" onclick="s='http://sana.sy/index_eng.html';ChangeSrc();">sana.sy</span>

    <span class="a" onclick="s='http://www3.nhk.or.jp/nhkworld/';ChangeSrc();">

    NHK. Japan

    </span>

    <span class="a" onclick="s='http://english.cntv.cn/';ChangeSrc();">

    CCTV. China

    </span> <span class="a" onclick="s='http://www.xinhuanet.com/english/';ChangeSrc();">xinhua. China</span> <span class="a" onclick="s='http://www.infobae.com/temas/crisis-ucrania-a4567';ChangeSrc();">infobae.argentina</span>

    <br />

  </div>

  <div id="tabs-2" class="tabs_class">

   <span class="a" onclick="s='http://www.c-inform.info/';ChangeSrc();">Крым информ</span>

    <span class="a" onclick="s='http://www.interfax.ru/';ChangeSrc();">

    interfax

    </span>

    <span class="a" onclick="s='http://ria.ru/';ChangeSrc();">

    ria.ru

    </span>

    <span class="a" onclick="s='http://itar-tass.com/';ChangeSrc();">

    itar-tass.com

    </span>

    <span class="a" onclick="s='http://www.vesti.ru/videos?vid=onair';ChangeSrc();">

    Россия 24

    </span>

    <span class="a" onclick="s='http://lenta.ru/';ChangeSrc();">

    lenta.ru

    </span>

    

    <!--    class b will diallow allow-top-navigation 

 -->

    <span class="b" onclick="s='http://news.mail.ru/';ChangeSrc();">

    news.mail.ru

    </span>

    <span class="a" onclick="s='http://news.yandex.ru/';ChangeSrc();">

    news.yandex.ru

    </span>

    <span class="a" onclick="s='http://russian.rt.com/';ChangeSrc();">

    russian.rt.com

    </span>

    <span class="a" onclick="s='http://www.rbc.ru/';ChangeSrc();">

    rbc

    </span>

    <span class="a" onclick="s='http://www.utro.ru/';ChangeSrc();">

    utro.ru

    </span>

    <span class="a" onclick="s='http://www.kp.ru/';ChangeSrc();">

    kp

    </span> <span class="a" onclick="s='http://www.mk.ru/';ChangeSrc();">mk</span>

    <span class="a" onclick="s='http://www.pravda.ru/';ChangeSrc();">

    pravda.ru

    </span>

    <span class="a" onclick="s='http://www.aif.ru/';ChangeSrc();">

    aif.ru

    </span>

    <span class="a" onclick="s='http://newsland.com#pageHeader';ChangeSrc();">

    newsland.com

    </span>

    <span class="a" onclick="s='http://www.regnum.ru/';ChangeSrc();">

    regnum

    </span>

    <span class="a" onclick="s='http://inosmi.ru/';ChangeSrc();">

    inosmi.ru

    </span> <a class="c" href="http://lingualeo.ru/jungle/collection/64809" target="_blank">inosmi in english</a> <span class="a" onclick="s='http://mirtesen.ru/';ChangeSrc();">mirtesen.ru</span> <span class="a" onclick="s='http://www.ridus.ru/';ChangeSrc();">ridus.ru/</span>

    <span class="a" onclick="s='http://feedly.com/';ChangeSrc();">

    feedly.com

    </span>

    <br />

    <span class="bold">

    ANTI KREMLIN:

    </span><br />

    <span class="a" onclick="s='http://tvrain.ru/rubrics/novosti/';ChangeSrc();">

Дождь

    </span>

    

    

    

    

    

    

    

    <span class="a" onclick="s='http://echo.msk.ru/';ChangeSrc();">

Эхо Москвы

    </span> <span class="a" onclick="s='http://navalny.livejournal.com/';ChangeSrc();">navalny.livejournal</span>

    <br />

    <span class="bold">

    HUMOUR:

    </span>

    <br />

     <span class="a" onclick="s='http://www.yaplakal.com/';ChangeSrc();">yaplakal</span><span class="a" onclick="s='http://peretz.ru/';ChangeSrc();">

    peretz.ru

    </span> <span class="a" onclick="s='http://pikabu.ru/';ChangeSrc();">pikabu.ru</span>

</div>

  <div id="tabs-3" class="tabs_class">

    <span class="a" onclick="s='http://www.youtube.com/embed/Y_LFrMcoEm4?autoplay=1';ChangeSrc();">

    Espreso. Киев

    </span>

    <span class="a" onclick="s='http://atr.ua/live';ChangeSrc();">

    ATR. Крым

    </span>

    <span class="a" onclick="s='http://rt.com/on-air#mediaplayerwrapper';ChangeSrc();">

    RT English

    </span>

    <span class="a" onclick="s='http://www.vesti.ru/videos?vid=onair';ChangeSrc();">

    Россия 24

    </span> <span class="a" onclick="s='http://torrent-tv.ru/torrent-online.php?translation=407';ChangeSrc();">Россия24.Torrent.tv</span>

    <span class="a" onclick="s='http://www.ren-tv.com/';ChangeSrc();">

    Рен-ТВ

    </span>

    

    <span class="a" onclick="s='http://english.cntv.cn/live/p2p/index.shtml';ChangeSrc();">

    CCTV. China

    </span>

    <span class="a" onclick="s='http://www.cntv.ru/live/index.shtml';ChangeSrc();">

    CCTV. Pусский

    </span>

    <span class="a" onclick="s='http://kbsworld.kbs.co.kr/vod.html?mode=live';ChangeSrc();">

    KBS. Korea

    </span>

    <span class="a" onclick="s='http://news.sky.com/templates/watch-live';ChangeSrc();">

    sky news

    </span> <span class="a" onclick="s='http://www.presstv.ir/live.html';ChangeSrc();">presstv. Iran</span> <span class="a" onclick="s='http://lifenews.ru/';ChangeSrc();">lifenews.ru</span>

<!--/////////////end TV/////////////////////////  -->

    <br />

    <span class="bold">

    IN NEW WINDOW:

    </span>

    <br />

    <a class="c" href="http://stream.1tv.ru/live" target="_blank">1 канал</a> <a class="c" href="http://www.ntv.ru/tv/" target="_blank">HTB</a> <br />

    <span class="bold">

    NEED <a href="https://hola.org/">

    <span style="color:blue;">

    HOLA.ORG

    </span>

    </a> EXTENSION TO WATCH:

    </span>

    <br />

    <a class="c" href="http://anonym.to/?http://www.bbc.co.uk/iplayer/tv/bbc_one_london/watchlive" target="_blank">BBC1</a><a class="c" href="http://www.itv.com/" target="_blank">ITV</a> <a class="c" href="http://www.hulu.com/" target="_blank">Hulu</a> <a class="c" href="http://abc.go.com/watch-live" target="_blank">ABC</a><a class="c" href="http://www.cbs.com/" target="_blank">CBS</a> 

      <br />

    <span class="bold">

    RADIO:

    </span>

    <br />

    

     <a class="c" href="http://www.capitalfm.com/london/on-air/player/" target="_blank">Capital FM</a>  <span class="a" onclick="s='http://app.musicradio.com/lbclondon/on-air/player/';ChangeSrc();">LBC London</span>

 <span class="a" onclick="s='http://mp3.nashe.ru/ru-128.mp3';ChangeSrc();">Говорит Москва</span> 

    <br />

    <span class="bold">

    ОТДЕЛЬНЫЕ ТЕЛЕПЕРЕДАЧИ. В НОВОМ ОКНЕ:

    </span><br />

    <a class="c" href="https://www.google.com/search?q=%D0%BF%D1%83%D1%88%D0%BA%D0%BE%D0%B2+%D0%BF%D0%BE%D1%81%D1%82%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%83%D0%BC&oq=%D0%BF%D1%83%D1%88%D0%BA%D0%BE%D0%B2+%D0%BF%D0%BE%D1%81%D1%82&aqs=chrome.1.69i57j0l5.4044j0j4&sourceid=chrome&espv=210&es_sm=93&ie=UTF-8#q=%D0%BF%D1%83%D1%88%D0%BA%D0%BE%D0%B2+%D0%BF%D0%BE%D1%81%D1%82%D1%81%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D1%83%D0%BC&tbm=vid&tbs=qdr:d" target="_blank">Пушков</a>

    <a class="c" href="https://www.google.com/search?q=+&oq=+&aqs=chrome..69i57j69i61l2j0l2j69i61.265j0j9&sourceid=chrome&espv=210&es_sm=93&ie=UTF-8#q=%D0%B2%D0%BB%D0%B0%D0%B4%D0%B8%D0%BC%D0%B8%D1%80+%D1%81%D0%BE%D0%BB%D0%BE%D0%B2%D1%8C%D0%B5%D0%B2&tbm=vid&tbs=qdr:d" target="_blank">Соловьев</a>

    <a class="c" href="http://www.1tv.ru/sprojects/si=5905" target="_blank">1 канал. Политика</a>

    

</div>

  <div id="tabs-4" class="tabs_class">

    <span class="bold">

    IN NEW WINDOW:

    </span>

    <br /><a href="https://twitter.com/mfa_russia" target="_blank" class="c">Lavrov</a><a class="c" href="https://twitter.com/MedvedevRussia" target="_blank">MedvedevRussia</a>

    <a class="c" href="https://twitter.com/Zhirinovskiy" target="_blank">Zhirinovskiy</a><a class="c" href="https://twitter.com/VRSoloviev" target="_blank">Soloviev</a><a class="c" href="https://twitter.com/tina_kandelaki" target="_blank">tina_kandelaki</a>

    <a class="c" href="https://vk.com/berkut_crimea" target="_blank">berkut_crimea</a>

    

    <br />

    <span class="bold">

    ANTI KREMLIN:

    </span><br /> <a class="c" href="https://twitter.com/EchoMskRu" target="_blank">EchoMskRu</a><a class="c" href="https://www.facebook.com/profile.php?id=100000742473775" target="_blank">Ganapolsky</a><br />

    <span class="bold">

    WEST:

    </span><br /><a class="c" href="https://twitter.com/sikorskiradek" target="_blank">sikorski</a> <a href="https://twitter.com/WilliamJHague"  target="_blank" class="c">Hague</a><a class="c" href="https://twitter.com/BarrosoEU" target="_blank">BarrosoEU</a><a class="c" href="https://twitter.com/AndersFoghR" target="_blank">A.Fogh Rasmussen</a>

    <a class="c" href="https://twitter.com/AP" target="_blank">AP</a>

    

    </div>

<div id="tabs-5" class="tabs_class">

<div id="accordion">

  <h3>Section 1</h3>

  <div>

    <span class="a" onClick="s='http://tunein.com/radio/Radio-Svoboda-1044-s10355/';ChangeSrc();">

    Радио Свобода

    </span>

    <span class="a" onClick="s='http://www.svoboda.org/audio/audio/1070875.html';ChangeSrc();">

    Радио Свобода1

    </span>

    

    <span class="a" onClick="s='radio_stations/97_6.html';ChangeSrc();">

    Вести ФМ

    </span>

    <span class="a" onClick="s='radio_stations/91_2.html';ChangeSrc();">

    Эхо. Moskva.fm

    </span> <span class="a" onClick="s='http://tunein.com/radio/Echo-of-Moscow-912-s8735/';ChangeSrc();">Эхо. Tunein </span>

    <span class="a" onClick="s='radio_stations/91_2_setevizor.html';ChangeSrc();">

    Эхо. Сетевизор

    </span><span class="a" onClick="s='radio_stations/94_8.html';ChangeSrc();">

    Говорит Москва

    </span><span class="a" onClick="s='http://mp3.nashe.ru/ru-128.mp3';ChangeSrc();">Говорит Москва1</span>

    

    

    

    <span class="a" onClick="s='http://dt.moskva.fm/files/4030/mp4/2014/03/17/0400.mp4';ChangeSrc();">test</span>

    <span class="a" title="Передача 1 канала с Иваном Ургантом"onclick="s='http://urgantshow.ru/episodes';ChangeSrc();">

    Вечерний Ургант

    </span>

    <span class="a" onClick="s='http://fmradio-online.ru//';ChangeSrc();">

    Kiev Minsk

    </span>

    <span class="a" title="RadioBells" onClick="s='http://www.radiobells.com/';ChangeSrc();">

    Radio Mix 1

    </span>

    <span class="a" title="online-radio.appspot.com" onClick="s='http://online-radio.appspot.com/chrome1021/argentina.html';ChangeSrc();">

    Radio Mix 2

    </span> <span class="a" onclick="s='http://www.onair.ru/main/documents/view//DID__473/';ChangeSrc();">onair.ru</span>

    <span class="a" title="online-radio.appspot.com" onClick="s='http://eramedia.com.ua/';ChangeSrc();">

    Эра ФМ

    </span>

    <span class="a" title="online-radio.appspot.com" onClick="s='http://vpiter.com/web-camera-hyde1/#player2';ChangeSrc();">

    Камера на Невском

    </span>

    <br />

    <br />

  

    <span class="bold">

    Online mp3 music:

    </span>

    <br />

    <span class="a" onClick="s='http://vk.hart-flamov.ru';ChangeSrc();">

    Meridian Web

    </span>

    <span class="a" title=" J. Iglesias" onClick="s='http://grooveshark.com/#!/julio_iglesias';ChangeSrc();">

    Grooveshark

    </span>

    <span class="a" onClick="s='http://get-tune.net/?a=top&style=popular';ChangeSrc();">

    get-tune.net

    </span>

    <a class="c" href="http://www.pandora.com/" target="_blank">Pandora</a>

    <span class="a" onClick="s='http://www.rdio.com/label/emi_argentina/';ChangeSrc();">

    Rdio

    </span>

    <span class="a" onClick="s='http://zvooq.ru/';ChangeSrc();">

    zvooq.ru

    </span>



    <a href="http://rutracker.org/forum/viewforum.php?f=22" target="_blank">Rutracker Наше Кино</a> | <a href="http://rutracker.org/forum/viewforum.php?f=2200" target="_blank">Фильмы 2013</a> | <a href="http://www.rutor.org/top" target="_blank">rutor.org</a> | <a href="http://thepiratebay.se/" target="_blank" title="Order by Seeders">thepiratebay</a><br />

    <br />

    <a href="http://vk.com/xfilm" target="_blank">Xfilm</a><a href="http://vk.com/kino_mania" target="_blank">Киномания</a> <a href="http://www.hdkinoteatr.com/" target="_blank">hdkinoteatr.com</a> <br />

    <a href="#"> <img class="bubble_101" title="Анекдоты 24 часа подряд" src="http://101.ru/vardata/modules/channel/image/b52c3635e99c098666207144fa64c240.png" onClick="frames['IFrameName1'].location.href='http://101.ru/?an=port_channel_mp3&amp;channel=20'"></a><a href="#"><img class="bubble_101"  title="Звуки Природы" src="http://101.ru/vardata/modules/channel/image/6d74275650f6eaf4226ee8b2bf4acb97.png" onClick="frames['IFrameName1'].location.href='http://101.ru/?an=port_channel_mp3&amp;channel=32'"></a> <a href="#"><img class="bubble_101" title="Колыбельные" src="http://101.ru/vardata/modules/channel/image/5dc1d15b4a6a76659a76f56071188a6b.png" onClick="frames['IFrameName1'].location.href='http://101.ru/?an=port_channel_mp3&amp;channel=95'"></a><a href="#"><img class="bubble_101" title="СССР 50-70" src="http://101.ru/vardata/modules/channel/image/e398102f94f6f0a39a5c714d470e7c50.png" onClick="frames['IFrameName1'].location.href='http://101.ru/?an=port_channel_mp3&amp;channel=47'"></a> <a href="#"><img class="bubble_101" title="Дискотека 80х" src="http://101.ru/vardata/modules/channel/image/d24b95d4587294b24d37eede8221e8a7.png" onClick="frames['IFrameName1'].location.href='http://101.ru/?an=port_channel_mp3&amp;channel=1'"></a><br /><br />





  </div>

  <h4>Все московские радиостанции по алфавиту</h4>

  <div>

    

    <span class="a" onClick="s='radio_stations/90_3.html';ChangeSrc();">

    Авторадио

    </span>

    <span class="a" onClick="s='radio_stations/100_5.html';ChangeSrc();">

    Бест ФМ

    </span>

    <span class="a" onClick="s='radio_stations/87_5.html';ChangeSrc();">

    Бизнес ФМ

    </span>

    <span class="a" onClick="s='radio_stations/94_4.html';ChangeSrc();">

    Весна ФМ

    </span>

    <span class="a" onClick="s='radio_stations/97_6.html';ChangeSrc();">

    Вести ФМ

    </span>

    <span class="a" onClick="s='radio_stations/94_0.html';ChangeSrc();">

    Восток ФМ

    </span><span class="a" onClick="s='radio_stations/94_8.html';ChangeSrc();">

    Говорит Москва

    </span>

    

    

    <span class="a" onClick="s='radio_stations/92_4.html';ChangeSrc();">

    Дача

    </span>

    <span class="a" onClick="s='radio_stations/101_2.html';ChangeSrc();">

    Ди ФМ

    </span>

    <span class="a" onClick="s='radio_stations/96_8.html';ChangeSrc();">

    Детское

    </span>

    <span class="a" onClick="s='http://www.moskva.fm/play/2111/translation';ChangeSrc();">

    Дорожное

    </span>

    <span class="a" onClick="s='radio_stations/106_2.html';ChangeSrc();">

    Европа+

    </span>

    <span class="a" onClick="s='radio_stations/95_6.html';ChangeSrc();">

    Звезда

    </span>

    <span class="a" onClick="s='radio_stations/92_8.html';ChangeSrc();">

    Карнавал

    </span>

    <span class="a" onClick="s='radio_stations/89_9.html';ChangeSrc();">

    Кекс ФМ

    </span>

    <span class="a" onClick="s='radio_stations/100_9.html';ChangeSrc();">

    Классик

    </span>

    <span class="a" onClick="s='radio_stations/102_5.html';ChangeSrc();">

    Комеди

    </span>

    <span class="a" onClick="s='radio_stations/93_6.html';ChangeSrc();">

    Коммерсант ФМ

    </span>

    <span class="a" onClick="s='radio_stations/97_2.html';ChangeSrc();">

    Комс. правда

    </span>

    <span class="a" onClick="s='radio_stations/91_6.html';ChangeSrc();">

    Культура

    </span>

    <span class="a" onClick="s='radio_stations/106_6.html';ChangeSrc();">

    Love radio

    </span>

    <span class="a" onClick="s='radio_stations/105_7.html';ChangeSrc();">

    Максимум

    </span>

    <span class="a" onClick="s='radio_stations/103_4.html';ChangeSrc();">

    Маяк

    </span>

    <span class="a" onClick="s='radio_stations/89_5.html';ChangeSrc();">

    Мегаполис ФМ

    </span>

    <span class="a" onClick="s='radio_stations/107_8.html';ChangeSrc();">

    Мил. волна

    </span>

    <span class="a" onClick="s='radio_stations/102_1.html';ChangeSrc();">

    Монте Карло

    </span><span class="a" onClick="s='radio_stations/92_0.html';ChangeSrc();">

    Москва FM

    </span>

    <span class="a" onClick="s='radio_stations/105_2.html';ChangeSrc();">

    Moscow FM

    </span>

    <span class="a" onClick="s='radio_stations/101_7.html';ChangeSrc();">

    Наше Радио

    </span>

    <span class="a" onClick="s='radio_stations/99_2.html';ChangeSrc();">

    Орфей

    </span>

    <span class="a" onClick="s='radio_stations/98_4.html';ChangeSrc();">

    Рекорд

    </span>

    <span class="a" onClick="s='radio_stations/66_44.html';ChangeSrc();">

    Радио России

    </span>

    <span class="a" onClick="s='radio_stations/90_8.html';ChangeSrc();">

    Релакс ФМ

    </span>

    <span class="a" onClick="s='radio_stations/88_3.html';ChangeSrc();">

    Ретро ФM

    </span>

    <span class="a" onClick="s='radio_stations/107_0.html';ChangeSrc();">

    РСН

    </span>

    <span class="a" onClick="s='radio_stations/72_92.html';ChangeSrc();">

    Радонеж

    </span>

    <span class="a" onClick="s='radio_stations/104_7.html';ChangeSrc();">

    Радио 7

    </span>

    <span class="a" onClick="s='radio_stations/95_2.html';ChangeSrc();">

    Рок ФМ

    </span>

    <span class="a" onClick="s='radio_stations/98_8.html';ChangeSrc();">

    Романтика

    </span>

    <span class="a" onClick="s='radio_stations/105_7.html';ChangeSrc();">

    Русское Радио

    </span>

    <span class="a" onClick="s='radio_stations/94_8.html';ChangeSrc();">

    РУ ФМ

    </span>

    <span class="a" onClick="s='radio_stations/100_1.html';ChangeSrc();">

    Серебр. дождь

    </span>

    <span class="a" onClick="s='radio_stations/87_9.html';ChangeSrc();">

    Сити ФМ

    </span>

    <span class="a" onClick="s='radio_stations/93_2.html';ChangeSrc();">

    Спорт

    </span>

    <span class="a" onClick="s='radio_stations/96_4.html';ChangeSrc();">

    Такси ФМ

    </span>

    <span class="a" onClick="s='radio_stations/99_6.html';ChangeSrc();">

    Финам ФМ

    </span>

    <span class="a" onClick="s='radio_stations/107_4.html';ChangeSrc();">

    Хит ФМ

    </span>

    <span class="a" onClick="s='radio_stations/103_0.html';ChangeSrc();">

    Шансон

    </span>

    <span class="a" onClick="s='radio_stations/98_0.html';ChangeSrc();">

    Шоколад

    </span>

    <span class="a" onClick="s='radio_stations/91_2.html';ChangeSrc();">

    Эхо Москвы

    </span>

    <span class="a" onClick="s='radio_stations/88_7.html';ChangeSrc();">

    Юмор ФМ

    </span>

  </div>

  <h4>Buenos Aires AM and FM radio stations</h4>

  <div>

   

    <a href="#" onClick="s='http://tunein.com/radio/Radio-10-(Buenos-Aires)-710-s101605/?streamid=9552042';ChangeSrc();"><img class="bubble_101" src="http://d1i6vahw24eb07.cloudfront.net/s101605q.png"></a> <a href="#" onClick="s='http://tunein.com/radio/Radio-Mitre-(Buenos-Aires)-790-s25151/';ChangeSrc();"><img class="bubble_101" src="http://d1i6vahw24eb07.cloudfront.net/s25151q.png"></a> <a href="#" onClick="s='http://www.rivadavia.com.ar/streaming24/';ChangeSrc();"><img class="bubble_101" src="http://d1i6vahw24eb07.cloudfront.net/s10166q.png"></a> <a href="#"><img class="bubble_101" src="http://d1i6vahw24eb07.cloudfront.net/s25844q.png" onClick="frames['IFrameName1'].location.href='http://player.streamtheworld.com/liveplayer.php?CALLSIGN=CONTINENTAL'"></a>

    <span class="a" onClick="s='http://tunein.com/radio/La-2x4-FM-927-s84341/';ChangeSrc();">

    Tango. La 2x4

    </span>

    <span class="a" onClick="s='http://www.radio-vale975.com.ar/';ChangeSrc();">

    Vale 97.5

    </span>

    <span class="a" onClick="s='http://www.mega-983.com.ar/';ChangeSrc();">

    Mega 98.3

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/Radio-Nacional---Folkl%C3%B3rica-987-s50428';ChangeSrc();">

    Folklorica 98.7

    </span>

    <span class="a" onClick="s='http://www.pop-radio.com.ar/';ChangeSrc();">

    Pop radio 100.5

    </span>

    <span class="a" onClick="s='http://radiotkm.mundotkm.com/radiotkm.php';ChangeSrc();">

    TKM 103.7

    </span>

    <span class="a" onClick="s='http://www.fmdakota.com/';ChangeSrc();">

    Dakota 104.2

    </span>

    <span class="a" onClick="s='http://www.culturamusical.com.ar/radio_en_vivo.html';ChangeSrc();">

    Amadeus 104.9

    </span>

    <span class="a" onClick="s='http://online-radio.appspot.com/chrome1021/argentina.html';ChangeSrc();">

    chrome app

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/Boreal-FM-925-s102738/';ChangeSrc();">

    Boreal 92.5

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/Buenos-Aires-r100533';ChangeSrc();">

    Buenos Aires

    </span><br>

    <a href="#"><img class="bubble_101" src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/c15.0.150.150/543408_608168449228250_772873065_a.jpg" onClick="frames['IFrameName1'].location.href='http://www.telefe.com/'"></a> <a href="#"><img class="bubble_101" src="http://static.eltrecetv.com.ar/sites/all/themes/eltrecetv2012/logo.png" onClick="frames['IFrameName1'].location.href='http://www.eltrecetv.com.ar/'"></a> <a href="#"><img class="bubble_101" src="http://www.c5nenvivo.com.ar/c5n.jpg" onClick="frames['IFrameName1'].location.href='http://www.c5n.com/'"></a> <a href="#"><img class="bubble_101" src="TV_channels\argentina\tn.png" onClick="frames['IFrameName1'].location.href='http://tn.com.ar/envivo/24hs/hd'"></a><a href="#"><img class="bubble_101" src="TV_channels\argentina\canal26.png" onClick="frames['IFrameName1'].location.href='http://200.115.194.1:8080/Canal26'"></a>

    <hr />

    <span class="a" onClick="s='http://www.infobae.com/?noredirect';ChangeSrc();">

    infobae

    </span>

    <span class="a" onClick="s='http://www.clarin.com';ChangeSrc();">

    clarin

    </span>

    <span class="a" onClick="s='http://www.cronica.com.ar';ChangeSrc();">

    cronica

    </span>

    <h4> Bolivia </h4>

    <span class="a" onClick="s='http://tunein.com/radio/Erbol-FM-1009-s112848//';ChangeSrc();">

    Erbol 100.9

    </span>

    <span class="a" onClick="s='http://www.radiopio12.com/cochabamba/index.html';ChangeSrc();">

    radiopio12

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/Cochabamba-Bolivia-r101940/?qlc=1/';ChangeSrc();">

    Cochabamba

    </span>

    <span class="a" onClick="s='http://www.la-razon.com/';ChangeSrc();">

    la razon

    </span>

  </div>

  <h4>Short wave</h4>

  <div>

    <span class="a" onClick="s='http://www.radiohc.cu/';ChangeSrc();">

    Cuba www

    </span>

    <span class="a" onClick="s='http://media.enet.cu/radiohabanacuba/';ChangeSrc();">

    Cuba 1

    </span>

    <span class="a" onClick="s='http://media.enet.cu/radiohabanacubaidiomas/';ChangeSrc();">

    Cuba 2

    </span>

    <span title="Voice of America Special English" class="a" onClick="s='http://learningenglish.voanews.com/';ChangeSrc();">

    VoA

    </span>

    <span title="Radio Australia International" class="a" onClick="s='http://www.radioaustralia.net.au/international/listen/';ChangeSrc();">

    Australia

    </span>

    <span title="Radio New Zeland International" class="a" onClick="s='http://streaming.radionz.co.nz/international-mbr/';ChangeSrc();">

    radionz.co.nz

    </span>

    <span title="Radio Nacional de Espana, Madrid" class="a" onClick="s='http://tunein.com/radio/RNE-Radio-Nacional-585-s64431//';ChangeSrc();">

    Madrid 585

    </span>

    <span class="a" onClick="s='http://www.iheart.com/live/1033/?autoplay=true';ChangeSrc();">

    Rush Radio 99.5

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/UN-Radio-985-s86602/';ChangeSrc();">

    unradio bogota

    </span>

    <span class="a" onClick="s='http://www.espanol.rfi.fr/aef_player_popup/rfi_player#/';ChangeSrc();">

    RFI espanol

    </span>

    <span class="a" onClick="s='http://www.russian.rfi.fr/aef_player_popup/rfi_player#/';ChangeSrc();">

    RFI russian

    </span>

    <span class="a" onClick="s='http://sverigesradio.se/sida/default.aspx?programid=2103';ChangeSrc();">

    Радио Швеции

    </span>

    <span class="a" onClick="s='http://195.10.10.222/rtve/radioexterior.mp3?GKID=829ef63ca62411df984900163ea2c743';ChangeSrc();">

    REE

    </span>

    <span class="a" onClick="s='http://www.rtve.es/alacarta/live_radio_PopUp.shtml?id=3346&v=undefined&vp=&lang=es/';ChangeSrc();">

    RTVE

    </span>

    <span class="a" onClick="s='http://www.tvr.by/liveair/radio1.asx';ChangeSrc();">

    Belarus

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/World-FM-Tawa-882-s45176';ChangeSrc();">

    World-FM-Tawa

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/RDP-Internacional-941-s6747/';ChangeSrc();">

    Portugal

    </span>

    <span class="a" onClick="s='http://www.wrn.org/listeners';ChangeSrc();">

    WRN

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/R%C3%A1dio-Brasil-Central-1270-s151476';ChangeSrc();">

    R Brasil Central

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/R%C3%A1dio-Bandeirantes-AM-(S%C3%A3o-Paulo)-840-s86562';ChangeSrc();">

    R Bandeirantes

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/R%C3%A1dio-Clube-do-Par%C3%A1-690-s1359';ChangeSrc();">

    R Clube-do-Para

    </span>

    <span class="a" onClick="s='http://www.rri.ro/live_stream/rri_wma_128_1.asx/';ChangeSrc();">

    R Romania int

    </span>

    <span class="a" onClick="s='http://dxing.ru/podkast/71-radiopanorama';ChangeSrc();">

    radiopanorama

    </span>

    <span class="a" onClick="s='http://dxing.ru/forum.html?func=showcat&catid=21/';ChangeSrc();">

    dxing.ru forum

    </span>

    <span class="a" onClick="s='http://vcfm.ru/forum/viewtopic.php?f=7&t=167&p=36970#p36970/';ChangeSrc();">

    vcfm.ru forum

    </span>

    <span class="a" onClick="s='http://tunein.com/radio/Radio-Rebelde-921-s13375';ChangeSrc();">

    R Rebelde

    </span>

    <span class="a" onClick="s='http://www.martinoticias.com/audio/audio/23408.html';ChangeSrc();">

    R Marti

    </span>

    <span class="a" onClick="s='http://www.bbc.co.uk/radio/player/bbc_world_service/';ChangeSrc();">

    bbc_world_serv.

    </span> <span class="a" onClick="s='http://www.thenews.pl/Player';ChangeSrc();">Poland radio</span>

    <br />

    <a href="http://websdr.ewi.utwente.nl:8901" title="Short wave tuner in Holland" target="_blank">Short wave tuner</a> </div>

</div>

</div>

</div>

<iframe src="https://live.russia.tv/index/index/channel_id/76" scrolling="auto" id="iframe_id" name="IFrameName1" style="height:101%; border:0px; position:absolute; top:0px; left: 535px; text-align:left; width:60%"> </iframe>

</body>

</html>





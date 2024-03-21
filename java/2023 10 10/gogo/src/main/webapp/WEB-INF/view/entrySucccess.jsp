<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go!Go!Classroom</title>
<link rel="stylesheet" type="text/css" href="css/entrySuccess.css">
<script
src="https://code.jquery.com/jquery-3.6.0.min.js"
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
crossorigin="anonymous"></script>
<script src="stop-brawser-back.js"></script>
</head>
<body class="margin-auto">
<audio src="./music/nc263467.mp3" id="music2"></audio>
<div class="greenBar padding-bar">&nbsp;</div>
<div class="element-center">
<h1>登録が完了しました。</h1>
<h3><a href="http://localhost:8080/gogo">Top</a></h3>
</div>
</body>
<script>
window.onload = start;
function start(){
	const music2 = document.querySelector("#music2");
	music2.play();
}
//ブラウザバック拒否
$(function(){
	  history.pushState(null, null, null);
	    $(window).on("popstate", function(){
	      history.pushState(null, null, null);
	    });
	});
</script>
</html>
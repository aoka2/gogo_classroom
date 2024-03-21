<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/button-style.css">
<title>Go!Go!Classroom</title>
</head>
<body>
<div>
<h1 class="center">Welcome,<br>Go!Go!Classroom</h1>
<div class="center marg">
<a class="btn btn-flat" href="Login"><span>LOGIN</span></a><br><br><br>
<a class="btn Bbtn-flat" href="Regist"><span>REGIST</span></a><br>
</div>
</div>
<audio src="./music/nc132534.mp3" id="music"></audio>
<img onclick="start()" style="max-width:350px; margin-left: 50px" src="https://www.kitadenshi.co.jp/fun/55chancemaker/mj2021/images/gogo.png">
</body>
<script>
const music = document.querySelector("#music");

const btnStart = document.querySelector("#btn-play");
function start(){
	music.play();
}

</script>
<style>
*{
	overflow: hidden;
}
</style>
</html>
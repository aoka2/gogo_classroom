<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
		import="Model.Users"
		import="Model.Message"
		import="java.util.ArrayList"
		import="java.util.Set"
		import="java.util.TreeMap"%>
		<%
		String isSubjectError = (String)request.getAttribute("error");
		Users user = (Users)application.getAttribute((String)session.getAttribute("userName"));
		TreeMap<String,ArrayList<Message>> mslist = (TreeMap<String,ArrayList<Message>>)application.getAttribute("subjectList");
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go!Go!Classroom</title>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/success.css">
</head>
<body>
<div class="snow">●</div>
<div class="snow snow2nd">●</div>
<%if(user != null){ %>
<h1 class="backLine"><img src="image/block.png" style="max-width:100px;"><div style="align-item:center;">ようこそ、<%= user.getUserName() %> さま！</div></h1>
<%} %>
<h3><a href="http://localhost:8080/gogo/Login?action=logout">　<　　logout　</a></h3>
<div class="elementCenter">
<%if(isSubjectError!=null){
	if(isSubjectError.equals("true")){ %>
		<div style="color: red">
			<p>※既に作られた授業名です。<br>
			下記の授業一覧をみて再度作成してください。</p>
		</div>
<% }
}%>
<form action="/gogo/CrassMessage?action=addSubject" method="post">
<input type="text" class="textbox-003" name="subject" required placeholder="科目名">
<input type="hidden" name="name" value="<%=user.getUserName() %>">
<button class="button-040" style="width:50px;padding:6px; margin-left:5px; font-weight: bold;font-size:30px;">+</button>
</form>
<!-- メッセージ一覧表示 -->
<div class="elementCenter">
<%if(mslist != null){ %>
	<% if(mslist.keySet().size() != 0){ %>
		<%for(String key : mslist.keySet()){%>
			<h1 class="heading-001"><%= key %></h1>
			<span class='modal-toggle modal-span' data-modal='<%= key %>'><button class="button-040">課題作成</button></span>
			<%ArrayList<Message> list = mslist.get(key);%>
			<% int listNumber = 0; %>
			<div style="margin-bottom: 50px;">
			<%if(list.size() != 0){ %>
			<%for(Message ms : list){ %>
				<% listNumber++; %>
				<div class="elementCenter flex-box workBox" style="border: solid;border-width: 1px;margin: 10px 0;border-radius:10px;" onclick="location.href='http://localhost:8080/gogo/CrassMessage?action=messageDisplay&subject=<%= key %>&listNumber=<%= listNumber %>'"><!-- https://webdesign-trends.net/entry/8148 -->
					<div class="flex-row">
						<p class="heading-001-2"><img src="image/アンケート用紙のアイコン素材.png" style="max-width:25px;"><%= ms.getTitle() %></p>
							 <h5 style="text-align:right;margin:0;margin-right:7px;"><%= ms.getCreater() %></h5>
						 </div>
					 <%if(ms.getCreater().equals(user.getUserName())){%>
						 <form action="CrassMessage" method="post">
						 <input type="hidden" name="action" value="delete">
						 <input type="hidden" name="subject" value="<%= key %>">
						 <input type="hidden" name="listNumber" value="<%= listNumber %>">
					<button class="button-038" >削除</button>
						 </form>
				<%}else{ %>
					<br>
				<%} %>
					</div>
			<%}%>
			<%}else{ %>
				<p style="color:gray; margin-left:20px;">課題は見つかりませんでした。</p>
			<%} %>
			<br>
		<div id='<%= key %>' class='modal-outer'>
			 <div class='modal-inner'>
				<div class='modal-inner-header'><span class='close-btn-top'>×</span></div>
				<div class='modal-inner-container'>

					<p><span class="bold">・「<%= key %>」に課題を作成</span></p>

					<form class="workform" action="/gogo/CrassMessage" method="post">
					<textarea  class="textbox-003" name="title" placeholder="タイトル" required style="width: 95%"></textarea><br><br>
					<textarea name="context" class="textbox-003" placeholder="内容を入力してください" required rows="10" cols="65" style="width: 95%"></textarea><br>
					<input type="hidden" name="name" value= "<%= user.getUserName() %>">
					<input type="hidden" name="subject" value="<%= key %>">
					<input type="hidden" name="action" value="addMessage">
					<button class="button-030">送信</button>
					</form>
				</div>
			</div>
		</div>
			<br>
			</div>
		<%}%>
	<%}%>
<%}%>
</div>
</div>


</body>
<style>

.elementCenter{
	max-width : 650px;
	margin: auto;
}
.center{
	text-align : center;
}
.tableSize{
	color : red;
}
.rigth{
	margin: 0 0  0 500px;
}
textarea{
	resize:none;
}
.backLine{
	margin: 0 0 20px 0;
	padding: 19px 94px;
	background-color: #eaf0ff;
}
body{
	margin: 0;
}
/*課題新規作成*/
/*新規登録*/
.button-040 {
		justify-content: center;
		align-items: center;
		position: relative;
		width: 160px;
		padding: .9em 3em;
		border: none;
		border-radius: 5px;
		box-shadow: 0 7px 10px rgb(0 0 0 / 10%);
		background-color: #afcffb;
		color: #333;
		font-size: 1em;
		transition: transform .3s, box-shadow .3s;
		cursor: pointer;
}

.button-040:hover {
		transform: translateY(-2px);
		box-shadow: 0 7px 10px rgb(0 0 0 / 15%);
}
/*新規登録テキストボックス*/
.textbox-003-label,
.textbox-003 {
		color: #333;
}

.textbox-003-label {
		display: block;
		margin-bottom: 5px;
		font-size: .9em;
}

.textbox-003 {
		width: 60%;
		padding: 8px 10px;
		border: none;
		border-radius: 3px;
		background: #ebf1ff;
		font-size: 1em;
		line-height: 1.5;
}

.textbox-003::placeholder {
		color: #999;
}
.button-030 {
		display: flex;
		justify-content: center;
		align-items: center;
		position: relative;
		width: 250px;
		margin:20px auto;
		padding: .9em 2em;
		border: 1px solid #2589d0;
		border-radius: 5px;
		background-color: #fff;
		color: #2589d0;
		font-size: 1em;
}
/*雪*/
.snow {
  /*雪の色*/
  color: #2fd1f7;
  /*雪の大きさ*/
  font-size: 10px;
  /*初期位置*/
  position: fixed;
  top: -5%;
  /*雪を適当な幅で降らせる*/
  text-shadow:
  5vw   -100px 2px,
  10vw  -400px 3px,
  20vw  -500px 4px,
  30vw  -580px 1px,
  39vw  -250px 2px,
  42vw  -340px 5px,
  56vw  -150px 2px,
  63vw  -180px 0,
  78vw  -220px 4px,
  86vw  -320px 9px,
  94vw  -170px 7px;
  /*雪アニメーション1*/
  animation: roll 5s linear infinite;
}
  /*2つめの雪アニメーション*/
.snow2nd{animation: anim 8s linear infinite;}

@keyframes roll {
    0% {transform:rotate(0deg);}
   90% {opacity:1;}
   100% {transform:rotate(20deg);top:100%;opacity:0;}
}
@keyframes anim {
  100% {color:transparent;top:150%;}
}
/*科目タイトル*/
@import url('https://fonts.googleapis.com/css2?family=Dela+Gothic+One&display=swap');
.heading-001 {
	margin: 14px 0;
		padding: .5em .7em;
		border-left: 5px solid #2589d0;
		color: #333333;
		font-size: 30px;
	font-family: 'Dela Gothic One', sans-serif;

/*課題タイトル*/
/*削除ボタン*/
/*課題作成*/
/*課題作成画面*/

/*別cssファイルに記載*/


/*戻る*/
.button-051 {
		display: flex;
		justify-content: center;
		position: relative;
		width: 100px;
		margin: 0 auto;
		padding: .9em 2em;
		border: none;
		border-bottom: 2px solid #e6edf3;
		background-color: transparent;
		color: #333;
		font-weight: 600;
		font-size: 1em;
}

.button-051::after {
		position: absolute;
		bottom: -3px;
		left: 0;
		transform: scaleX(0);
		transform-origin: center left;
		width: 100%;
		height: 2px;
		background-color: #2589d0;
		content: '';
		transition: transform .3s ease;
}

.button-051:hover::after {
		transform: scaleX(1);
}

</style>
<script>
const btn = document.querySelectorAll(".modal-toggle");
btn.forEach(function (btn) {
btn.onclick = function () {
const modalAttribute = btn.getAttribute('data-modal');
const modalShow = document.getElementById(modalAttribute);
modalShow.classList.add('show');
};
});
const closeBtnTop = document.querySelectorAll(".close-btn-top");
closeBtnTop.forEach(function (btn) {
btn.onclick = function () {
const modal = btn.closest('.modal-outer');
modal.classList.remove('show');
};
});
const closeBtnBottom = document.querySelectorAll(".close-btn-bottom");
closeBtnBottom.forEach(function (btn) {
btn.onclick = function () {
const modal = btn.closest('.modal-outer');
modal.classList.remove('show');
};
});
const modalOuter = document.querySelectorAll('.modal-outer');
modalOuter.forEach(function (outer) {
outer.onclick = function () {
if(event.target.closest('.modal-inner') === null) {
event.target.classList.remove('show');
}
}
});
</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Model.doHash"
    import="javax.servlet.jsp.PageContext"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/entry.css">
<script>

function async_digestMessage(message) {
    return new Promise(function(resolve){
    var msgUint8 = new TextEncoder("utf-8").encode(message);
    crypto.subtle.digest('SHA-256', msgUint8).then(
        function(hashBuffer){
            var hashArray = Array.from(new Uint8Array(hashBuffer));
            var hashHex = hashArray.map(function(b){return b.toString(16).padStart(2, '0')}).join('');
            return resolve(hashHex);
        });
    })
}
function getHashText(text) {
    // ハッシュ化後の文字列を表示
    document.getElementById("hashPass").value = text;
    document.loginSubmit.submit();
    document.getElementById("pass").value = "";
}
function Hash(){
	var text = document.getElementById("pass").value;
	if(text.length >= 8){
	
		if(window.Promise && window.crypto){
		    async_digestMessage(text).then(
		        function(shatxt){
		            getHashText(shatxt);
		        }
		    ).catch(function(e){
		        console.log('エラー：', e.message);
		    })
		}else{
		    console.log('Promiseかcryptoに非対応');
		}
	}
}
</script>
<meta charset="UTF-8">
<title>Go!Go!Classroom</title>
</head>
<body>
<audio src="./music/nc263437.mp3" id="music2"></audio>
<div class="center">
<form action="Regist" name="loginSubmit" method="post">

<div>
<label class="form-margin textbox-003-label" for="name">名前</label>
<input class="textbox-003" type="text" id="name" name="name" required>
</div>
<br>

<div>
<label for="pass" class="form-margin textbox-003-label">パスワード</label>
<input class="textbox-003" type="password" id="pass" name="HashFlont" placeholder="８桁以上で入力"><br>
</div>

<input type="hidden"id="hashPass" name="pass" >
<input type="button" class="button-030" onclick="Hash()" value="登録">
</form>
<h3><a href="http://localhost:8080/gogo">←Top</a></h3>
</div>

</body>
<script>
window.onload = start;
function start(){
	const music2 = document.querySelector("#music2");
	music2.play();
}

</script>
<style>
.center{
	max-width : 500px;
	margin: auto;
}

.form-margin{
	margin: 2px 0;
}
.text-center{
	text-align: center;
}
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
    width: 100%;
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

.button-030:hover {
    animation: anima-button-030 1s;
}

@keyframes anima-button-030 {
    0% {
        box-shadow: 0 0 0 0 rgb(37 137 208 / 50%);
    }
    100% {
        box-shadow: 0 0 0 1.2em rgb(0 0 0 / 0%);
    }
}
</style>
</html>
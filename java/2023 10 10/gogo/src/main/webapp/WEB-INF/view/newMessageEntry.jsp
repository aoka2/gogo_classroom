<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Model.Users"
    import="Model.Message"
    import="java.util.ArrayList"
    import="java.util.TreeMap"%>
    <%Users user = (Users)application.getAttribute((String)session.getAttribute("userName"));%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go!Go!Classroom</title>
</head>
<body>
<h1 style="max-width: 65%;margin: 16px auto;">課題作成</h1>

<div class="center">
<form action="/gogo/CrassMessage" method="post">
<input type="text" class="textbox-003" name="title" placeholder="タイトル" required><br><br>
<textarea name="context" class="textbox-003" placeholder="内容を入力してください" required rows="10" cols="65" maxlength="671"></textarea><br>
<input type="hidden" name="name" value= "<%= user.getUserName() %>">
<% String subject = (String)request.getAttribute("subject"); %>
<input type="hidden" name="subject" value="<%= subject%>">
<input type="hidden" name="action" value="addMessage">
<input class="button-030" type="submit">
</form><br>
</div>
<button class="button-051" style="max-width: 65%;margin: 0 auto 0 30vh;" onclick="location.href='http://localhost:8080/gogo/Login?action=reLogin'">戻る</button>

</body>
<style>
.center{
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
/*送信ボタン*/
.button-030 {
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    width: 250px;
    margin: 18px auto;
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
</html>
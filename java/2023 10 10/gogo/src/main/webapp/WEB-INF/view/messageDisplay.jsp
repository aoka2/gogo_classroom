<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="Model.Users"
    import="Model.Message"
    import="java.util.ArrayList"
    import="java.util.TreeMap"%>
    <%Users user = (Users)application.getAttribute((String)session.getAttribute("userName"));
    TreeMap<String,ArrayList<Message>> mslist = (TreeMap<String,ArrayList<Message>>)application.getAttribute("subjectList");%>
    <% String subject = (String)request.getAttribute("subject"); %>
    <% int listNumber = Integer.parseInt((String)request.getAttribute("listNumber")); %>
    <% ArrayList<Message> list = mslist.get(subject); %>
    <% Message ms = list.get(listNumber-1); %>
    <% ArrayList<String> commnetlist = ms.getCommnet(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Go!Go!Classroom</title>
</head>
<body class="element-center">
<h1 class="margin-bottomZero padding-sizing heading-031"><%= ms.getTitle() %></h1>
<p class="margin-topZero margin-bottom">課題作成者：　<%= ms.getCreater() %></p>
<div class="box-017">
<div>内容：</div>
<h4><%= ms.getContext() %></h4>
</div>
<br><br>
<div class="inline">
<button class="button-051" onclick="location.href='http://localhost:8080/gogo/Login?action=reLogin'">戻る</button>
<div class="commentList">
<form action="makeComment" method="post">
<input type="text" class="textbox-3" name="comment" placeholder="コメント追加" required>
<input type="hidden" name="workName" value="<%= listNumber %>">
<input type="hidden" name="subject" value="<%= subject %>">
<button class="button-54"></button>
</form>
<div class="commentContent">
<!-- コメント一覧表示 -->
<%if(commnetlist.size() > 0){ %>
<% for(String commnet : commnetlist){ %>
<p class="commnet"><%= commnet %></p>
<% } %>
<% }else{ %>
<p style="color:gray;text-align:left;">コメントはありません</p>
<% } %>
</div>
</div>
</div>
</body>
<style>
.marg{
	margin:10px 20px;
}
.top-line{
	border-top: solid;
}
.title-size{
	max-width: 350px;
}
.bottom-line{
	border-bottom: solid;
}
.message-line{
	border: 2px solid;
	border-radius: 8px;
	margin-top: 0;
}
.margin-bottomZero{
	margin-bottom: 0;
}
.margin-topZero{
	margin-top: 0;
}
.center{
	text-align: center;
}
.element-center{
	max-width : 650px;
	margin: auto;
}
.margin-top{
	margin-top: 50px;
}
.margin-bottom{
	margin-bottom: 30px;
}
.padding-sizing{
	padding: 0px 0 30px 0;
}
.conetnt-padding{
	padding :25px 5px ;
}
/*戻る*/
.button-051 {
    display: flex;
    justify-content: center;
    position: relative;
    width: 100px;
    padding: .9em 2em;
    border: none;
    border-bottom: 2px solid #e6edf3;
    background-color: transparent;
    color: #333;
    font-weight: 600;
    font-size: 1em;
    cursor: pointer;
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

/*内容*/
.box-017 {
    max-width: 450px;
    margin: 0 auto;
    padding: .5em 1.5em 1em;
    border-top: 5px solid #2589d0;
    border-radius: 3px;
    box-shadow: 0 2px 3px rgb(0 0 0 / 20%);
    background-color: #f2f2f2;
}

.box-017 > div {
    margin-bottom: .5em;
    color: #2589d0;
    font-weight: 600;
    font-size: 1.05em;
}

.box-017 > h4 {
    margin: 0;
    color: #333;
}
/*タイトル*/
.heading-031 {
    position: relative;
    padding: .3em 0 .2em 1em;
    border-bottom: 3px solid #2589d0;
    color: #333333;
}

.heading-031::before {
    position: absolute;
    top: 0;
    left: .3em;
    transform: rotate(55deg);
    height: 11px;
    width: 12px;
    background: #2589d0;
    content: '';
}

.heading-031::after {
    position: absolute;
    transform: rotate(15deg);
    top: .6em;
    left: 0;
    height: 8px;
    width: 8px;
    background: #2589d0;
    content: '';
}
.button-051{
	float:left;
}
.commentList{
	text-align: right;
}
/*コメントテキストボックス*/
.textbox-3 {
    width: 25%;
    padding: 8px 10px;
    border: none;
    border-radius: 25px;
    background: #e2e8e9;
    color: #333;
    font-size: 1em;
    line-height: 1.5;
}

.textbox-3::placeholder {
    color: #999;
}
/*コメント投稿ボタン*/
.button-54 {
    justify-content: center;
    align-items: center;
    position: relative;
    width: 100px;
    margin: 0 auto;
    padding: 1.4em 3em 0.9em 2em;
    border: 1px solid #2589d0;
    border-radius: 25px;
    background-color: #fff;
    color: #2589d0;
    font-size: 1em;
}

.button-54::after {
    position: absolute;
    right: 2em;
    transform: translateY(-50%);
    transform-origin: left;
    width: 2em;
    height: .5em;
    background-color: #2589d0;
    clip-path: polygon(0 100%, 100% 100%, 70% 40%, 70% 90%, 0% 90%);
    content: '';
    transition: transform .3s;
}

.button-54:hover::after {
    transform: translateY(-50%) scaleX(1.4);
}
/*コメント*/
.commentContent{
	overflow-y: scroll;
  	max-height: 170px;
  	min-height:100px;
  	padding: 10px;
  	scrollbar-width: none;
  	
  	
	margin: 0 0 0 57%;
	max-width: 400px;
}
.commnet{
	border-bottom: inset;
	text-align: left;
}
</style>
</html>
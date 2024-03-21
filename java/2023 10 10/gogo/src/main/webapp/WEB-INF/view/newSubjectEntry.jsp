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
<link rel="stylesheet" type="text/css" href="css/message.css">
</head>
<body class="center">
hello, This page is newSubjectEntry page.<br>
<br><br>
<input type="button" onclick="location.href='http://localhost:8080/gogo/Login?action=reLogin'" value="戻る">
</body>
</html>
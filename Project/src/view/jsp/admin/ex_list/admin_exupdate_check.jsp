<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>検定情報更新確認画面</title>
<link href="src/view/css/template.css" rel="stylesheet" type="text/css">
<link href="src/view/css/check.css" rel="stylesheet" type="text/css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
<img class="logo" alt="logo" src="src/view/img/logo.gif">
<h1>検定管理システム</h1>
<%
User user = new User();
user = (User)session.getAttribute("user");
%>
ようこそ<b><%=user.name %></b>さん。
<form  action="<%=request.getContextPath()%>/logout" method="get">
<input class="header_btn" name="Button1" type="submit" value="ログアウト" />
</form>
</header>
	<div class="text_center">
	<h2>検定情報更新確認</h2>
	
	<form action="<%=request.getContextPath()%>/admin_exupdate_checkfinish" method="post">
		<table class="contents_center">
			<tr>
				<td>主催名</td>
				<td><%= session.getAttribute("syusaiUp") %></td>
			</tr>
			<tr>
				<td>検定名</td>
				<td><%= session.getAttribute("kenteiUp") %></td>
			</tr>

		</table>
		<br>
		
		<button class="color_btn">登録</button>
	</form>
	<form action="<%=request.getContextPath()%>/admin_exlist" method="post">
		<button class="btn">戻る</button>
	</form>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</div>
</body>

</html>

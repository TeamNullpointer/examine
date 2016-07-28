<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>検定情報追加確認画面</title>
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
<div  class="text_center">
	<h2>検定情報追加確認</h2>
	<form action="<%=request.getContextPath()%>/admin_exadd_checkfinish" method="POST">
		<table class="contents_center">
			<tr>
				<td>主催名</td>
				<td><%= session.getAttribute("syusainame") %></td>
			</tr>
			<tr>
				<td>検定名</td>
				<td><%= session.getAttribute("kentei") %></td>
			</tr>
			<tr>
				<td>実施日</td>
				<td><%= session.getAttribute("year") %>年<%= session.getAttribute("month") %>月
				<%= session.getAttribute("day") %>日</td>
			</tr>
		</table>
		<br>
		<button class="btn" onClick='history.back();'>戻る</button>
		<button  type="submit" class="color_btn">登録</button>
	</form>
		<footer>
			<p class="text_center">
				Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.
			</p>
		</footer>
</div>
</body>

</html>

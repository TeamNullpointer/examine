
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<head>

<title>取得検定一覧画面</title>
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
</head>

<body class="text_center">
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
	<form>
		<table class="contents_center">
			<tr>
				<td>主催名</td>
				<td></td>
			</tr>
			<tr>
				<td>検定名</td>
				<td></td>
			</tr>
			<tr>
				<td>実施日</td>
				<td></td>
			</tr>
		</table>
		<br>
		<br>
		<button class="color_btn">登録</button>
	</form>
		<form action="<%=request.getContextPath() %>/admin_exadd"method="post">
			<button class="btn">戻る</button>
		</form>

		<footer>
			<p class="text_center">
				Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.
			</p>
		</footer>
</div>
</body>

</html>

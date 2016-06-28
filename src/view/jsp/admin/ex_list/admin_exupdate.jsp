
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
<div class="text_center">
<!--コンテンツはここから書いてね-->
<p>
<form action="<%=request.getContextPath() %>/admin_exupdate_check" method="post">
	主催名<input name="kentei" type="text" >
</p>

<p>
	検定名<input name="kentei" type="text" >
</p>

<button type="submit"class="color_btn">検定を更新する</button>
	</form>
	<br>
	<br>
	<form action="<%=request.getContextPath()%>/menu" method="post" class="text_center">
		<button type="submit" class="btn">メニュー画面へ</button>
	</form>
		<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</div>
</body>

</html>

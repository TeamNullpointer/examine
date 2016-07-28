<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<head>
<title>ログアウト</title>

<!--CSSファイルはここに追記-->
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<!--ここまで-->

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
</header>

<!--コンテンツはここから書いてね-->

<div class="text_center">
<p>本当にログアウトしてもよろしいでしょうか？</p>
<form action="<%=request.getContextPath() %>/logout_success" method="get">
<input class="color_btn" name="Button1" type="submit" value="ログアウト" />


<input class="btn" name="Button1" type="button" value="キャンセル" onClick="history.go(-1);"/>
</form>
</div>



<!--コンテンツはここまで-->

<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

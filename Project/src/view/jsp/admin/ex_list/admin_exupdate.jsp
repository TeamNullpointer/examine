<!DOCTYPE html>
<html>

<head>
<%@ page contentType="text/html; charset=utf-8" %>
<title>検定情報の追加</title>
<!--CSSファイルはここに追記-->
<link href="src/view/css/template.css" rel="stylesheet" type="text/css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
<!--ここまで-->

</head>

<body>
<header>
<img class="logo" alt="logo" src="src/view/img/logo.gif">
<%@ page import="main.datamodel.objects.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
<form action="<%=request.getContextPath()%>/admin_exupdate_check" method="post">
	主催名<input name="syusai" type="text" value="<%= request.getAttribute("prom_name") %>" >
</p>

<p>
	検定名<input name="kentei" type="text" value="<%= request.getAttribute("exa_name") %>">
</p>

<!--
<p>
 開催日<select name="year">
		<%
		int year = 1980;
		while(year <= 2016){
			%>
				<option value="<%=year%>"><%=year%></option>
			<%
				year++;
				}
			%>
</select>年

	<select name="month">
			<%
				int month = 01;
				while(month <= 12){
			%>
				<option value="<%=month%>"><%=month%></option>
			<%
				month++;
				}
			%>
	</select>月
		<select name="day">
			<%
				int day = 01;
				while(day <= 31){
			%>
				<option value="<%=day%>"><%=day%></option>
			<%
				day++;
				}
			%>
	</select>日
</p>
-->
<button type="submit"class="color_btn">検定を更新する</button>
</form>
<form action="<%=request.getContextPath()%>/admin_exlist" method="post">
<button type="submit" class="btn">メニュー画面へ</button>

	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</div>
</body>

</html>

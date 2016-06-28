
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
 <h2>検定情報の追加</h2>

	<form method="post" action="<%=request.getContextPath() %>/admin_exadd_check" >
	 <p>
	<input type="radio" name="syusai" value="syusai" checked="check"> 登録済みの主催情報を登録
<input type="radio" name="syusai" value="syusai"> 新たな主催名を登録
</p>

 <p>
 	<select name="kentei">
	<option value="1">ここでDBから主催名を取得</option>
	<option value="2">ここでDBから主催名を取得</option>
	<option value="3">ここでDBから主催名を取得</option>
	</select>

	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	主催名
	<input name="kentei" type="text" value="ここに主催名を入力" >
	</p>
<p>
<input type="radio" name="kentei" value="kentei" checked="checked"> 登録済みの検定情報を登録
<input type="radio" name="kentei" value="kentei"> 新たな検定名を登録
</p>

<p>
	<select name="kentei">
	<option value="1">ここでDBから検定名を取得</option>
	<option value="2">ここでDBから検定名を取得</option>
	<option value="3">ここでDBから検定名を取得</option>
	</select>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	検定名<input name="kentei" type="text" value="ここに主催名を入力">
</p>
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
		<br>
		<br>
		<button type="submit" class="color_btn">検定を登録する</button>
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

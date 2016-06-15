<!-- 生徒側取得検定追加画面 -->

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>

<title>取得検定の追加</title>

<!--CSSファイルはここに追記-->
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
<!--ここまで-->

</head>

<body>

<header>
<img class="logo" alt="logo" src="src/view/img/logo.gif">
<h1>検定管理システム</h1>
ようこそ<b><!--ユーザの名前を表示する--></b>さん。
<input class="header_btn" name="Button1" type="button" value="ログイン／ログアウト" />
<!--ここにパンくずリストを書いて下さい-->
<!--処理の例が書いてあるので書き換えるかコピー＆ペーストしてください-->

</header>
<div class="text_center">
<p><h2>取得検定の追加</h2>
	<form method="post">
<p>
	主催名<select name="kentei">
	<option value="1">ここでDBから主催名を取得</option>
	<option value="2">ここでDBから主催名を取得</option>
	<option value="3">ここでDBから主催名を取得</option>
	</select>
</p>
<p>
	検定名<select name="kentei">
	<option value="1">ここでDBから検定名を取得</option>
	<option value="2">ここでDBから検定名を取得</option>
	<option value="3">ここでDBから検定名を取得</option>
	</select>
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
<p>
<input type="radio" name="result" value="0" checked>合格
<input type="radio" name="result" value="1">不合格
</p>

<button type="button" class="btn">取得検定一覧へ</button>
<button type="button" class="color_btn">検定を追加する</button>
	</form>

<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</div>
</body>

</html>

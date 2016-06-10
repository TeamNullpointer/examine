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
<h1>検定管理システム</h1>
ようこそ<b><!--ユーザの名前を表示する--></b>さん。
<input class="header_btn" name="Button1" type="button" value="ログイン／ログアウト" />
<!--ここにパンくずリストを書いて下さい-->
<!--処理の例が書いてあるので書き換えるかコピー＆ペーストしてください-->
<div class="pan_list">
<ul>
　<li><a href="/">ページ１</a> ＞</li>
 　<li><a href="/">ページ２</a> ＞</li>
 　<li>ページ３</li>
</ul>
</div>
<!--パンくずリストのコードはここまで-->

</header>
<div class="text_center">
 <h2>検定情報の追加</h2>

	<form method="post">
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

		<button type="button" class="btn">メニュー画面へ</button>
		<button type="button" class="color_btn">検定を登録する</button>
	</form>

	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</div>
</body>

</html>

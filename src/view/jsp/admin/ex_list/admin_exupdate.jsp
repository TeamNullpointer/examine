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

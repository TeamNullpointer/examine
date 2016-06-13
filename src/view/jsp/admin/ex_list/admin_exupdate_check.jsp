<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
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
	<h2>検定情報更新確認</h2>
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
		<button class="btn">戻る</button>
		<button class="color_btn">登録</button>
	</form>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</div>
</body>

</html>

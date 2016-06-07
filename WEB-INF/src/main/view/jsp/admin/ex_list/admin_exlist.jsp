<!DOCTYPE html>
<html>

<head>
<%@ page contentType="text/html; charset=utf-8" %>
<title>検定情報一覧</title>
<link href="../../../css/template.css" rel="stylesheet" type="text/css">
<link href="../../../css/menu.css" rel="stylesheet" type="text/css">
</head>
<body>
<header>
<img class="logo" alt="logo" src="../../../img/logo.gif">
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
<h2 class="text_center">検定情報一覧</h2>
<!--主催名検索-->
<div id="promotor_search" class="text_center">
	<select name="promotor_name">
		<option value="">主催名</option>
		<!--↓DBから取得したデータ表示-->
		<option value=""></option>
	</select>
	<img alt="検索用アイコン" height="34" src="../../../img/icon.gif" width="35">
</div>
<br>
<!--検定情報一覧表示-->
<div id="disp_examine">
<table class="contents_center line_table">
	<tr>
		<th>主催名</th><th>検定名</th><th></th>
	</tr>
	<tr>
	<!--以降、DBからのデータを持ってくる-->
		<td></td>
		<td></td>
		<td><input name="update" type="button" value="更新" class="color_btn"/></td>
	</tr>
</table>
</div>
<!--メニューへ戻る-->
<form action="" class="text_center">
	<input class="btn" name="menu" type="button" value="メニューへ" /></form>
	<footer>
		<p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p>
	</footer>
</body>

</html>

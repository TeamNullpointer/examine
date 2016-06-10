<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<title>取得検定一覧</title>
<link href="src/view/css/template.css" rel="stylesheet" type="text/css">
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
<h2 class="text_center">取得検定一覧</h2>
<!--主催名、検定名、実施日検索-->
<div class="text_center">
	<select name="promotor_name">
		<option value="">主催名</option>
		<!--↓DBから取得した主催名を表示-->
		<option value=""></option>
	</select>
	<select name="examine_serch">
		<option value="">検定名</option>
		<!--↓DBから取得した検定名を表示-->
		<option value=""></option>
	</select>
	<select name="select_date">
		<option value="">実施日</option>
		<!--↓DBから取得した実施日を表示-->
		<option value=""></option>
	</select>
	を持った学生一覧
	<a href="">
	<img alt="検索用アイコン" class="auto-style1" height="34" src="src/view/img/icon.gif" width="35">
	</a>
	</div>
	<br>
	<!--検定を取得している学生一覧を表示-->
		<table class="line_table contents_center">
			<tr>
				<th>学科・学年・クラス</th>
				<th>氏名</th>
			</tr>
			<!--↓DBから取得したデータ表示-->
			<tr>
				<td></td>
				<td><a href="" ></a></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="" ></a></td>

			</tr>
		</table>
	<!--メニューへ戻る-->
	<form action="" class="text_center">
		<input type="button" value="メニューへ"  class="btn"/>
	</form>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>
<!-- 生徒側検定情報一覧画面 -->

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>

<head>

<title>検定情報一覧</title>
<!--CSSファイルはここに追記-->
<link rel="stylesheet" type="text/css" href="../../css/template.css">
<!--ここまで-->
</head>
<body>
<h2 class="text_center">検定情報一覧</h2>
<!--主催名検索-->
<div id="promotor_search" class="text_center">
	<select name="promotor_name">
		<option value="">主催名</option>
		<!--↓DBから取得したデータ表示-->
		<option value=""></option>
	</select>
<img alt="検索用アイコン" height="34" src="../素材/icon_2.gif" width="35"></div>
<!--検定情報一覧表示-->
<br>
<div id="disp_examine">
	<table class="line_table contents_center">
		<tr>
			<th>主催名</th><th>検定名</th>
		</tr>
		<tr>
		<!--以降、DBからのデータを持ってくる-->
			<td></td><td></td>
		</tr>
	</table>
</div>
<!--メニューへ戻る-->
<form class="text_center" action="">
	<input class="btn" name="menu" type="button" value="メニューへ" />
</form>
</body>

</html>

<!--
date:20150523
name:情シ専2A　○○　○○
comm:DBへの登録画面
-->


<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<title>学生情報一覧</title>
</style>
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
<div  class="text_center">
		<h2 class="text_center">学生情報一覧</h2>
		<select name="example" id="search2">
			<option value="">学科・学年・クラス</option>
		</select>
		<a href="">
			<img alt="検索用アイコン" height="34" src="../../../img/icon.gif" width="35">
		</a>
<br><br>
		<table class="contents_center line_table">
			<tr>
				<th>氏名</th>
				<th>フリガナ</th>
				<th>生年月日</th>
				<th>更新/削除</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td>
					<form action="" method="">
   						<input class="color_btn" type="submit" value="更新">
   						<input class="color_btn" type="submit" value="削除">
   					</form>
   				</td>
			</tr>
		</table>
		<br>
		<form>
			<input class="btn" type="button" value="メニューへ" >
		</form>
		</div>
</body>
</html>

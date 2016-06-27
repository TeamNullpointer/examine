<!--
date:20150523
name:情シ専2A　○○　○○
comm:DBへの登録画面
-->


<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<title>学生情報更新</title>
<style type="text/css">
</style>
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
　<li><a href="http://localhost:8080/menu">メニュー</a> ＞</li>
 　<li><a href="">学生情報更新</a> </li>
</ul>
</div>
<!--パンくずリストのコードはここまで-->

</header>
		<h2 class="text_center">学生情報更新</h2>
		<form action="<%=request.getContextPath() %>/admin_stupdate_check" method="post" class="text_center">
			<table class="contents_center">
			<tr>
				<td>お名前</td>
				<td>姓：<input  maxlength='8' name="name"></td>
			</tr>
			<tr>
				<td></td>
				<td>名：<input  maxlength='8' name="name"></td>
			</tr>
			<tr>
				<td>フリガナ（カナ）</td>
				<td>セイ：<input name="name"></td>
			</tr>
			<tr>
				<td></td>
				<td>メイ：<input name="name"></td>
			</tr>
			<tr>
				<td>学科</td>
				<td>
				<select name="example" id="search2">
					<option value="">学科</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>学年</td>
				<td>
					<select name="example" id="search2">
							<option value="">学年</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>クラス</td>
				<td>
					<select name="example" id="search2">
							<option value="">クラス</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>パスワードの変更</td>
				<td><input type="radio" name="riyu" value="1" checked="checked">変更する
					<input type="radio" name="riyu" value="2">変更しない
				</td>
			</tr>
			<tr>
				<td>新しいパスワード</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>パスワード再入力</td><td><input type="password" name="password"></td>
			</tr>
			</table>
			<input class="color_btn" type="submit" value="変更する">
		</form>
		<form action="<%=request.getContextPath() %>/admin_stlist" method="get" class="text_center">
			<input class="btn" type="submit" value="キャンセル">
		</form>
		<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</body>
</html>
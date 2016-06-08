<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<title>ログイン</title>

<!--CSSファイルはここに追記-->
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
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

<!--コンテンツはここから書いてね-->
<form action="<%=request.getContextPath() %>/dologin" method="POST">
<table class="contents_center">
<tr><td>メールアドレス</td>
<td><input name="usermail" type="text" /> @st.asojuku.ac.jp</td></tr>
<tr><td>パスワード</td><td><input name="password" type="text" width="200px"/></td></tr>
</table>
<br>
<div class="text_center">
<input class="color_btn" type="submit" value="ログイン" />
</div>
</form>

<!--コンテンツはここまで-->

<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

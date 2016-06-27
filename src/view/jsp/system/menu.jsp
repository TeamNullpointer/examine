<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<title>メニュー</title>

<!--CSSファイルはここに追記-->
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<link rel="stylesheet" type="text/css" href="src/view/css/menu.css">
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

<div class="text_center">

<div class="title"><h2>管理メニュー</h2></div><br>
<div class="sub_title"><h3>検索</h3></div><br>

<div class="center">
<figure class="icon_box">
<a href="<%= request.getContextPath() %>/admin_exlist_single">
	<img class="icon" alt="個人取得検定検索" src="src/view/img/own_search.png">
</a>
<figcaption>個人取得検定検索</figcaption>
</figure>

<figure class="icon_box">
<a href="<%= request.getContextPath() %>/admin_exget">
	<img class="icon" alt="全体取得検定検索" src="src/view/img/all_search.png">
</a>
<figcaption>全体取得検定検索</figcaption>
</figure>
</div>

<br><div class="sub_title"><h3>情報一覧＆追加</h3></div><br>
<%String path = ""; %>
<form  action="<%=request.getContextPath() %>/admin_exlist" method="GET" style="display: inline">
	<input class="btn" name="Button1" type="submit" value="検定情報一覧" />
</form>
<form  action="<%=request.getContextPath() %>/admin_exadd" method="GET" style="display: inline">
	<input class="btn" name="Button1" type="submit" value="検定情報追加" /><br>
</form>
<form  action="<%=request.getContextPath() %>/admin_stlist" method="GET" style="display: inline">
	<input class="btn" name="Button1" type="submit" value="学生情報一覧" />
</form>
<form  action="<%=request.getContextPath() %>/admin_stadd" method="GET"style="display: inline">
	<input class="btn" name="Button1" type="submit" value="学生情報追加" />
</form>
</div>


<!--コンテンツはここまで-->

<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

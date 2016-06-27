<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<meta content="ja" http-equiv="Content-Language">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>管理者側_取得検定一覧画面</title>
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
<div class="text_center">
<h2>学生取得検定一覧</h2>
<p>（ユーザ名）さんが取得した検定の一覧です</p>
<table class="line_table contents_center">
  <tr>
    <td>受験年月日</td>
    <td>主催団体</td>
    <td>資格名</td>
    <td>状況</td>
    <td></td>
  </tr>
 <tr>
    <td>20xx年xx月xx日</td>
    <td>自宅警備団</td>
    <td>一級在宅士</td>
    <td>合格</td>
    <td><button class="color_btn" type="button">削除</button></td>
  </tr>
</table>
<p>学生を探す</p>
<INPUT type="text" name="StudentSerch">
<input type="submit" value="" action="<%=request.getContextPath() %>/admin_exlist_single" method="GET"
	  style="width:35px; height:35px; background-image:url(src/view/img/icon.gif); background-size:34px 35px;"/>
	<br>
	<br>
	<form method="get" action="<%= request.getContextPath() %>/admin_exget">
		<button class="btn" type="submit">検定の検索へ</button>
	</form>
	</div>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

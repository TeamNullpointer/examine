<!-- 生徒側取得検定一覧画面 -->

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>

<title>取得検定一覧画面</title>
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
</head>

<body class="text_center">
<header>
<img class="logo" alt="logo" src="src/view/img/logo.gif">
<h1>検定管理システム</h1>
ようこそ<b><!--ユーザの名前を表示する--></b>さん。
<input class="header_btn" name="Button1" type="button" value="ログイン／ログアウト" />
<!--ここにパンくずリストを書いて下さい-->
<!--処理の例が書いてあるので書き換えるかコピー＆ペーストしてください-->

</header>
<h2>取得検定一覧</h2>
<p>（ユーザ名）さんが取得した検定の一覧です</p>
<!-- DBからデータを持ってくる -->
<table class="line_table contents_center">
  <tr>
    <td>受験年月日</td>
    <td>主催団体</td>
    <td>資格名</td>
    <td>状況</td>
    <td></td>
  </tr>
 <tr>
    <td>受験日付</td>
    <td>主催名</td>
    <td>資格名</td>
    <td>状況</td>
    <td><button class="color_btn" type="button">削除</button></td>
  </tr>
</table>
	<form method="post" action="<%=request.getContextPath()%>/st_exlist">
	<a href="http://it.sk-shikaku.com/hajimate/merit.html" target="_blank">資格を取るメリットは？</a>
	<br>
<button class="btn" type="submit">検定の情報を見る</button>
</form>
<form method="post" action="<%=request.getContextPath()%>/st_exadd">
<button class="color_btn" type="submit">検定を追加する</button>
	</form>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>

</body>

</html>

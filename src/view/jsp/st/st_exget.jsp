<!-- 生徒側取得検定一覧画面 -->

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<head>

<title>取得検定一覧画面</title>
<link rel="stylesheet" type="text/css" href="WEB-INF/src/view/css/template.css">
</head>

<body class="text_center">

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
	<form method="post">
	<a href="http://it.sk-shikaku.com/hajimate/merit.html" target="_blank">資格を取るメリットは？</a>
	</br>
<button class="btn" type="button">検定の情報を見る</button>
<button class="color_btn" type="button">検定を追加する</button>
	</form>
	
</body>

</html>

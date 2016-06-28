
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<head>

<title>取得検定一覧画面</title>
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
<link href="src/view/css/check.css" rel="stylesheet" type="text/css">
</head>

<body class="text_center">
<header>
<img class="logo" alt="logo" src="src/view/img/logo.gif">
<h1>検定管理システム</h1>
<%
User user = new User();
user = (User)session.getAttribute("user");
%>
ようこそ<b><%=user.name %></b>さん。
<form  action="<%=request.getContextPath()%>/logout" method="get">
<input class="header_btn" name="Button1" type="submit" value="ログアウト" />
</form>
</header>
<div   class="text_center" >
	<h2>学生情報更新確認</h2>
	<form>
		<table class="contents_center">
			<tr>
				<td>お名前</td>
				<td>姓：</td>
			</tr>
			<tr>
				<td></td>
				<td>名：</td>
			</tr>
			<tr>
				<td>フリガナ(カナ）</td>
				<td>セイ：</td>
			</tr>
			<tr>
				<td></td>
				<td>メイ：</td>
			</tr>
			<tr>
				<td>学科</td>
				<td></td>
			</tr>
			<tr>
				<td>学年</td>
				<td></td>
			</tr>
			<tr>
				<td>クラス</td>
				<td></td>
			</tr>
			<tr>
				<td>パスワード</td>
				<td></td>
			</tr>
		</table>
		<br>
		<button class="btn" >戻る</button>
		<button class="color_btn" >登録</button>
	</form>
	</div>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

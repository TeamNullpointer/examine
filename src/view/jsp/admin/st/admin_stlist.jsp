
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<head>

<title>取得検定一覧画面</title>
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
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
<div  class="text_center">
		<h2 class="text_center">学生情報一覧</h2>
		<select name="example" id="search2">
			<option value="">学科・学年・クラス</option>
		</select>
		<a href="">
			<img alt="検索用アイコン" height="34" src="src/view/img/icon.gif" width="35">
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
					<form action="<%=request.getContextPath() %>/admin_stupdate" method="get">
   						<input class="color_btn" type="submit" value="更新">
   						<input class="color_btn" type="submit" value="削除">
   					</form>
   				</td>
			</tr>
		</table>
		<br>
		<form action="<%=request.getContextPath() %>/menu" method="post">
			<input class="btn" type="submit" value="メニューへ" >
		</form>
		<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
		</div>
</body>
</html>

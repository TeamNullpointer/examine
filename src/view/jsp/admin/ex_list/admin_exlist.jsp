
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
<h2 class="text_center">検定情報一覧</h2>
<!--主催名検索-->
<div id="promotor_search" class="text_center">
	<select name="promotor_name">
		<option value="">主催名</option>
		<!--↓DBから取得したデータ表示-->
		<option value=""></option>
	</select>
 <input type="submit" value="" action="<%=request.getContextPath() %>/admin_exlist" method="GET"
	  style="width:35px; height:35px; background-image:url(src/view/img/icon.gif); background-size:34px 35px;"/>

</div>
<br>
<!--検定情報一覧表示-->
<div id="disp_examine">
<table class="contents_center line_table">
	<tr>
		<th>主催名</th><th>検定名</th><th></th>
	</tr>
	<tr>
	<!--以降、DBからのデータを持ってくる-->
		<td></td>
		<td></td>
		<td>
			<form action="<%=request.getContextPath()%>/admin_exupdate" method="get">
				<input name="update" type="submit" value="更新" class="color_btn"/>
			</form>
		</td>
	</tr>
</table>
</div>
<!--メニューへ戻る-->
	<form action="<%=request.getContextPath() %>/menu" method="post" class="text_center">
		<input class="btn" name="menu" type="submit" value="メニューへ" />
	</form>
	<footer>
		<p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p>
	</footer>
</body>

</html>

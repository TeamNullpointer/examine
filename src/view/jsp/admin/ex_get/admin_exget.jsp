
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
<h2 class="text_center">取得検定一覧</h2>
<!--主催名、検定名、実施日検索-->
<div class="text_center">
	<select name="promotor_name">
		<option value="">主催名</option>
		<!--↓DBから取得した主催名を表示-->
		<option value=""></option>
	</select>
	<select name="examine_serch">
		<option value="">検定名</option>
		<!--↓DBから取得した検定名を表示-->
		<option value=""></option>
	</select>
	<select name="select_date">
		<option value="">実施日</option>
		<!--↓DBから取得した実施日を表示-->
		<option value=""></option>
	</select>
	を持った学生一覧
	 <input type="submit" value="" action="<%=request.getContextPath() %>/admin_exget" method="GET"
	  style="width:35px; height:35px; background-image:url(src/view/img/icon.gif); background-size:34px 35px;"/>
	</div>
	<br>
	<!--検定を取得している学生一覧を表示-->
		<table class="line_table contents_center">
			<tr>
				<th>学科・学年・クラス</th>
				<th>氏名</th>
			</tr>
			<!--↓DBから取得したデータ表示-->
			<tr>
				<td></td>
				<td><a href="" ></a></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="" ></a></td>

			</tr>
		</table>
	<!--メニューへ戻る-->
	<br>
	<br>
	<form action="<%=request.getContextPath() %>/menu" class="text_center" method="POST">
		<input type="submit" value="メニューへ"  class="btn"/>
	</form>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>
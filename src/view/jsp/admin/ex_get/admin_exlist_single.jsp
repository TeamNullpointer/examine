
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

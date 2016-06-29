<!-- 生徒側取得検定一覧画面 -->

<!DOCTYPE html>
<%@page import="main.datamodel.objects.StudentExamineHistory"%>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.model.studentexamine.*" %>
<%@page import="main.datamodel.objects.User" %>
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
<%
List<StudentExamineHistory> stExamList = new ArrayList<StudentExamineHistory>();
StudentExamine stExam = new StudentExamine();
stExamList = stExam.select(user);
%>
<h2>取得検定一覧</h2>
<p><%=user.name %>さんが取得した検定の一覧です</p>
<!-- DBからデータを持ってくる -->
<table class="line_table contents_center">
  <tr>
    <td>受験年月日</td>
    <td>主催団体</td>
    <td>資格名</td>
    <td>状況</td>
    <td></td>
  </tr>
  <%for(StudentExamineHistory stExamHis :stExamList){ %>
 <tr>
    <td><%=stExamHis.examine_day %></td>
    <td><%=stExamHis.promoter_name %></td>
    <td><%=stExamHis.examine_name %></td>
     <%
    String isPass = "不合格";
    if(stExamHis.pass_flg == true){
    	isPass = "合格";
    }
    %>
    <td><%=isPass %></td>
    <td><button class="color_btn" type="button">削除</button></td>
  </tr>
  <%} %>
</table>
	<form method="post" action="<%=request.getContextPath()%>/st_exlist">
	<a href="http://it.sk-shikaku.com/hajimate/merit.html" target="_blank">資格を取るメリットは？</a>
	<br>
<button class="btn" type="submit">検定の情報を見る</button>
</form>
<form method="post" action="<%=request.getContextPath()%>/st_exadd">
<button class="color_btn" type="submit">検定を追加する</button>
	</form>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All right Reserved.</p></footer>

</body>

</html>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.ManageUser" %>
<%@ page import="main.datamodel.objects.ClassInfo" %>
<%@ page import="main.model.students.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<head>
<title>学生情報追加確認画面</title>
<link rel="stylesheet" type="text/css" href="src/view/css/template.css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
</head>

<%
ManageUser check_form = (ManageUser)session.getAttribute("check_form");
String check_birthday = (String)request.getAttribute("birthday");
%>

<body>
<header>
<img class="logo" alt="logo" src="../../../img/logo.gif">
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
	<div  class="text_center">
	<h2>学生情報追加確認</h2>
		<table class="contents_center">
			<tr>
				<td>メールアドレス</td>
				<td><%=check_form.mail %></td>
			</tr>
			<tr>
				<td>お名前</td>
				<td><%=check_form.name %></td>
			<tr>
				<td>フリガナ(カナ）</td>
				<td><%=check_form.name_kana %></td>
			</tr>
			<tr>
				<td>パスワード</td>
				<%
				int i = 0;
				int word_length = (check_form.password).length();
				String pass = "";
				while(i < word_length){
					pass += "*";
					i++;
				} %>
				<td><%=pass %></td>
			</tr>
			<tr>
				<td>生年月日</td>
				<td><%=check_birthday %></td>
			</tr>
			<tr>
				<td>クラス</td>
				<% List<ClassInfo> classes = new ArrayList<ClassInfo>();
				Students getStData = new Students();
				classes = getStData.getClassList();

				for(ClassInfo cldata : classes){
					if(cldata.class_id != check_form.class_id){
						continue;
					}
				%>
				<td><%=cldata.class_name %></td>
				<%} %>
			</tr>

		</table>
		<br>
<form  action="<%=request.getContextPath() %>/admin_stadd_db" method="post" style="display: inline">
		<input type="submit">
</form>
	</div>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

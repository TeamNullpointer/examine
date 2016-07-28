
<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<%@ page import="main.datamodel.objects.ClassInfo" %>
<%@ page import="main.model.students.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
//前の画面からユーザー情報を持ってくる
//String usermail = req.getParameter("");
%>
ようこそ<b><%=user.name %></b>さん。
<form  action="<%=request.getContextPath()%>/logout" method="get">
<input class="header_btn" name="Button1" type="submit" value="ログアウト" />
</form>

</header>

<%

List<User> stList = new ArrayList<User>();
List<ClassInfo> classes = new ArrayList<ClassInfo>();
Students getStData = new Students();
classes = getStData.getClassList();
%>

<%  String[]  getstdata= new String[4];
	String st_name;
	String st_kana;
	String st_mail;
	int class_id;
	String class_id_sub;
	st_mail = (String) request.getAttribute("mail");
	System.out.println("メアド："+st_mail);
	session.setAttribute("st_mail",st_mail);
	st_name = (String) request.getAttribute("name");
	System.out.println("名前："+st_name);
	st_kana = (String) request.getAttribute("kana");
	System.out.println("かな："+st_kana);
	class_id = (Integer)request.getAttribute("class_id");
	System.out.println("クラスID："+class_id);
	%>
	
		<h2 class="text_center">学生情報更新</h2>
		<form action="<%=request.getContextPath() %>/admin_stupdate_check" method="post" class="text_center">
			<table class="contents_center">
			<tr>
				<td>お名前</td>
				
		<td><input  maxlength='8' name="name" value="<%= st_name %>"></td>
			</tr>
			<tr>
				<td>フリガナ（カナ）</td>
			
				<td><input name="kana" value="<%= st_kana %>"></td>
			</tr>
			<tr>
				<td>学科学年クラス</td>
				<td>
				<select name="class_id" id="search2">
			<%for(ClassInfo cldata : classes){
			if(cldata.class_id == 21){
				continue;
			}%>
			<option value="<%=cldata.class_id%>"
			<%//自分の学科を初期値にする
			if(cldata.class_id==class_id){
				out.print("selected");
			} %>
			>
			<%=cldata.class_name %></option>
			<%} %>
		</select>
				</td>
			</tr>
			<tr>
			<td　align="left"><font color="#0404B4">変更しない情報は、入力の必要はありません。</font></td>
				<td></td>
			</tr>
			<tr>
				<td>新しいパスワード</td>
				<td><input type="password" name="password" id="pass"></td>
			</tr>
			<tr>
				<td>パスワード再入力</td><td><input type="password" name="password2" id="pass"></td>
			</tr>
			</table>
			<input class="color_btn" type="submit" value="変更する">
		</form>
		<form action="<%=request.getContextPath() %>/admin_stlist" method="get" class="text_center">
			<input class="btn" type="submit" value="キャンセル">
		</form>
		<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</body>
</html>
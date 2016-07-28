
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
if(user == null){
	user = null;
}
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
int class_id = 0;
String id = request.getParameter("class");
%>
<div  class="text_center">
		<h2 class="text_center">学生情報一覧</h2>
		<form action="<%=request.getContextPath() %>/admin_stlist" method="POST">
		<select name="class" id="search2">
			<option value="0">学科・学年・クラス</option>
			<%for(ClassInfo cldata : classes){
			if(cldata.class_id == 21){
				continue;
			}
			%>
			<option value="<%=cldata.class_id%>"><%=cldata.class_name %>
			<%//自分の学科を初期値にする
			if(cldata.class_id==class_id){
				out.print("selected");
			} %></option>
			<%} %>
		</select>
		<input type="submit" value=""
	  style="width:35px; height:35px; background-image:url(src/view/img/icon.gif); background-size:34px 35px;"/>
		</form>
<br><br>
<%
if( id != null){
class_id = Integer.parseInt(id);
}
stList = getStData.getUserClass(class_id);
%>
		<table class="contents_center line_table">
			<tr>
				<th>氏名</th>
				<th>フリガナ</th>
				<th>生年月日</th>
				<th>更新/削除</th>
			</tr>
			<%for(User stdata : stList){ %>
			<tr>
				<td><%=stdata.name %></td>
				<td><%=stdata.name_kana %></td>
				<td><%=stdata.birth %></td>
				<td>
					<form action="<%=request.getContextPath() %>/admin_stupdate" method="post">
						<%request.setAttribute("stdata",stdata); %>
						<input type="hidden" value="<%=stdata.mail%>" name="stmail">
   						<input class="color_btn" type="submit" value="更新" style="inline;">
   					</form>
   					<form action="<%=request.getContextPath() %>/admin_stdel" method="post">
   						<input type="hidden" name="user_class_id" value=<%=stdata.class_id%>>
    					<input type="hidden" name="user_mail" value=<%=stdata.mail%>>
   						<input class="color_btn" type="submit"onclick='return confirm("削除します。よろしいですか？");' value="削除" style="inline;">
   					</form>
   				</td>
			</tr>
			<%} %>
		</table>
		<br>
		<form action="<%=request.getContextPath() %>/menu" method="post">
			<input class="btn" type="submit" value="メニューへ" >
		</form>
		<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
		</div>
</body>
</html>

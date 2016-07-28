
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
<%	String name = (String) request.getAttribute( "name" );
String kana = (String) request.getAttribute( "kana" );
Integer class_id = ((Integer) request.getAttribute( "class_id" ));
String class_name = (String) request.getAttribute( "class_name" );
String password =	(String)request.getAttribute("password" );
 %>
		<table class="contents_center">
			<tr>
				<td>お名前</td>
				<td><%= name %></td>
			</tr>
			<tr>
				<td>フリガナ(カナ）</td>
				<td><%=kana %></td>
			</tr>
			<tr>
				<td>学科学年クラス</td>
				<td><%=class_name %></td>
			</tr>
			<%
			//確認用
			System.out.println("********送信前*******");
			System.out.println("名前："+name);
			System.out.println("かな："+kana);
			System.out.println("クラスID："+class_id);
			System.out.println("クラス名："+class_name);
			System.out.println("パスワード："+password);
			//次のjava(Admin_stupdate_Success)に価を送る準備
				session.setAttribute("st_name",name);
				session.setAttribute("st_kana",kana);
				session.setAttribute("class_id",class_id);
				session.setAttribute("class_name",class_name);
				
				session.setAttribute("password",password);
			//確認用
			System.out.println("********SUCCESSに価を送ります*******");
			System.out.println("名前："+name);
			System.out.println("かな："+kana);
			System.out.println("クラスID："+class_id);
			System.out.println("クラス名："+class_name);
			System.out.println("パスワード："+password);
			
			
			
				out.print("<tr><td>パスワード</td>");
				out.print("<td>");
				int i = 0;
				while(i < password.length()){
					out.print("*");
					i++;
				}
				out.print("</td></tr>");	
				%>
		</table>
		<br>
		<% 
		
		%>
			<form action="<%=request.getContextPath() %>/admin_stupdate" method="get">
		<button class="btn">戻る</button>
		</form>
			<form action="<%=request.getContextPath() %>/admin_stupdate_success" method="post">
		<button class="color_btn" >登録</button>
	</form>
	</div>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

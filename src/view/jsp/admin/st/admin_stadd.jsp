
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
		<h2 class="text_center">学生情報追加</h2>
		<form action="<%=request.getContextPath() %>/admin_stadd_check" method="post" class="text_center">
			<table class="contents_center">
			<tr>
				<td>メールアドレス</td>
				<td><input  name="mail">@ st.asojuku.ac.jp</td>
			</tr>
			<tr>
				<td>お名前</td>
				<td>姓：<input  maxlength='8' name="name1" size="20"></td>
			</tr>
			<tr>
				<td></td>
				<td>名：<input  maxlength='8' name="name2" size="20"></td>
			</tr>
			<tr>
				<td>フリガナ（カナ）</td>
				<td>セイ：<input name="name3" size="20"></td>
			</tr>
			<tr>
				<td></td>
				<td>メイ：<input name="name"></td>
			</tr>
			<tr>
				<td>パスワード</td>
				<td><input type="password" name="password1" size="20"></td>
			</tr>
			<tr>
				<td>パスワード再入力</td>
				<td><input type="password" name="password"></td>
			</tr>

			<tr>
				<td>生年月日</td>
				<td><select name="year">
				<%
					int year = 1980;
					while(year <= 2016){
			%>
				<option value="<%=year%>"><%=year%></option>
			<%
				year++;
				}
			%>
				</select>
				年
				<SELECT name="month">
				<%
				int month = 01;
				while(month <= 12){
			%>
				<option value="<%=month%>"><%=month%></option>
			<%
				month++;
				}
			%>
				</SELECT>
				月
				<SELECT name="day">
				<%
				int day = 01;
				while(day <= 31){
			%>
				<option value="<%=day%>"><%=day%></option>
			<%
				day++;
				}
			%>
				</select>
				日
				</td>
			</tr>
			<tr>
				<td style="height: 23px">学科</td>
				<td style="height: 23px"><select name="example1" id="search2">
							<option value="">学科</option>
							</select></td>
			</tr>
			<tr>
				<td>学年</td>
				<td><select name="example2" id="search2">
							<option value="">学年</option>
							</select></td>
			</tr>
			<tr>
				<td>クラス</td>
				<td><select name="example" id="search2">
							<option value="">クラス</option>
							</select></td>
			</tr>
			</table>
			<input class="color_btn" type="submit" value="登録" >
		</form>
		<form action="<%=request.getContextPath() %>/menu" method="post" class="text_center">
			<input class="btn" type="submit" value="キャンセル" >
		</form>
		<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</body>
</html>
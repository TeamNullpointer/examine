<!DOCTYPE html>
<html>

<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="src/view/js/admin_exadd.js"></script>
<!-- ↓動かなかったので追加でimportしました。 -->
<%@ page import="java.util.*" %>
<%@ page import= "main.datamodel.objects.Examine"%>
<%@ page import= "main.datamodel.objects.PromoterInfo"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<title>検定情報の追加</title>
<!--CSSファイルはここに追記-->
<link href="src/view/css/template.css" rel="stylesheet" type="text/css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
<!--ここまで-->

</head>

<body>
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
 <h2>検定情報の追加</h2>

	<form action="<%=request.getContextPath()%>/admin_exadd_check" method="POST">
	 <p>
	<input type="radio" name="syusai" value="syusai" checked="check" id="syusai_select"> 登録済みの主催情報を登録
<input type="radio" name="syusai" value="syusai" id="syusai_new"> 新たな主催名を登録
</p>

 <p>
 	<select name="syusainame" id="search">
	<%
	List<PromoterInfo> s = (List<PromoterInfo>)request.getAttribute("promoter_name");
		for( PromoterInfo promo: s ){
	%>

		<!--↓DBから取得したデータ表示-->
		<option value="<%=promo.promoter_name%>"><%=promo.promoter_name%></option>
	<%
	}
	%>
	</select>

	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	主催名
	<input name="syusainame2" type="text" value="ここに主催名を入力" id="syusai_new_input">
	</p>
<p>
<input type="radio" name="kenteiSel" value="kentei1" checked="checked" id="kentei_select"> 登録済みの検定情報を登録
<input type="radio" name="kenteiSel" value="kentei2" id="kentei_new"> 新たな検定名を登録
</p>

<p>
	<select name="kentei" id="result">
	<%
	List<Examine> r = (List<Examine>)request.getAttribute("userList");
		for( Examine promo: r ){
	%>

		<!--↓DBから取得したデータ表示-->
		<option value="<%=promo.examine_name%>"><%=promo.examine_name%></option>
	<%
	}
	%>
	</select>
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	検定名<input name="kentei2" type="text" value="ここに主催名を入力" id="kentei_new_input">
</p>
<p>
開催日<select name="year">
	<%
		int year = 1980;
		while(year <= 2016){
			%>
				<option value="<%=year%>"><%=year%></option>
			<%
				year++;
				}
			%>
</select>年

		<select name="month">
			<%
				int month = 01;
				while(month <= 12){
			%>
				<option value="<%=month%>"><%=month%></option>
			<%
				month++;
				}
			%>
		</select>月
		<select name="day">
			<%
				int day = 01;
				while(day <= 31){
			%>
				<option value="<%=day%>"><%=day%></option>
			<%
				day++;
				}
			%>
		</select>日
		</p>

		<button  type="submit" class="color_btn">検定を登録する</button>
	</form>
	<form action="<%=request.getContextPath()%>/menu" method="POST">
		<button  type="submit" class="btn">メニュー画面へ</button>
	</form>

	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
	</div>
</body>

</html>

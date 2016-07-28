<!DOCTYPE html>
<html>

<head>
<%@ page import="java.util.*" %>
<%@ page import= "main.datamodel.objects.Examine"%>
<%@ page import= "main.datamodel.objects.PromoterInfo"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<title>検定情報一覧</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link href="src/view/css/template.css" rel="stylesheet" type="text/css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
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
<h2 class="text_center">検定情報一覧</h2>
<!--主催名検索-->
<div id="promotor_search" class="text_center">
	<select name="promotor_name" id="search">
		<option value="">主催名</option>
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
	<img alt="検索用アイコン" height="34" src="src/view/img/icon.gif" width="35" id="button">

</div>
<br>
<!--検定情報一覧表示-->
<div id="disp_examine">
<table id="result" class="line_table contents_center">
		<thead>
		<tr><th>主催名</th><th>検定名</th></tr>
	</thead>
<tbody>
		<%
	List<Examine> r = (List<Examine>)request.getAttribute("userList");
		for( Examine promo: r ){
%>
 		<form action="<%=request.getContextPath()%>/admin_exupdate" method="POST">
			<tr>
				<td><%=promo.promoter_name%></td>
				<td><%=promo.examine_name%></td>
			</tr>
			<input type="hidden" name="prom_name" value="<%=promo.promoter_name%>" />
			<input type="hidden" name="prom_id" value="<%=promo.promoter_id%>" />
			<input type="hidden" name="exa_name" value="<%=promo.examine_name%>" />
			<input type="hidden" name="exa_id" value="<%=promo.examine_id%>" />
		 </form>
<%
	}
%>

</tbody>
	</table>
	<script>
$(function(){
	$('#button').bind("click",function(){
		var re = new RegExp($('#search').val());
		$('#result tbody tr').each(function(){
			var txt = $(this).find("td:eq(0)").html();
			if(txt.match(re) != null ){
				$(this).show();
			}else{
				$(this).hide();
			}
		});
	});
	$('#button2').bind("click",function(){
		$('#result tr').show();
	});
});
</script>

</div>
<!-- </form> -->
<!--メニューへ戻る-->
<<form action="<%=request.getContextPath() %>/menu" method="post">
			<input class="btn" type="submit" value="メニューへ" >
		</form>
	<footer>
		<p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p>
	</footer>
</body>

</html>

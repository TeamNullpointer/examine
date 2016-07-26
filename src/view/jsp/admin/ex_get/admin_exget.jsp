<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="main.datamodel.objects.User" %>
<%@ page import="main.model.teacherexmine.TeacherExamine"%>
<%@ page import="main.model.examineinfo.ExaDisp" %>
<%@ page import="main.model.examineinfo.ExaList" %>
<%@ page import="main.model.examineinfo.HistoryDisp" %>
<%@ page import="main.datamodel.objects.ExamineHistoryTeacher" %>
<%@ page import="main.datamodel.objects.GetExamineHistoryTeacher" %>
<%@ page import="main.datamodel.objects.PromoterInfo" %>
<%@ page import="main.datamodel.objects.Examine"%>
<%@ page import="main.datamodel.objects.HistoryInfo"%>
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
%>
ようこそ<b><%=user.name %></b>さん。
<form  action="<%=request.getContextPath()%>/logout" method="get">
<input class="header_btn" name="Button1" type="submit" value="ログアウト" />
</form>

</header>
<%
List<ExamineHistoryTeacher> getExList = new ArrayList<ExamineHistoryTeacher>();
List<PromoterInfo> promoter = new ArrayList<PromoterInfo>();
List<Examine> examine = new ArrayList<Examine>();
ExaList getPro = new ExaList();
ExaDisp getEx = new ExaDisp();
promoter = getPro.list();
GetExamineHistoryTeacher geht = new GetExamineHistoryTeacher();
geht = (GetExamineHistoryTeacher)request.getAttribute("geht");
String promoter_id = (String)request.getAttribute("p_id");
//String date = request.getParameter("date");
//System.out.println(promoter_id);
//System.out.println(geht.promoter_id);
if(promoter_id != null){

	//}else{
	//geht.examine_day = date;
	//geht.examine_id = examine_id;
	//geht.promoter_id = promoter_id;
	System.out.println(promoter_id);
	TeacherExamine getList = new TeacherExamine();
	getExList = getList.examine_select(geht);
}

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--  <script src="src/view/js/text.js"></script>-->
<script>
(function(){
    $("form").submit(function(){
        var promoter = $('select[name="promotor_name"]').val();
        var examine = $('select[name="examine_search"]').val();
        var day = $('select[name="select_day"]').val();
        alert(promoter,examine,day);
    });
});
</script>
<h2 class="text_center">取得検定一覧</h2>
<!--主催名、検定名、実施日検索-->
<form action="<%=request.getContextPath() %>/admin_exget" method="POST" id="form">
<div class="text_center">
	<select name="promotor_name">
		<option value="">主催名</option>
		<% for(PromoterInfo pro : promoter){ %>
			<option value="<%= pro.promoter_id %>"><%= pro.promoter_name %></option>
		<%} %>
	</select>
		<!--↓DBから取得した検定名を表示-->
		<%
			examine = getEx.disp(null);
		%>
			<script>
				 exmaine = [ <% for(int i = 0; i <= examine.size()-1; i++){
					 out.print("{id : " + examine.get(i).examine_id + ",promoter_id :" + examine.get(i).promoter_id + ",name :" + "'" + examine.get(i).examine_name + "'" + "}");
					 if(i < examine.size()-1)out.print(",");
				 } %>];
			 </script>
		<select name="examine_serch">
		<option value="">検定名</option>
	</select>

	<select name="select_date">
		<option value="">実施日</option>
		<!--↓DBから取得した実施日を表示-->
		<%
		HistoryDisp hids = new HistoryDisp();
		List<HistoryInfo> s = hids.list();

		%>

	</select>
	<script>
	$(document).ready(function(){
		$('#postbtn').hide()
	})
	</script>

	<script>
	 	var eid = $('[name=examine_serch]').val();
		 var date_raw = [ <% for(int i = 0; i <= s.size()-1; i++){
			 System.out.print(s.get(i).date);
			 out.print("{id : " + s.get(i).examine_id + ",date :"  + "\"" + s.get(i).date.replace("/", ":") + "\".replace(/:/g, '/')"  + "}");
			 if(i < examine.size()-1)out.print(",");
		 } %>];
	 </script>


	 	<script>

		$('[name=promotor_name]').change(function(){
			var selected = $('[name=promotor_name]').val();
			if (selected == '') {

			}else{
				$('[name=examine_serch]').empty();
				$('[name=examine_serch]').append('<option value="">検定名</option>');
				$('[name=select_date]').empty();
				$('[name=select_date]').append('<option value="">実施日</option>');
				exmaine.forEach(function(element) {
					if(element.promoter_id == selected){
						$('[name=examine_serch]').append('<option value="' + element.id + '">' + element.name + '</option>');
					}
				});
			}
		});

		function addExamine(id, name) {
			var o = {id: id, name: name}
			exmaine.push(o);
		}

		$('[name=examine_serch]').change(function(){
			var selected = $('[name=examine_serch]').val();
			$('[name=select_date]').empty();
			$('[name=select_date]').append('<option value="">実施日</option>');
			if(selected == ''){

			}else{
				date_raw.forEach(function(element) {
					if(element.id == parseInt(selected)){
						$('[name=select_date]').append('<option value="' + element.date + '">' + element.date + '</option>');
					}
				});
			}
		});
		var info = {};
		$('[name=select_date]').change(function(){
			var proid = $('[name=promotor_name]').val();
			var exaid = $('[name=examine_serch]').val();
			var date = $('[name=select_date]').val();
			info.promoter_id = proid;
			info.examine_id = exaid;
			info.date = date;
			$('#postbtn').show()
			//ここにinfoの情報を書く
			$('#form').append('<input type="hidden" name="promoter_id" value="' + info.promoter_id + '">');
			$('#form').append('<input type="hidden" name="examine_id" value="' + info.examine_id + '">');
			$('#form').append('<input type="hidden" name="date" value="' + info.date + '">');
		});
	</script>
	を持った学生一覧
	 <input id="postbtn" type="submit" value=""  style="width:35px; height:35px; background-image:url(src/view/img/icon.gif); background-size:34px 35px;"/>
	</div>
	</form>
	<br>
	<!--検定を取得している学生一覧を表示-->

		<table class="line_table contents_center">
			<tr>
				<th>学科・学年・クラス</th>
				<th>氏名</th>
			</tr>
			<%
			for(ExamineHistoryTeacher eht : getExList){
			%>
			<!--↓DBから取得したデータ表示-->
			<tr>
				<td><%=eht.class_name %></td>
				<td>
					<form action="<%=request.getContextPath() %>/admin_exlist_single" method="get">
					<input name=mail type="hidden" value="<%=eht.mail %>" />
					<%//session.setAttribute("exgetmail",eht.mail);%>
					<input type="submit" value="<%=eht.name %>"/>
					</form>
					<!-- <a href="<%=request.getContextPath() %>/admin_exlist_single"><%=eht.name %></a> -->
				</td>
				<td><%=eht.mail %></td>
			</tr>

			<%

			}
			 %>
		</table>
	<!--メニューへ戻る-->
	<br>
	<br>
	<form name = "form" action="<%=request.getContextPath() %>/menu" class="text_center" method="POST">
		<input type="submit" value="メニューへ"  class="btn"/>
	</form>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>

</body>

</html>
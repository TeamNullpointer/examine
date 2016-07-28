<!DOCTYPE html>
<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@page import="main.datamodel.objects.StudentExamineHistory"%>
<%@page import="main.datamodel.objects.ExamineHistoryTeacher"%>
<html>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="main.model.studentexamine.*" %>
<%@ page import="main.model.teacherexamine.*" %>
<%@page import="main.datamodel.objects.User" %>
<%@ page contentType="text/html; charset=utf-8" %>
<head>
<meta content="ja" http-equiv="Content-Language">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>管理者側_取得検定一覧画面</title>
<link href="src/view/css/template.css" rel="stylesheet" type="text/css">
<link href="src/view/css/menu.css" rel="stylesheet" type="text/css">
</head>

<body>
<header>
<%
User user = new User();
String stnum = (String)request.getAttribute("stnum");
String mailadd = "";
System.out.println(stnum);
if(stnum != null){
mailadd = stnum;
}else{
mailadd = (String)request.getParameter("StudentSerch") + "@st.asojuku.ac.jp";
}
user.mail = mailadd;
List<StudentExamineHistory> stExamList = new ArrayList<StudentExamineHistory>();
StudentExamine stExam = new StudentExamine();
stExamList = stExam.select(user);

List<ExamineHistoryTeacher> thExamList = new ArrayList<ExamineHistoryTeacher>();
TeacherExamine thExam = new TeacherExamine();
thExamList = thExam.student_select(mailadd);

String st_name = "";
try{
	st_name = thExamList.get(0).name;
}catch(IndexOutOfBoundsException e){

}

%>

<img class="logo" alt="logo" src="src/view/img/logo.gif">
<h1>検定管理システム</h1>
ようこそ<b><!--ユーザの名前を表示する--></b>さん。
<form  action="<%=request.getContextPath()%>/logout" method="get">
<input class="header_btn" name="Button1" type="submit" value="ログアウト" />
</form>
<!--ここにパンくずリストを書いて下さい-->
<!--処理の例が書いてあるので書き換えるかコピー＆ペーストしてください-->
<div class="pan_list">
</div>
<!--パンくずリストのコードはここまで-->

</header>
<div class="text_center">
<h2>学生取得検定一覧</h2>
<% if(st_name.equals("")){%>
<p>下記のテキストボックスに学生のメールアドレスを入力し、検索して下さい。</p>
<%}else{ %>
<p><%=st_name%>が取得した検定の一覧です</p>
<%} %>
<table class="line_table contents_center">
  <tr>
    <td>受験年月日</td>
    <td>主催団体</td>
    <td>資格名</td>
  </tr>
 <tr>
 <%for(StudentExamineHistory stExamHis :stExamList){ %>
 	<tr>
 	<%if(stExamHis.pass_flg == false){
 		continue;
 	}
 %>
    <td><%=stExamHis.examine_day %></td>
    <td><%=stExamHis.promoter_name %></td>
    <td><%=stExamHis.examine_name %></td>
    <%} %>
  </tr>
</table>
<p>学生を探す</p>
<form  action="<%=request.getContextPath() %>/admin_exlist_single" method="GET" style="display: inline">
	<INPUT type="text" name="StudentSerch">@st.asojuku.ac.jp
	<input type="submit" style="width:35px; height:35px; background-image:url(src/view/img/icon.gif); background-size:34px 35px;">
</form>
<form method="get" action="<%=request.getContextPath()%>/admin_exget">
	<br>
		<button class="btn" type="submit" >検定の検索へ</button>
	</form>
	</div>
	<footer><p class="text_center">Copyright &copy; 2016 Team Nullpointer All rihgt Reserved.</p></footer>
</body>

</html>

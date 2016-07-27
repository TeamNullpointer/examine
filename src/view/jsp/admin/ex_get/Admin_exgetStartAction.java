package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.datamodel.objects.GetExamineHistoryTeacher;

public class Admin_exgetStartAction  extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/ex_get/admin_exget.jsp");
		// TODO 自動生成されたメソッド・スタブ
		rd.forward(req, resp);
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/ex_get/admin_exget.jsp");
		// TODO 自動生成されたメソッド・スタブ
		GetExamineHistoryTeacher geht = new GetExamineHistoryTeacher();
		String promoter_id = req.getParameter("promoter_id");
		String examine_id = req.getParameter("examine_id");
		String date = req.getParameter("date");
		String sdate = date.replaceAll("/", "-");
		System.out.println("id" + promoter_id);
		geht.examine_day = sdate;
		geht.examine_id = examine_id;
		geht.promoter_id = promoter_id;
		req.setAttribute("p_id", promoter_id);
		req.setAttribute("geht", geht);
		rd.forward(req, resp);
	}

}

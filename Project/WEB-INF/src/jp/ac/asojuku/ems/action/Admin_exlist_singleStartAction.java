package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Admin_exlist_singleStartAction  extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/ex_get/admin_exlist_single.jsp");
		// TODO 自動生成されたメソッド・スタブ
		String stnum = req.getParameter("mail");
		req.setAttribute("stnum", stnum);
		rd.forward(req, resp);
	}

}
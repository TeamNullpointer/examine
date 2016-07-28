package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;

public class Admin_staddStartAction  extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stadd.jsp");
		// TODO 自動生成されたメソッド・スタブ
		/*
		rd.forward(req, resp);
		stAdd.mail = req.getParameter("mail");
		stAdd.name = req.getParameter("name1") + "　" + req.getParameter("name2");
		stAdd.name_kana = req.getParameter("name3") + "　" + req.getParameter("name4");
		stAdd.class_id = Integer.parseInt(req.getParameter("class_id"));
		String pass = req.getParameter("pass");
		String pass_check = req.getParameter("pass_check");
		if(pass != pass_check){
			rd.forward(req, resp);
		}else{
			stAdd.password = pass;
		}
		stAdd.birthday = req.getParameter("year") + "/" + req.getParameter("month") + req.getParameter("day");
		stAdd.manage_flg = false;
		*/


		//req.setAttribute("stAdd", stAdd);

		rd.forward(req, resp);

	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stadd.jsp");
		// TODO 自動生成されたメソッド・スタブ
		rd.forward(req, resp);
	}
}

package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.datamodel.objects.ManageUser;

public class Admin_stadd_checkStartAction  extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		ManageUser stAdd = new ManageUser();
		stAdd.mail = req.getParameter("mail") + "@st.asojuku.ac.jp";
		stAdd.name = req.getParameter("name1") + "　" + req.getParameter("name2");
		stAdd.name_kana = req.getParameter("name3") + "　" + req.getParameter("name4");
		stAdd.class_id = Integer.parseInt((String)req.getParameter("class_id"));
		String pass = req.getParameter("pass");
		System.out.println(pass);
		String pass_check = req.getParameter("pass_check");
		System.out.println(pass_check);
		if(pass.equals(pass_check)){
			stAdd.password = pass;
		}else{

		}
		String birthday = req.getParameter("year") + "/" + req.getParameter("month") + "/" + req.getParameter("day");
		stAdd.birthday = req.getParameter("year") + "-" + req.getParameter("month") + "-" + req.getParameter("day");
		stAdd.manage_flg = false;

		req.setAttribute("birthday", birthday);
		session.setAttribute("check_form", stAdd);

		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stadd_check.jsp");
		// TODO 自動生成されたメソッド・スタブ
		rd.forward(req, resp);
	}
}

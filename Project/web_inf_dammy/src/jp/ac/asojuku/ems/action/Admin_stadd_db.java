package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.datamodel.objects.ManageUser;
import main.model.students.Students;

public class Admin_stadd_db extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession(false);

		ManageUser addUser = (ManageUser)session.getAttribute("check_form");
		System.out.println(addUser.birthday);
		System.out.println(addUser.class_id);
		System.out.println(addUser.mail);
		System.out.println(addUser.name);
		System.out.println(addUser.name_kana);
		System.out.println(addUser.password);

		Students student = new Students();
		boolean succsess = student.addStudent(addUser);
		if(succsess  == true){
			System.out.println("成功");
		}else{
			System.out.println("失敗");
		}

		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stlist.jsp");
		// TODO 自動生成されたメソッド・スタブ
		rd.forward(req, resp);
	}
}
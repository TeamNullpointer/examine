package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutSuccess extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//ログアウトの
		//
		//
		HttpSession loginSession = req.getSession(false);
		loginSession.invalidate();
		if(loginSession == null){
			System.out.print("セッションが切れています");
		}else{
			  System.out.print("セッションが切れていません");
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/system/login.jsp");
		// TODO 自動生成されたメソッド・スタブ
		rd.forward(req, resp);
	}
}

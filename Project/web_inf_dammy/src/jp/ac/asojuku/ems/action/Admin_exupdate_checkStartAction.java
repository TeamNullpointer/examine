package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Admin_exupdate_checkStartAction extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = null;

		// jspからの情報を取得する
		String syusai = req.getParameter("syusai");
		String kentei = req.getParameter("kentei");

		try {
			// セッション処理を作成する
			// セッションの取得
			HttpSession session = req.getSession(true);
			session.setAttribute("syusaiUp", syusai);
			session.setAttribute("kenteiUp", kentei);
			// JSPファイルへフォワードする RequestDispatcher オブジェクト
			rd = req.getRequestDispatcher("src/view/jsp/admin/ex_list/admin_exupdate_check.jsp");
			// brake文を書く

		} catch (Exception e) {
			// 例外発生時の処理
			req.setAttribute("errMessage", e);
			// JSPファイルへフォワードする RequestDispatcher オブジェクト
			rd = req.getRequestDispatcher("src/view/jsp/st/Loginfail.jsp");
		}

		// JSPファイルへフォワード
		rd.forward(req, resp);
	}
}

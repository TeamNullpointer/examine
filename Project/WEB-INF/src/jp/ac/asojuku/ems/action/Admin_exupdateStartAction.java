package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Admin_exupdateStartAction  extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = null;


		try{


			// jspからの情報を取得する
	    	String prom_name = req.getParameter("prom_name");
	    	String prom_id = req.getParameter("prom_id");
	    	String exa_name = req.getParameter("exa_name");
	    	String exa_id = req.getParameter("exa_id");


        			//リクエストのパラメーターにnameをいれてjspに移動
        			req.setAttribute("prom_name",prom_name);
        			req.setAttribute("exa_name",exa_name);
        			//セッション処理を作成する
        			//セッションの取得
        			HttpSession session = req.getSession(true);
        			session.setAttribute("promUp_id", prom_id);
        			session.setAttribute("exaUp_id", exa_id);
        			//JSPファイルへフォワードする RequestDispatcher オブジェクト
        			rd = req.getRequestDispatcher("src/view/jsp/admin/ex_list/admin_exupdate.jsp");
        			//brake文を書く

		} catch (Exception e){
			//例外発生時の処理
        	req.setAttribute("errMessage",e);
			//JSPファイルへフォワードする RequestDispatcher オブジェクト
			rd = req.getRequestDispatcher("src/view/jsp/st/Loginfail.jsp");
        }

		//JSPファイルへフォワード
		rd.forward(req,resp);
	}

}

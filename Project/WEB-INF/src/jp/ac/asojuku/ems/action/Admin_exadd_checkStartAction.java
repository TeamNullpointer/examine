package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Admin_exadd_checkStartAction  extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		// jspからの情報を取得する
    	String syusai = req.getParameter("syusai");
    	String syusainame = null;
    	String kenteiSel = req.getParameter("kenteiSel");
    	String kentei = null;
    	String year = req.getParameter("year");
    	String month = req.getParameter("month");
    	String day = req.getParameter("day");
    	
    	System.out.println(syusai);
    	System.out.println(kenteiSel);
    	




    	if(syusai.equals("syusai")){
    		syusainame = req.getParameter("syusainame");
    	}else{
    		syusainame = req.getParameter("syusainame2");
    	}

    	if(kenteiSel.equals("kentei")){
    		kentei = req.getParameter("kentei1");
    	}else{
    		kentei = req.getParameter("kentei2");
    	}
    	//requestオブジェクト内の文字コード設定
    			req.setCharacterEncoding("UTF-8");
    			RequestDispatcher rd = null;


    			try{
		    				//セッション処理を作成する
		        			//セッションの取得
		        			HttpSession session = req.getSession(true);
		        			session.setAttribute("syusai", syusai);
		        			session.setAttribute("syusainame", syusainame);
		        			session.setAttribute("kentei", kentei);
		        			session.setAttribute("year", year);
		        			session.setAttribute("month",month);
		        			session.setAttribute("day", day);
    	        			//リクエストのパラメーターに値をいれてjspに移動
    	        			//JSPファイルへフォワードする RequestDispatcher オブジェクト
    	        			rd = req.getRequestDispatcher("src/view/jsp/admin/ex_list/admin_exadd_check.jsp");
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

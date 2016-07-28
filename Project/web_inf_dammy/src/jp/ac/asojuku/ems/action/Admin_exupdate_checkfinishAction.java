package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.datamodel.objects.Examine;
import main.model.examineinfo.ExaUpdate;

public class Admin_exupdate_checkfinishAction extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		// jspからの情報を取得する
		//セッションの取得
		HttpSession session = req.getSession(true);
		String syusaiUp = (String)session.getAttribute("syusaiUp");
		String kenteiUp = (String)session.getAttribute("kenteiUp");
		String promUpId = (String)session.getAttribute("promUp_id");
		String exaUpId = (String)session.getAttribute("exaUp_id");



     	//requestオブジェクト内の文字コード設定
    			req.setCharacterEncoding("UTF-8");
    			RequestDispatcher rd = null;
    			try{
    				//検定情報更新
    				Examine UpEx = new Examine();
    				UpEx.examine_id = exaUpId;
    				UpEx.examine_name = kenteiUp;
    				UpEx.promoter_id = promUpId;
    				UpEx.promoter_name = syusaiUp;
    				ExaUpdate exaup = new ExaUpdate();
    				boolean y = exaup.update(UpEx);
    				System.out.println(y);
    						if(y){
    							//JSPファイルへフォワードする RequestDispatcher オブジェクト
    							rd = req.getRequestDispatcher("/admin_exlist");
    						}else{
    							rd = req.getRequestDispatcher("src/view/jsp/st/Loginfail.jsp");
    						}

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

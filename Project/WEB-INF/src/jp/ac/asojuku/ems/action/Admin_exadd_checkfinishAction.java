package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.datamodel.objects.AddExamine;
import main.model.examineinfo.ExaAdd;

public class Admin_exadd_checkfinishAction  extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String promoter_id = null;
		String promoter_name = null;
		// jspからの情報を取得する
		//セッションの取得
		HttpSession session = req.getSession(true);
		String syusai = (String)session.getAttribute("syusai");
		String syusainame = (String)session.getAttribute("syusainame");
		String kentei = (String)session.getAttribute("kentei");
		String year = (String)session.getAttribute("year");
		String month = (String)session.getAttribute("month");
		String day = (String)session.getAttribute("day");

		//日付を結合
		String x = "-";
		String days = year + x + month + x + day;
		if(syusai.equals("syusai")){
			//文字列　分割
			String[] syusaidata = syusainame.split(" ",0);
			promoter_name = syusaidata[0];
			promoter_id = syusaidata[1];
    	}else{
    		promoter_name = syusainame;
    		promoter_id = "0";
    	}

     	//requestオブジェクト内の文字コード設定
    			req.setCharacterEncoding("UTF-8");
    			RequestDispatcher rd = null;
    			//test
    			System.out.println(syusainame);
    			System.out.println(kentei);
    			System.out.println(days);
    			System.out.println(promoter_name);
    			System.out.println(promoter_id);

    			try{
    				//検定情報追加
    				AddExamine AddEx = new AddExamine();
    				AddEx.promoter_id = promoter_id;
    				AddEx.examine_name = kentei;
    				AddEx.examine_day = days;
    				AddEx.promoter_name = promoter_name;
    				ExaAdd exaadd = new ExaAdd();
    				boolean y = exaadd.add(AddEx);
    				System.out.println(y);
    						if(y){
    							//JSPファイルへフォワードする RequestDispatcher オブジェクト
    							rd = req.getRequestDispatcher("src/view/jsp/admin/ex_list/admin_exlist.jsp");
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


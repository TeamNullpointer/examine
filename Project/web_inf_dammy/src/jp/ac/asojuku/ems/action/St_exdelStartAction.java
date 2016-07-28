package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.datamodel.objects.StudentExamineHistory;
import main.datamodel.objects.User;
import main.model.studentexamine.StudentExamine;

public class St_exdelStartAction extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		// jspからの情報を取得する
    	String history_id = req.getParameter("history");
    	String user_mail = req.getParameter("user");
    	System.out.println(history_id);

    	User user = new User();
    	user.mail = user_mail;
    	StudentExamineHistory seh = new StudentExamineHistory();
    	seh.history_id = history_id;
    	StudentExamine exdel = new StudentExamine();
    	boolean x = exdel.delete(user, seh);
    	System.out.println(x);


    	//requestオブジェクト内の文字コード設定
    			req.setCharacterEncoding("UTF-8");
    			RequestDispatcher rd = null;
    			try{

    	        			//リクエストのパラメーターに値をいれてjspに移動
    	        			//JSPファイルへフォワードする RequestDispatcher オブジェクト
    	        			rd = req.getRequestDispatcher("src/view/jsp/st/st_exget.jsp");
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

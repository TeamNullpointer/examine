package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.datamodel.objects.User;
import main.model.students.Students;

public class Admin_stDelStartAction extends HttpServlet{

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		// jspからの情報を取得する
    	String class_id = req.getParameter("user_class_id");
    	String mail = req.getParameter("user_mail");
    	System.out.println(mail);
    	System.out.println(class_id);

    	User user = new User();
    	user.mail = mail;
    	user.class_id = Integer.parseInt(class_id);
    	Students stdel = new Students();
    	boolean x = stdel.deleteUser(user);
    	System.out.println(x);


    	//requestオブジェクト内の文字コード設定
    			req.setCharacterEncoding("UTF-8");
    			RequestDispatcher rd = null;
    			try{

    	        			//リクエストのパラメーターに値をいれてjspに移動
    	        			//JSPファイルへフォワードする RequestDispatcher オブジェクト
    	        			rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stlist.jsp");
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

package jp.ac.asojuku.ems.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.datamodel.objects.ClassInfo;
import main.datamodel.objects.User;
import main.model.students.Students;

public class Admin_stupdate_checkStartAction  extends HttpServlet {
		String class_name;
		int class_id ;
		String kana;
		String name;
		String password;
		String password2;
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<User> stList = new ArrayList<User>();
		List<ClassInfo> classes = new ArrayList<ClassInfo>();
		Students getStData = new Students();
		classes = getStData.getClassList();
		//前の画面から値取得&格納
		name = (String)req.getParameter("name");
		System.out.println("******更新チェックの確認*******");
		System.out.println("名前："+name);
		kana = (String)req.getParameter("kana");
		System.out.println("かな："+kana);
		class_id = Integer.parseInt((String)req.getParameter("class_id"));
		System.out.println("クラスID："+class_id);
		password = (String)req.getParameter("password");
		password2 = (String)req.getParameter("password2");
		
		//クラスの名前を取ってくる処理
		for(ClassInfo cldata : classes){
			if(cldata.class_id == class_id){
			class_name = cldata.class_name;	
			}
		}
		System.out.println("クラス："+class_name);
		//次の画面に送るようの値をセット
		req.setAttribute("name", name);
		req.setAttribute("kana", kana);
		req.setAttribute("class_id", class_id);
		req.setAttribute("class_name", class_name);
		req.setAttribute("password", password);
		req.setAttribute("password2", password2);
		
		RequestDispatcher rd ;
		//価のチェック
		System.out.println("パスワード："+password);
		System.out.println("確認用パスワード："+password2);
		
		
		if(password.equals(password2) ){
			System.out.println("パスの変更、パスワード確認用と入力された値が一致");
			//パスワードを変更しない
			rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stupdate_check.jsp");
			// TODO 自動生成されたメソッド・スタブ
			rd.forward(req, resp);
		}
		if(  password.equals("") && password2.equals("")){
			System.out.println("パスの変更なし、パスワード確認用と入力された値が空");
			//パスワードが正しい
			rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stupdate_check.jsp");
			// TODO 自動生成されたメソッド・スタブ
			rd.forward(req, resp);
		}
		else{	System.out.println("入力エラー");
			//パスワードに正しくない値が入力されている
			rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stupdate.jsp");
			// TODO 自動生成されたメソッド・スタブ
			rd.forward(req, resp);
		}
	}

}

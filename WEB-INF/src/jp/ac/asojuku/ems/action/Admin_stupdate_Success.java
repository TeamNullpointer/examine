package jp.ac.asojuku.ems.action;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import main.datamodel.objects.User;
import main.datamodel.objects.ClassInfo;
import main.datamodel.objects.ManageUser;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.students.Students;
import main.datamodel.objects.User;
import main.model.login.Login;

public class Admin_stupdate_Success  extends HttpServlet {
	 
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		//インスタンス生成
		String stdata[] = new String[4];
		main.datamodel.mapper.User stList = new main.datamodel.mapper.User();
		List<ClassInfo> classes = new ArrayList<ClassInfo>();
		Students getStData = new Students();
		classes = getStData.getClassList();
		ManageUser muser = new ManageUser();
		Students student = new Students();
		User user = new User();
		
		//メアドの取得
		String mail = (String) session.getAttribute("st_mail");
		//前の画面からの値取得
		String name = (String) session.getAttribute( "st_name" );
		String kana = (String) session.getAttribute( "st_kana" );
		Integer class_id =(Integer)session.getAttribute( "class_id" ) ;
		String password = (String) session.getAttribute( "password" );//セッションで取ってくる価の検証（おもちかえり残業）
		Date birthday = (Date) session.getAttribute( "st_birth" );
		String class_name = (String) session.getAttribute( "class_name" );
		//日付の変換
		String DATE_PATTERN ="yyyy/MM/dd";
		String birth;
		birth = new SimpleDateFormat(DATE_PATTERN).format(birthday);
		birth.replace('/', '-');
		System.out.println("*****学生情報の更新値*****");
		System.out.println("なまえ"+name);
		System.out.println("かな"+kana);
		System.out.println("クラスID"+class_id);
		System.out.println("PASS"+password);

		//変更する分の項目を呼び出し
		stList = getStData.getUser(mail);//
		muser.name = name;
		muser.name_kana = kana;
		muser.class_id = (int) class_id;
		muser.password = password;
		
		System.out.println("*****学生情報の更新値*****");
		System.out.println("なまえ"+muser.name);
		System.out.println("かな"+muser.name_kana);
		System.out.println("クラスID"+muser.class_id);
		System.out.println("PASS"+muser.password);
	
		
		//元のDBを呼び出し
		user.name =stList.user_name;
		user.name_kana = stList.user_name_kana;
		user.class_id=stList.class_id;
		user.birth =birth;
		user.mail = mail;
		user.class_name = class_name;
		
		System.out.println("*****ベースの値*****");
		System.out.println("なまえ"+user.name);
		System.out.println("かな"+user.name_kana);
		System.out.println("クラスID"+user.class_id);
		System.out.println("誕生日"+user.birth);
		System.out.println("メアド"+user.mail);
		System.out.println("クラス名"+user.class_name);
		 //パスワードがUserに必要？？
		
		//DBに変更分を登録
		boolean modify_flg = student.modifyUser(muser, user);//左が変更分で、右がベース
		//変更できたかどうかを判定
		if(modify_flg==true){
			System.out.println("情報の更新が完了しました。");
		}
		else{
			System.out.println("情報の更新に失敗しました。");
		}
		//メニュー画面へ
		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stlist.jsp");
		// TODO 自動生成されたメソッド・スタブ
		rd.forward(req, resp);
	}
}
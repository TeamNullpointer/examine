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

import main.datamodel.objects.User; 
import main.datamodel.objects.ClassInfo;
import main.model.students.*;
import main.datamodel.mapper.*;

public class Admin_stupdateStartAction  extends HttpServlet {
	String class_name; //クラス名用の変数
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
		String stdata[] = new String[4];
		main.datamodel.mapper.User stList = new main.datamodel.mapper.User();
		List<ClassInfo> classes = new ArrayList<ClassInfo>();
		Students getStData = new Students();
		classes = getStData.getClassList();
		
		//前の画面から情報受け取り
		String stmail = req.getParameter("stmail");//メールアドレスを取ってくる
		System.out.println("前の画面からもらってきた値:"+stmail+"データ型："+stmail.getClass()); 
		int	class_id;
		//DBからメアドに合致している価を検索
		 stList = getStData.getUser(stmail);
		 class_id = stList.class_id;//クラスIDを変数に格納 
		 //クラス名の検索
			for(ClassInfo cldata : classes){
			//自分の学科を初期値にする
			if(cldata.class_id==class_id){
				class_name=cldata.class_name;
				}
			}
			
		 
		 
		 	System.out.println("******リスト情報取得******");
			System.out.println( "メールアドレス；"+stList.mail_address );
			System.out.println( "名前："+stList.user_name );
			System.out.println( "かな："+stList.user_name_kana );
			System.out.println( "クラスのID"+stList.class_id );
		//次の画面へ価を送る
			req.setAttribute("mail",stList.mail_address);
			System.out.println(stList.mail_address+"データ型："+stList.mail_address.getClass());
			req.setAttribute("name",stList.user_name);
			System.out.println(stList.user_name+"データ型："+stList.user_name.getClass());
			req.setAttribute("kana",stList.user_name_kana);
			System.out.println(stList.user_name_kana+"データ型："+stList.user_name_kana.getClass());
			req.setAttribute("class_id",stList.class_id);
			System.out.println(stList.class_id+"データ型："+stList.class_id.getClass());
			System.out.println("******以下の値はセッションに格納されます*****");
			session.setAttribute("st_birth",stList.user_birth);
			System.out.println(stList.user_birth+"データ型："+stList.user_birth.getClass());
			session.setAttribute("class_name", class_name);
			System.out.println(class_name+"データ型："+class_name.getClass());
			//stdata[0] = stList.mail_address;
			//stdata[1] = stList.user_name;
			//stdata[2] = stList.user_name_kana;
			//stdata[3] = stList.class_id.toString();
			
			//req.setAttribute("stdata",stdata);
			
		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/admin/st/admin_stupdate.jsp");
		// TODO 自動生成されたメソッド・スタブ
		rd.forward(req, resp);
	}
}

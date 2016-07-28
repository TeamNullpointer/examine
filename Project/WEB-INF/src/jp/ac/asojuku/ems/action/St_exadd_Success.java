package jp.ac.asojuku.ems.action;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.datamodel.objects.AddHistory;
import main.datamodel.objects.User;
import main.datamodel.objects.User;
import main.model.studentexamine.*;

public class St_exadd_Success  extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//前の画面から値取得
		String promoter_id =(String)req.getParameter("promoter_id");
		String examine_id =(String)req.getParameter("examine_id");
		String day =(String)req.getParameter("date");
		String date;
		date = day.replaceAll("/", "-");
		System.out.println("EXAMINE_DAY="+date);
		String pass_flg =(String)req.getParameter("result");//０で不合格、１で合格
		
		HttpSession session = req.getSession(false);
		User user = new User();//ユーザー情報
		StudentExamine se = new StudentExamine();
		AddHistory add = new AddHistory();//検定取得情報
		user = (User)session.getAttribute("user");
		String usermail =(String) user.mail;//DBで照合させるためにメアドを取ってくる
		RequestDispatcher rd;
		String DATE_PATTERN ="yyyy/MM/dd";
		
		
		//価の確認
		System.out.println("*****追加する検定の情報*****");
		System.out.println("PROMOTER_ID="+promoter_id);
		System.out.println("EXAMINE_ID="+examine_id);
		System.out.println("EXAMINE_DAY="+date);
		System.out.println("RESULT="+pass_flg);
		System.out.println("*****生徒のメアドの情報*****");
		System.out.println("MAIL="+usermail);
		
		//パスフラグの加工
		boolean pass;
		if(pass_flg.equals("0")){
			pass = false;
			System.out.println("PASS=FALSE");
		}
		else{
			pass = true;
			System.out.println("PASS=TRUE");
		}
		//DBに取得検定を追加
		//DBに入れる値をまとめる
		user.mail = usermail;
		add.examine_id = examine_id;
		add.examine_day = date;
		add.pass_flg = pass;
		//DBに値を挿入
		boolean judge;
		judge = se.insert(user, add);
		//DB登録の可否
		if(judge == true){
			System.out.println("登録が完了しました");
			rd = req.getRequestDispatcher("src/view/jsp/st/st_exget.jsp");
			// TODO 自動生成されたメソッド・スタブ
			rd.forward(req, resp);
		}
		else{
			System.out.println("登録に失敗しました");
			rd = req.getRequestDispatcher("src/view/jsp/st/st_exadd.jsp");
			// TODO 自動生成されたメソッド・スタブ
			rd.forward(req, resp);
		}
		
	}
}
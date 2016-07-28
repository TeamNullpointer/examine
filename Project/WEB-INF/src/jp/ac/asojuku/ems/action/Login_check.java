package jp.ac.asojuku.ems.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.datamodel.objects.User;
import main.model.login.Login;

public class Login_check  extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("src/view/jsp/system/menu.jsp");

		//前の画面から価を持ってくる
		String usermail = req.getParameter("usermail");


		String password = req.getParameter("password");

		 HttpSession login_session = req.getSession(false);
		 //ドメインの付与
		 if(usermail.startsWith("1")){
			 	usermail+="@st.asojuku.ac.jp";

		 }
		 else{
			 usermail+="@asojuku.ac.jp";

		 }
		 System.out.println("前の画面からのユーザーのメアド"+usermail);
		 System.out.println("前の画面からのユーザーのパスワード"+password);
		 //セッションの作成処理
		 if (login_session == null){
		      login_session = req.getSession(true);
		    }
		//DBから学生の情報を取得する
		Login login = new Login();
		User user = new User();
		user = login.login(usermail,password);
		System.out.println("DBからの読み込み完了");
		//在籍している生徒・先生と価（ID・パスワード）が一致しているかどうかを確認する
		System.out.println("価の取得");
		System.out.println("ユーザーの名前"+user.name);
		System.out.println("ユーザのアドレス"+user.mail);
		System.out.println("ユーザーがログインできたか"+user.islogin);
		System.out.println("管理フラグ"+user.manage_flg);

			//ログイン成功、学生か生徒かの判別
			System.out.println("ログインの判定中・・・");
			if(user.manage_flg == false && user.islogin==true){
				//ログインに成功したのは生徒、ログイン情報のセッションを保存
				System.out.println("学生がログインしました");
				login_session.setAttribute("user", user);//ユーザー情報をセッションに入れる
				//生徒の取得検定一覧画面へ
				rd = req.getRequestDispatcher("src/view/jsp/st/st_exget.jsp");
				// TODO 自動生成されたメソッド・スタブ
				rd.forward(req, resp);
				}
			else if(user.manage_flg == true && user.islogin==true){
				System.out.println("教師がログインしました");
				//ログインに成功したのは教師、ログイン情報のセッションを保存し、管理者側のメニュー画面へ
				login_session.setAttribute("user", user);//ユーザー情報をセッションに入れる
				// TODO 自動生成されたメソッド・スタブ
				rd.forward(req, resp);
			}
		else{
			//ログイン失敗、前の画面に戻る
			System.out.println("ログインに失敗しました");
			req.setAttribute("login_check", false);
			rd = req.getRequestDispatcher("src/view/jsp/system/login.jsp");
			// TODO 自動生成されたメソッド・スタブ
			rd.forward(req, resp);
		}
	}
}

package jp.ac.asojuku.ems.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.datamodel.objects.Examine;
import main.datamodel.objects.PromoterInfo;
import main.model.examineinfo.ExaDisp;
import main.model.examineinfo.ExaList;

public class Admin_exaddStartAction  extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//requestオブジェクト内の文字コード設定
				req.setCharacterEncoding("UTF-8");
				RequestDispatcher rd = null;
				
				try{
							//主催情報表示
							ExaList pro = new ExaList();
							List<PromoterInfo> s = pro.list();
							//主催名と検定名を取ってくる
							Examine examine = new Examine();
							examine.promoter_id = "null";
							ExaDisp exads = new ExaDisp();
							List<Examine> r = exads.disp(examine.promoter_id);
		        			//HttpSession session = request.getSession(true);
		        			//session.setAttribute("message", r);
		        			//リクエストのパラメーターにnameをいれてjspに移動
		        			req.setAttribute("userList",r);
		        			req.setAttribute("promoter_name",s);
		        			//JSPファイルへフォワードする RequestDispatcher オブジェクト
		        			rd = req.getRequestDispatcher("src/view/jsp/admin/ex_list/admin_exadd.jsp");
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


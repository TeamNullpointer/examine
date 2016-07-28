package main.model.students;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import com.iciql.Db;

import main.datamodel.mapper.Pass;
import main.datamodel.mapper.User;
import main.datamodel.objects.ClassInfo;
import main.datamodel.objects.ManageUser;
import main.model.IciqlObjectFactory;

public class Students {

	private DateFormat DATE_FORMAT = new SimpleDateFormat("yyyy/MM/dd");

	public boolean addStudent(ManageUser mu){
		if(mu.birthday == null ||
			mu.class_id == 0||
			mu.mail == null||
			mu.name == null||
			mu.name_kana == null||
			mu.password == null){
			return false;
		}
		String reg_id = "^[0-9]{7}[@](st\\.asojuku\\.ac.jp|asojuku\\.ac\\.jp)$";
        if(!Pattern.matches(reg_id, mu.mail)){
            return false;
        }
		String reg_pass = "^[0-9a-zA-Z]{4,16}$";
		if(!Pattern.matches(reg_pass, mu.password)){
			return false;
		}
		User u  = new User();
		u.admin_flag = mu.manage_flg;
		u.class_id = mu.class_id;
		u.mail_address = mu.mail;
		Date d = new Date(0);
		u.user_birth = d.valueOf(mu.birthday);
		u.user_name = mu.name;
		u.user_name_kana = mu.name_kana;
		System.out.println(u.user_name_kana);
		u.user_pass = mu.password;
		Db db = new IciqlObjectFactory().getIciqlObject();
		try {
			db.insert(u);
		} catch (Exception e) {
			//e.printStackTrace();
			db.close();
			return false;
		}
		db.close();
		return true;
	}


	public boolean deleteUser(main.datamodel.objects.User user){
		User u = new User();
		Db db = new IciqlObjectFactory().getIciqlObject();
		List<User> r = db.from(u)
				.where(u.mail_address).is(user.mail)
				.and(u.class_id).is(user.class_id)
				.select();
		Pass p1 = new Pass();
		Pass p = db.from(p1).where(p1.mail_address).is(user.mail).select().get(0);
		try{
			db.delete(p);
			db.delete(r.get(0));
		}catch(Exception e){
			System.out.println(e.getMessage());
			db.close();
			return false;
		}
		db.close();
		return true;
	}

	public boolean modifyUser(ManageUser user, main.datamodel.objects.User based){
		if(based.mail == null||
			based.name == null||
			based.name_kana == null){
			System.out.println("ベースの値が間違っています");
			return false;
		}
		if(user.birthday == null &&
			user.class_id == 0 &&
			user.mail == null &&
			user.name == null &&
			user.name_kana == null &&
			user.password == null){
			System.out.println("変更分の値が間違っています");
			return false;
		}

		String reg_pass = "^[0-9a-zA-Z]{4,16}$";
		if(user.password != null && !Pattern.matches(reg_pass, user.password)){
			System.out.println("パスワードが正しくありません");
			return false;
		}

		main.datamodel.mapper.User c = new main.datamodel.mapper.User();
		Db db = new IciqlObjectFactory().getIciqlObject();
		List<main.datamodel.mapper.User> r = db.from(c)
				.where(c.mail_address).is(based.mail)
				.and(c.user_name).is(based.name)
				.select();
		c = r.get(0);

		if(user.class_id != 0){
			c.class_id = user.class_id;
		}

		if(user.name != null){
			c.user_name = user.name;
		}

		if(user.name_kana != null){
			c.user_name_kana = user.name_kana;
		}

		if(user.password != null){
			c.user_pass = user.password;
		}

		try{
			db.update(c);
		}catch(Exception e){
			//e.printStackTrace();
			db.close();
			System.out.println("その他エラー");
			return false;
		}
		db.close();
		return true;
	}

	public List<main.datamodel.objects.User> getUserClass(int classid){
		Db db = new IciqlObjectFactory().getIciqlObject();
		User c = new User();
		List<User> r = db.from(c)
				.where(c.class_id).is(classid)
				.select();
		List<main.datamodel.objects.User> lu = new ArrayList<main.datamodel.objects.User>();
		for(User rs : r){
			main.datamodel.objects.User u1 = new main.datamodel.objects.User();
			u1.name = rs.user_name;
			u1.name_kana = rs.user_name_kana;
			u1.class_id = rs.class_id;
			u1.mail = rs.mail_address;
			u1.manage_flg = rs.admin_flag;
			u1.birth = DATE_FORMAT.format(rs.user_birth);
			main.datamodel.mapper.Class c1 = new main.datamodel.mapper.Class();
			List<main.datamodel.mapper.Class> cl = db.from(c1)
												.where(c1.class_id).is(u1.class_id)
												.select();

			u1.class_name = cl.get(0).class_name;
			lu.add(u1);
		}
		db.close();
		return lu;
	}

	public List<ClassInfo> getClassList(){
		Db db = new IciqlObjectFactory().getIciqlObject();
		main.datamodel.mapper.Class c = new main.datamodel.mapper.Class();
		List<main.datamodel.mapper.Class> r = db.from(c)
				.select();
		if(r.isEmpty()){
			db.close();
			return new ArrayList<>();
		}
		List<ClassInfo> result = new ArrayList<>();
		for(main.datamodel.mapper.Class cl : r){
			ClassInfo ci = new ClassInfo();
			ci.class_id = cl.class_id;
			ci.class_name = cl.class_name;
			result.add(ci);
		}
		db.close();
		return result;
	}

	public User getUser(String mail){
		Db db = new IciqlObjectFactory().getIciqlObject();
		User user = new User();
		main.datamodel.mapper.User u = new main.datamodel.mapper.User();
		List<main.datamodel.mapper.User> r = db.from(u)
											   .where(u.mail_address).is(mail)
											   .select();
		if(r.isEmpty()){
			db.close();
			return new User();
		}
		user.mail_address = r.get(0).mail_address;
		user.admin_flag = r.get(0).admin_flag;
		user.class_id = r.get(0).class_id;
		user.user_birth = r.get(0).user_birth;
		user.user_name = r.get(0).user_name;
		user.user_name_kana = r.get(0).user_name_kana;
		user.user_pass = r.get(0).user_pass;
db.close();
		return user;
	}

}

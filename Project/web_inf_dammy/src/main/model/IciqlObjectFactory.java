package main.model;

import com.iciql.Db;

public class IciqlObjectFactory {
	public Db getIciqlObject(){
		return Db.open("jdbc:mysql://ja-cdbr-azure-east-a.cloudapp.net/examine", "bf09bd4d65a934", "8b95ada0");
	}
}

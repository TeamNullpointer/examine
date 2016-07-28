package main.model.examineinfo;

import java.util.ArrayList;
import java.util.List;

import com.iciql.Db;

import main.datamodel.objects.PromoterInfo;
import main.model.IciqlObjectFactory;

public class ExaList {
	public List<PromoterInfo> list(){
		Db db = new IciqlObjectFactory().getIciqlObject();
		main.datamodel.mapper.Promoter promoter = new main.datamodel.mapper.Promoter();
		List<main.datamodel.mapper.Promoter> r = db.from(promoter)
												   .select();
		List<PromoterInfo> px = new ArrayList<>();
		//取っきた値を新しいリストに空になるまで入れてreturn
		for (main.datamodel.mapper.Promoter p : r) {
			PromoterInfo seh = new PromoterInfo();
			seh.promoter_id = p.promoter_id.toString();
			seh.promoter_name = p.promoter_name;
			px.add(seh);
		}
		db.close();
		return px;

	}
}

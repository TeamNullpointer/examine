package main.model.examineinfo;

import java.util.ArrayList;
import java.util.List;

import com.iciql.Db;

import main.datamodel.objects.Examine;
import main.model.IciqlObjectFactory;;


public class ExaDisp {
	public List<Examine> disp(String promo_id ){
		Db db = new IciqlObjectFactory().getIciqlObject();
		main.datamodel.mapper.Examine examine = new main.datamodel.mapper.Examine();
		List<main.datamodel.mapper.Examine> r;
		if(promo_id == "null"){
			r = db.from(examine).select();
					//selectDistinct(examine.examine_name);//select文変更
		}else{
			r = db.from(examine)
					.where(examine.promoter_id).is(Integer.parseInt(promo_id))
					.select();
		}

		List<Examine> ex = new ArrayList<>();
		//取っきた値を新しいリストに空になるまで入れてreturn
		for (main.datamodel.mapper.Examine p : r) {
			Examine seh = new Examine();
			seh.examine_id = p.examine_id.toString();
			seh.examine_name = p.examine_name;
			seh.promoter_id = p.promoter_id.toString();
			Integer promoter_id = p.promoter_id;
			//検定DBから検定IDを取ってくる
			main.datamodel.mapper.Promoter promoter = new main.datamodel.mapper.Promoter();
			List<main.datamodel.mapper.Promoter> prl = db.from(promoter)
													   .where(promoter.promoter_id).is(promoter_id)
													   .select();
			seh.promoter_name = prl.get(0).promoter_name;
			ex.add(seh);
		}
		db.close();
		return ex;
	}
}
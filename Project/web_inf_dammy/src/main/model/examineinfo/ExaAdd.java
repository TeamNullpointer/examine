package main.model.examineinfo;

import java.sql.Date;
import java.util.List;

import com.iciql.Db;
import com.iciql.IciqlException;

import main.datamodel.objects.AddExamine;
import main.datamodel.objects.PromoterInfo;
import main.model.IciqlObjectFactory;

public class ExaAdd {
	public boolean add(AddExamine AddEx){
		//long r = false;
		boolean s = false;
		boolean i = false;
		int count = 1;
		int promoter_id = Integer.parseInt(AddEx.promoter_id);
		Db db = new IciqlObjectFactory().getIciqlObject();
		main.datamodel.mapper.Examine examine = new main.datamodel.mapper.Examine();
		ExaList exads = new ExaList();
		//主催一覧を取ってくる。
		List<PromoterInfo> r = exads.list();
		for( PromoterInfo promo: r ){

			//入力した主催名がデータベースにあるのか確認
			if(promo.promoter_name != AddEx.promoter_name){
				count++;
			}
		}
		//新規の主催名の場合主催テーブルに新しく主催を追加
		if(promoter_id == 0){
			main.datamodel.mapper.Promoter prom = new main.datamodel.mapper.Promoter();
			prom.promoter_name = AddEx.promoter_name;
			promoter_id = count++;
			try{
				i = db.insert(prom);
			}catch(IciqlException e){
				i = false;
			}
		}
		System.out.println(promoter_id);

		examine.promoter_id = promoter_id;
		examine.examine_name = AddEx.examine_name;
		try{
			//examineにデータを追加

			main.datamodel.mapper.History history = new main.datamodel.mapper.History();
			history.examine_id = (int)db.insertAndGetKey(examine);
			Date dDate = Date.valueOf(AddEx.examine_day);
			history.date = dDate;
			s = db.insert(history);
		}catch(IciqlException e) {
			System.out.println(e.getMessage());
			s = false;
		}
		//examineからexamine_idをとってくる
		/*List<main.datamodel.mapper.Examine> m = db.from(examine)
											.where(examine.promoter_id).is(Integer.parseInt(AddEx.promoter_id))
											.and(examine.examine_name).is(AddEx.examine_name)
											.select(examine.examine_id);*/

		//main.datamodel.mapper.History history = new main.datamodel.mapper.History();
				// Data型に変換

		//System.out.println(m.get(0));
		//main.datamodel.mapper.Examine ho = m.get(0);
		//int p = m.get(0).examine_id;
		//castに失敗している↓
		//String test = m.get(0).examine_id.toString();
		//if( ex.examine_id instanceof Integer ){
		//	history.examine_id = m.get(0).examine_id;
		//}

		//history.examine_id = m.get(0).examine_id;
		/*try{
			//examineにデータを追加
			s = db.insert(history);
		}catch(IciqlException e) {
			s = false;
			System.out.println(e);
		}*/
		if(promoter_id == 0){
			if(i == true){
				s = true;
			}else{
				s = false;
			}
		}
		db.close();
		return s;

	}
}

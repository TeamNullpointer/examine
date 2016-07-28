package main.model.examineinfo;

import com.iciql.Db;
import com.iciql.IciqlException;

import main.datamodel.objects.Examine;
import main.model.IciqlObjectFactory;


public class ExaUpdate {
	public boolean update(Examine UpEx ){
		boolean r = false;
		boolean s = false;
		boolean i = false;
		Db db = new IciqlObjectFactory().getIciqlObject();
		main.datamodel.mapper.Examine exa = new main.datamodel.mapper.Examine();
		exa.examine_id = Integer.parseInt(UpEx.examine_id);
		exa.promoter_id = Integer.parseInt(UpEx.promoter_id);
		exa.examine_name = UpEx.examine_name;
		main.datamodel.mapper.Promoter prm = new main.datamodel.mapper.Promoter();
		prm.promoter_id = Integer.parseInt(UpEx.promoter_id);
		prm.promoter_name = UpEx.promoter_name;
		try{
			//examineにデータを追加
			r = db.update(exa);
			//promoterにデータを追加
			s = db.update(prm);
			//両方ともアップデートできた場合にtrueを返す
			if(r == true && s == true){
				i = true;
			}else{
				i = false;
			}
			/*r = db.from(exa).set(exa.examine_name).to(UpEx.examine_name)
				    .where(exa.examine_id).is(Integer.parseInt(UpEx.examine_id))
				    .update();*/
		}catch(IciqlException e) {
			i = false;
		}
		db.close();
		return i;

	}
}


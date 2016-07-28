package main.model.examineinfo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.iciql.Db;

import main.datamodel.objects.HistoryInfo;
import main.model.IciqlObjectFactory;

public class HistoryDisp {
	static public final String DATE_PATTERN ="yyyy/MM/dd";

	public List<HistoryInfo> list(){
		Db db = new IciqlObjectFactory().getIciqlObject();
		main.datamodel.mapper.History history = new main.datamodel.mapper.History();
		List<main.datamodel.mapper.History> r = db.from(history)
												   .select();
		List<HistoryInfo> px = new ArrayList<>();
		SimpleDateFormat smd = new SimpleDateFormat(DATE_PATTERN);
		//取ってきた値を新しいリストに空になるまで入れてreturn
		for (main.datamodel.mapper.History p : r) {
			HistoryInfo seh = new HistoryInfo();
			seh.history_id = p.history_id.toString();
			seh.date = new SimpleDateFormat(DATE_PATTERN).format(p.date);
			seh.examine_id = p.examine_id.toString();
			px.add(seh);
		}
		db.close();
		return px;

	}


}

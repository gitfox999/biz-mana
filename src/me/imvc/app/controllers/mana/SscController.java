package me.imvc.app.controllers.mana;

import me.imvc.app.models.mana.SscModel;
import me.imvc.core.BaseController;

public class SscController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private SscModel sscModel;

	public SscModel getSscModel() {
		return sscModel;
	}

	public void setSscModel(SscModel sscModel) {
		this.sscModel = sscModel;
	}

	@Override
	public String index() {
		if(getSscModel().getSearchParams() != null){
			String le = ((String[])getSscModel().getSearchParams().get("and_money_le"))[0].toString();
			String ge = ((String[])getSscModel().getSearchParams().get("and_money_ge"))[0].toString();
			if(!"".equals(ge.trim())){
				double money = Double.valueOf(ge)*100;
				String[] moneyTmp = {(int)money+""};
				getSscModel().getSearchParams().put("and_money_ge", moneyTmp);
			}
			if(!"".equals(le.trim())){
				double money = Double.valueOf(le)*100;
				String[] moneyTmp = {(int)money+""};
				getSscModel().getSearchParams().put("and_money_le", moneyTmp);
			}
		}
		getSscModel().getPageData("Ssc");
		return render("/ssc/index");
	}

	@Override
	public String show() {
		getSscModel().get(getId());
		return render("/ssc/edit");

	}

	@Override
	public String editNew() {
		return render("/ssc/edit");
	}

	@Override
	public String create() {
		getSscModel().save();
		return successMsg("创建成功","ssc","closeCurrent");
	}

	@Override
	public String edit() {
		getSscModel().get(getId());
		return render("/ssc/edit");
	}

	@Override
	public String update() {
		getSscModel().update(getId());
		return successMsg("修改成功","ssc","closeCurrent");
	}

	@Override
	public String destroy() {
		return successMsg("删除成功");
	}
}

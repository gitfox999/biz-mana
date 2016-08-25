package me.imvc.app.controllers.mana;

import me.imvc.app.models.mana.MemberModel;
import me.imvc.core.BaseController;

public class MemberController extends BaseController {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private MemberModel memberModel;

	public MemberModel getMemberModel() {
		return memberModel;
	}

	public void setMemberModel(MemberModel memberModel) {
		this.memberModel = memberModel;
	}


	@Override
	public String index() {
		if(getMemberModel().getSearchParams() != null){
			String le = ((String[])getMemberModel().getSearchParams().get("and_money_le"))[0].toString();
			String ge = ((String[])getMemberModel().getSearchParams().get("and_money_ge"))[0].toString();
			if(!"".equals(ge.trim())){
				double money = Double.valueOf(ge)*100;
				String[] moneyTmp = {(int)money+""};
				getMemberModel().getSearchParams().put("and_money_ge", moneyTmp);
			}
			if(!"".equals(le.trim())){
				double money = Double.valueOf(le)*100;
				String[] moneyTmp = {(int)money+""};
				getMemberModel().getSearchParams().put("and_money_le", moneyTmp);
			}
		}
		getMemberModel().setOrderField("add_ts");
		getMemberModel().setOrderDirection("desc");
		getMemberModel().getPageData("Member");
		return render("member/index");
	}

	@Override
	public String show() {
		getMemberModel().get(getId());
		return render("/member/edit");

	}

	@Override
	public String editNew() {
		return render("/member/edit");
	}

	@Override
	public String create() {
		getMemberModel().save();
		return successMsg("创建成功","member","closeCurrent");
	}

	@Override
	public String edit() {
		getMemberModel().get(getId());
		return render("/member/edit");
	}

	@Override
	public String update() {
		getMemberModel().update(getId());
		return successMsg("修改成功","member","closeCurrent");
	}

	@Override
	public String destroy() {
		return successMsg("删除成功");
	}
}

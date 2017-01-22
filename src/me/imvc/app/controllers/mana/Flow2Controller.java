package me.imvc.app.controllers.mana;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import me.imvc.app.entities.Flow;
import me.imvc.app.models.mana.FlowModel;
import me.imvc.app.models.mana.MemberModel;
import me.imvc.core.BaseController;

public class Flow2Controller extends BaseController {
	private FlowModel flowModel;
	private MemberModel memberModel;
	public FlowModel getFlowModel() {
		return flowModel;
	}

	public MemberModel getMemberModel() {
		return memberModel;
	}

	public void setMemberModel(MemberModel memberModel) {
		this.memberModel = memberModel;
	}

	public void setFlowModel(FlowModel flowModel) {
		this.flowModel = flowModel;
	}

	@Override
	public String index(){
		// TODO Auto-generated method stub
		String id =flowModel.getMemId();
		String [] b={id};
		if(flowModel.getSearchParams()!=null){
			flowModel.getSearchParams().put("and_memId_eq", b);
		}
		if (flowModel.getSearchParams() != null) {
			String le = ((String[]) flowModel.getSearchParams().get("and_money_le"))[0].toString();
			String ge = ((String[]) flowModel.getSearchParams().get("and_money_ge"))[0].toString();
			if (!"".equals(ge.trim())) {
				double money = Double.valueOf(ge) * 100;
				String[] moneyTmp = { (int) money + "" };
				getFlowModel().getSearchParams().put("and_money_ge", moneyTmp);
			}
			if (!"".equals(le.trim())) {
				double money = Double.valueOf(le) * 100;
				String[] moneyTmp = { (int) money + "" };
				getFlowModel().getSearchParams().put("and_money_le", moneyTmp);
			}
		}
		if (getFlowModel().getOrderField() == null) {
			getFlowModel().setOrderField("ts");
			getFlowModel().setOrderDirection("desc");
		}
		String[] a = { "money" };
		flowModel.setSumField(a);
		flowModel.getPageData("Flow");
		return render("flow2/index");
	}

	@Override
	public String show() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String editNew() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String create() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String edit() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String destroy() {
		// TODO Auto-generated method stub
		return null;
	}
	public String checkMemberByName(){
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
	
			try {
				out = response.getWriter();
			} catch (Exception e) {
				// TODO: handle exception
			}
	
			if(getMemberModel().getMemberByName(flowModel.getMemName())!=null){
				out.print(1);
			}else{
				out.print(0);;
			}
			return null;
	}
	public String showgg(){
		flowModel.getPageData("Flow");
		return render("flow2/show");
	}
}

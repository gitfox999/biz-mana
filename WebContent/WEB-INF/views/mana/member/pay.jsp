<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" id="payForm" action="${webUrl}/mana/member/${id}/dopay" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input name="getFlowModel.ksszyry.id" type="hidden" value="${getFlowModel.ksszyry.id}"/>
			<div class="pageFormContent" layoutH="56">
			<p>
				<label>充值金额：</label>
				<input name="getFlowModel.flow.money" class="required" type="text" size="30" value="${getFlowModel.flow.money}"/>
			</p>
			<p>
				<label>打款卡号：</label>
				<input name="getFlowModel.flow.fromcard" class="required" type="text" size="30" value="${getFlowModel.flow.fromcard}"/>
			</p>
			<p>
				<label>卡款银行：</label>
				<input name="getFlowModel.flow.frombank" class="required" type="text" size="30" value="${getFlowModel.flow.frombank}"/>
			</p>
			<p>
				<label>入账卡号：</label>
				<input name="getFlowModel.flow.tocard" class="required" type="text" size="30" value="${getFlowModel.flow.tocard}"/>
			</p>
			<p>
				<label>入账银行：</label>
				<input name="getFlowModel.flow.tobank" class="required" type="text" size="30" value="${getFlowModel.flow.tobank}"/>
			</p>
			<p>
				<label>备注：</label>
				<input name="getFlowModel.flow.remark" type="text" size="30" value="${getFlowModel.flow.remark}"/>
			</p>
			</div>
			<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="button" onclick="doPay">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
			</div>
			</form>
</div>
<script>
function doPay(){
	alertMsg.confirm("确定要充值吗？", {
		okCall: function(){
			$("#payForm").submit();
		}
	});
}
</script>
    
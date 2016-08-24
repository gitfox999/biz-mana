<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
	<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>身份证号：</label>
				<input name="sfzh" type="text" value="${zyryModel.kssZyry.sfzh }" readonly="readonly"/>
			</p>
			<p>
				<label>姓名：</label>
				<input name="name" class="required" type="text" value="${zyryModel.kssZyry.xm }" />
			</p>
			<p>
				<label>性别：</label>
				<input name="xb" type="text" value="${zyryModel.kssZyry.xb }" readonly="readonly"/>		
			</p>
			<p>
				<label>出生日期：</label>
				<input name="csrq" type="text" value="${zyryModel.kssZyry.csrq }" readonly="readonly"/>		
			</p>
			<p>
				<label>户籍地：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.hjd }" class="textInput">
			</p>
			<p>
				<label>别名：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.bm }" class="textInput">
			</p>
			<p>
				<label>民族：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.mz }" class="textInput">
			</p>
			<p>
				<label>身高：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.sg }" class="textInput">
			</p>
			<p>
				<label>足长：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.zc }" class="textInput">
			</p>
			<p>
				<label>专长：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.tc }" class="textInput">
			</p>
			<p>
				<label>体表标记：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.tbbj }" class="textInput">
			</p>
			<p>
				<label>人员编号：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.rybh }" class="textInput">
			</p>
			<p>
				<label>教育程度：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.jycd }" class="textInput">
			</p>
			<p>
				<label>身份：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.sf }" class="textInput">
			</p>
			<p>
				<label>户籍地详址：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.hjdxz }" class="textInput">
			</p>
			<p>
				<label>居住地：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.jzd }" class="textInput">
			</p>
			<p>
				<label>居住地详址：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.jzdxz }" class="textInput">
			</p>
			<p>
				<label>入所日期：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.rsrq }" class="textInput">
			</p>
			<p>
				<label>案件类别：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.ajlb }" class="textInput">
			</p>
			<p>
				<label>入所原因：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.rsyy }" class="textInput">
			</p>
			<p>
				<label>办案单位：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.badw }" class="textInput">
			</p>
			<p>
				<label>刑期：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.xq }" class="textInput">
			</p>
			<p>
				<label>司法处理结果：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.sfcljg }" class="textInput">
			</p>
			<p>
				<label>法律文书号：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.flwsh }" class="textInput">
			</p>
			<p>
				<label>出所原因：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.csyy }" class="textInput">
			</p>
			<p>
				<label>出所日期：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.csrq }" class="textInput">
			</p>
			<p>
				<label>出所去向：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.csqx }" class="textInput">
			</p>
			<p>
				<label>简要案情：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.jyaq }" class="textInput">
			</p>
			<p>
				<label>备注：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZyry.bz }" class="textInput">
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">关闭</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>

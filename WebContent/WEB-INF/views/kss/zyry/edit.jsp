<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<form method="post" action="${webUrl}/kss/zyry/0/merge"
		class="pageForm required-validate"	onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input name="zyryModel.kssZyry.id" type="hidden" value="${zyryModel.kssZyry.id }" />
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>人员编号：</label>
				<input name="zyryModel.kssZyry.rybh" type="text" value="${zyryModel.kssZyry.rybh }" class="textInput">
			</p>
			<p>
				<label>身份证号：</label>
				<input name="zyryModel.kssZyry.sfzh" type="text" value="${zyryModel.kssZyry.sfzh }"/>
			</p>
			<p>
				<label>姓名：</label>
				<input name="zyryModel.kssZyry.xm" type="text" value="${zyryModel.kssZyry.xm }" />
			</p>
			<p>
				<label>出生日期：</label>
				<input style="float: left" type="text" name="zyryModel.kssZyry.csrq" class="date" 
				format="yyyy-MM-dd" readonly="true" value="${zyryModel.kssZyry.csrq}"/>
			</p>
			<p>
				<label>性别：</label>
				<input name="zyryModel.kssZyry.xb" type="text" value="${zyryModel.kssZyry.xb }"/>		
			</p>
			<p>
				<label>民族：</label>
				<input name="zyryModel.kssZyry.mz" type="text" value="${zyryModel.kssZyry.mz }" class="textInput">
			</p>
			<p>
				<label>别名：</label>
				<input name="zyryModel.kssZyry.bm" type="text" value="${zyryModel.kssZyry.bm }" class="textInput">
			</p>
			<p>
				<label>教育程度：</label>
				<input name="zyryModel.kssZyry.jycd" type="text" value="${zyryModel.kssZyry.jycd }" class="textInput">
			</p>
			<p>
				<label>户籍地：</label>
				<input name="zyryModel.kssZyry.hjd" type="text" value="${zyryModel.kssZyry.hjd }" class="textInput">
			</p>
			<p>
				<label>户籍地详址：</label>
				<input name="zyryModel.kssZyry.hjdxz" type="text" value="${zyryModel.kssZyry.hjdxz }" class="textInput">
			</p>
			<p>
				<label>居住地：</label>
				<input name="zyryModel.kssZyry.jzd" type="text" value="${zyryModel.kssZyry.jzd }" class="textInput">
			</p>
			<p>
				<label>居住地详址：</label>
				<input name="zyryModel.kssZyry.jzdxz" type="text" value="${zyryModel.kssZyry.jzdxz }" class="textInput">
			</p>
			<p>
				<label>身高：</label>
				<input name="zyryModel.kssZyry.sg" type="text" value="${zyryModel.kssZyry.sg }" class="textInput">
			</p>
			<p>
				<label>足长：</label>
				<input name="zyryModel.kssZyry.zc" type="text" value="${zyryModel.kssZyry.zc }" class="textInput">
			</p>
			<p>
				<label>体表标记：</label>
				<input name="zyryModel.kssZyry.tbbj" type="text" value="${zyryModel.kssZyry.tbbj }" class="textInput">
			</p>
			<p>
				<label>身份：</label>
				<input name="zyryModel.kssZyry.sf" type="text" value="${zyryModel.kssZyry.sf }" class="textInput">
			</p>
			<p>
				<label>专长：</label>
				<input name="zyryModel.kssZyry.tc" type="text" value="${zyryModel.kssZyry.tc }" class="textInput">
			</p>
			<div class="divider"></div>
			
			<p>
				<label>入所日期：</label>
				<input style="float: left" type="text" name="zyryModel.kssZyry.rsrq" class="date" 
				format="yyyy-MM-dd" readonly="true" value="${zyryModel.kssZyry.rsrq}"/>
			</p>
			<p>
				<label>入所原因：</label>
				<input name="zyryModel.kssZyry.rsyy" type="text" value="${zyryModel.kssZyry.rsyy }" class="textInput">
			</p>
			<p>
				<label>监室名称：</label>
				<input style="float: left" type="text" name="zyryModel.kssZyry.syjs" class="date" 
				format="yyyy-MM-dd" readonly="true" value="${zyryModel.kssZyry.syjs}"/>
			</p>
			<p>
				<label>诉讼环节：</label>
				<input name="zyryModel.kssZyry.sshj" type="text" value="${zyryModel.kssZyry.sshj }" class="textInput">
			</p>
			<p>
				<label>刑期：</label>
				<input name="zyryModel.kssZyry.xq" type="text" value="${zyryModel.kssZyry.xq }" class="textInput">
			</p>
			<p>
				<label>案件类别：</label>
				<input name="zyryModel.kssZyry.ajlb" type="text" value="${zyryModel.kssZyry.ajlb }" class="textInput">
			</p>
			<p>
				<label>办案单位：</label>
				<input name="zyryModel.kssZyry.badw" type="text" value="${zyryModel.kssZyry.badw }" class="textInput">
			</p>
			<p>
				<label>司法处理结果：</label>
				<input name="zyryModel.kssZyry.sfcljg" type="text" value="${zyryModel.kssZyry.sfcljg }" class="textInput">
			</p>
			<p>
				<label>法律文书号：</label>
				<input name="zyryModel.kssZyry.flwsh" type="text" value="${zyryModel.kssZyry.flwsh }" class="textInput">
			</p>
			<p>
				<label>出所日期：</label>
				<input style="float: left" type="text" name="zyryModel.kssZyry.csrq" class="date" 
				format="yyyy-MM-dd" readonly="true" value="${zyryModel.kssZyry.csrq}"/>
			</p>
			<p>
				<label>出所原因：</label>
				<input name="zyryModel.kssZyry.csyy" type="text" value="${zyryModel.kssZyry.csyy }" class="textInput">
			</p>
			<p>
				<label>出所去向：</label>
				<input name="zyryModel.kssZyry.csqx" type="text" value="${zyryModel.kssZyry.csqx }" class="textInput">
			</p>
			<p>
				<label>简要案情：</label>
				<input name="zyryModel.kssZyry.jyaq" type="text" value="${zyryModel.kssZyry.jyaq }" class="textInput">
			</p>
			<p>
				<label>备注：</label>
				<input name="zyryModel.kssZyry.bz" type="text" value="${zyryModel.kssZyry.bz }" class="textInput">
			</p>
		</div>
		<div class="formBar">
			<ul>
				<c:if test="${isShow != 1}">
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				</c:if>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
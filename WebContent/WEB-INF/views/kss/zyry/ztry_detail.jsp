<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
	<form method="post" action="demo/common/ajaxDone.html" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>人员编号：</label>
				<input name="sn" type="text" value="${zyryModel.kssZtry.rybh }" readonly="readonly"/>
			</p>
			<p>
				<label>姓名：</label>
				<input name="name" type="text" value="${zyryModel.kssZtry.xm }" readonly="readonly"/>
			</p>
			<p>
				<label>性别：</label>
				<input name="sn" type="text" value="${zyryModel.kssZtry.xbDm }" readonly="readonly"/>		
			</p>
			<p>
				<label>出生日期：</label>
				<input name="sn" type="text" value="${zyryModel.kssZtry.csrqSx }" readonly="readonly"/>		
			</p>
			<p>
				<label>身份证号：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.sfzh }" class="textInput">
			</p>
			<p>
				<label>民族：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.mzDm }" class="textInput">
			</p>
			<p>
				<label>户籍地区划：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.hjdQh }" class="textInput">
			</p>
			<p>
				<label>户籍地址：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.hjdXz }" class="textInput">
			</p>
			<p>
				<label>现住地区划：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.xzdQh }" class="textInput">
			</p>
			<p>
				<label>现住地址：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.xzdXz }" class="textInput">
			</p>
			<p>
				<label>身高：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.sg }" class="textInput">
			</p>
			<p>
				<label>案件编号：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.ajbh }" class="textInput">
			</p>
			<p>
				<label>奖金：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.jj }" class="textInput">
			</p>
			<p>
				<label>侦办联系人：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.zbLxr }" class="textInput">
			</p>
			<p>
				<label>侦办联系方式：</label>
				<input type="text" readonly="readonly" value="${zyryModel.kssZtry.zbLxfs }" class="textInput">
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

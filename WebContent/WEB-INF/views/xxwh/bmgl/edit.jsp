<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" action="${webUrl}/xxwh/bmgl" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input name="bmglModel.kssbmxx.id" type="hidden" value="${bmglModel.kssbmxx.id}"/>
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>部门名称：</label>
				<input name="bmglModel.kssbmxx.bmmc" class="required"  type="text" size="30" value="${bmglModel.kssbmxx.bmmc}"  alt="部门名称"/>
			</p>
			<p>
				<label>部门代码：</label>
				<input name="bmglModel.kssbmxx.bmdm" class="required" type="text" size="30" value="${bmglModel.kssbmxx.bmdm}" alt="部门代码"/>
			</p>
			<p>
				<label>部门说明：</label>
				<input name="bmglModel.kssbmxx.bmzy" type="text" size="30" value="${bmglModel.kssbmxx.bmzy}"/>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
    
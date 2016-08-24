<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="pageContent">
	<form method="post" action="${webUrl}/xxwh/sydw" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input name="sydwModel.ksssydw.id" type="hidden" value="${sydwModel.ksssydw.id}"/>
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>送押单位名称：</label>
				<input name="sydwModel.ksssydw.sydwmc" class="required"  type="text" size="30" value="${sydwModel.ksssydw.sydwmc}"/>
			</p>
			<p>
				<label>送押单位代码：</label>
				<input name="sydwModel.ksssydw.sydwdm" class="required" type="text" size="30" value="${sydwModel.ksssydw.sydwdm}"/>
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
    
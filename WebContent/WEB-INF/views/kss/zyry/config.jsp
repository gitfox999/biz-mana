<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<form method="post" action="${webUrl}/kss/zyry/0/config"
		class="pageForm required-validate"	onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input name="zyryModel.config.id" type="hidden" value="${zyryModel.config.id }" />
		<div layoutH="40">
		入所多久后开始比对在逃：
				<input name="zyryModel.config.value" type="text" size="2" value="${zyryModel.config.value }" >天
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
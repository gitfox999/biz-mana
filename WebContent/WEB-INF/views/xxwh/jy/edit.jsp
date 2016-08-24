<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="pageContent">
	<form method="post" action="${webUrl}/xxwh/jy" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
			<input name="jyModel.kssjyxx.id" type="hidden" value="${jyModel.kssjyxx.id}"/>
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>警员名称：</label>
				<input name="jyModel.kssjyxx.jymc" class="required"  type="text" size="30" value="${jyModel.kssjyxx.jymc}" />
			</p>
			<p>
				<label>警员警号：</label>
				<input name="jyModel.kssjyxx.jyjh" class="required"  type="text" size="30" value="${jyModel.kssjyxx.jyjh}" />
			</p>
			<p>
				<label>所属单位：</label>
				<select class="combox" name="jyModel.kssjyxx.kssSydw.id">
					<c:forEach var="jy" items="${jyModel.kssydwlist}" varStatus="name">
						<option value="${jy.id}">${jy.sydwmc}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>所属部门：</label>
				<select class="combox" name="jyModel.kssjyxx.kssBmxx.id">
					<c:forEach var="jy" items="${jyModel.kssbmlist}" varStatus="name">
						<option value="${jy.id}">${jy.bmmc}</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>警员年龄：</label>
				<input name="jyModel.kssjyxx.jynl" class="required"  type="text" size="30" value="${jyModel.kssjyxx.jynl}" />
			</p>
			<p>
				<label>警员性别：</label>
				<input name="jyModel.kssjyxx.jyxb" class="required"  type="text" size="30" value="${jyModel.kssjyxx.jyxb}" />
			</p>
			<p>
				<label>警员手机号：</label>
				<input name="jyModel.kssjyxx.jysjh" class="required"  type="text" size="30" value="${jyModel.kssjyxx.jysjh}" />
			</p>
			<p>
				<label>身份证号：</label>
				<input name="jyModel.kssjyxx.sfzh" class="required" type="text" size="30" value="${jyModel.kssjyxx.sfzh}" />
			</p>
			<p>
				<label>出生日期：</label>
				<input name="jyModel.kssjyxx.csrq" type="text" size="30" value="${jyModel.kssjyxx.csrq}"/>
			</p>
			<p>
				<label>户籍地：</label>
				<input name="jyModel.kssjyxx.hjd" type="text" size="30" value="${jyModel.kssjyxx.hjd}"/>
			</p>
			<p>
				<label>照片：</label>
				<input name="jyModel.kssjyxx.zp" type="text" size="30" value="${jyModel.kssjyxx.zp}"/>
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
    
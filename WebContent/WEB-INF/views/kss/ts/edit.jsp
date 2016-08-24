<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<form method="post" action="${webUrl}/ytdz/gg/0/merge"
		class="pageForm required-validate"	onsubmit="return validateCallback(this, dialogAjaxDone);">
		
		<input name="ggModel.sysGg.id" type="hidden" value="${ggModel.sysGg.id }" />
		<div class="pageFormContent" layoutH="56">
			<p>
				<label>广告名称：</label> 
				<input name="ggModel.sysGg.name" class="required"  type="text" size="30"
					value="${ggModel.sysGg.name}"/>
			</p>
			<p>
				<label>广告位置：</label> 
				<select name="ggModel.sysGg.wz">
					<option value="0" <c:if test="${gg.wz == 0 }">selected</c:if>>登录时</option>
					<option value="1" <c:if test="${gg.wz == 1 }">selected</c:if>>页面内</option>
				</select>
			</p>
			<p>
				<label>到期日期：</label> 
				<input style="float: left" type="text" name="ggModel.sysGg.dqsj" size="30" class="date" 
				format="yyyy-MM-dd" readonly="true" value="${ggModel.sysGg.dqsj}"/>
			</p>
			<p>
				<label>备注：</label> 
				<input name="ggModel.sysGg.remark" type="text" size="30" value="${ggModel.sysGg.remark }"/>
			</p>
			<div class="unit">
				<dl class="nowrap">
					<dt>宣传图片：</dt>
					<dd>
						<div>
							<div id="fileInput" filefield="ggModel.files"></div>
							<div id="fileQueue" class="fileQueue"></div>
							
							<input id="filePost" type="file" name="image"
								script="${webUrl}/files" fileDataName="fileData"
								onAllComplete="uploadifyAllComplete" />
						</div>
					</dd>
				</dl>
			</div>
			<c:if test="${ggModel.sysGg.img1 != null && ggModel.sysGg.img1 != '' }">
			<p>
			<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
		<img  width="90px" style="border: 1px solid #ccc" height="130px" src="${webUrl}/gg/${ggModel.sysGg.img1}.jpg"/>
		<%--  <input type="hidden" name="studentModel.students.photo" width="90px" style="border: 1px solid #ccc" height="130px" src="${webUrl}/qbzx/student/${id}/getimgSmall" /> --%>
		 </p>
		 </c:if>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
						</div>
					</div></li>
				<li><div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div></li>
			</ul>
		</div>
	</form>
</div>
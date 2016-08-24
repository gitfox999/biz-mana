<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="pageContent">
	<form method="post" action="${webUrl}/kss/zyry/0/impexcel"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone);">

		<div class="pageFormContent" layoutH="56">

			<div class="unit">
				<dl class="nowrap">
					<dt><div>
							<div id="fileInput" filefield="zyryModel.files"></div>
							<div id="fileQueue" class="fileQueue"></div>
							
							<input id="filePost" type="file" name="image"
								script="${webUrl}/files" fileDataName="fileData"
								onAllComplete="uploadifyAllComplete" />
						</div></dt>
					<dd>
						
					</dd>
				</dl>
			</div>
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
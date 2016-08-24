<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="pageContent">
    <form method="post" action="${webUrl}/ywdj/xxxg" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
        <input name="xxxgModel.kssrsdj.id" type="hidden" value="${xxxgModel.kssrsdj.id}"/>
        <div class="pageFormContent" layoutH="56">
        	<p>
        		<label>身份证号：</label>
        		<input name="xxxgModel.kssrsdj.sfzh" type="text" size="30" value="${xxxgModel.kssrsdj.sfzh}" />
        	</p>
        	<p>
        		<label>姓名：</label>
        		<input name="xxxgModel.kssrsdj.xm" type="text" size="30" value="${xxxgModel.kssrsdj.xm}" />
        	</p>
        	<p>
        		<label>性别：</label>
        		<input name="xxxgModel.kssrsdj.xb" type="text" size="30" value="${xxxgModel.kssrsdj.xb}" />
        	</p>
        	<p>
        		<label>出生日期：</label>
        		<input name="xxxgModel.kssrsdj.csrq" type="text" size="30" value="${xxxgModel.kssrsdj.csrq}" />
        	</p>
        	<p>
        		<label>户籍地：</label>
        		<input name="xxxgModel.kssrsdj.hjd" type="text" size="30" value="${xxxgModel.kssrsdj.hjd}" />
        	</p>
        	<p>
        		<label>是否在逃：</label>
        		<input name="xxxgModel.kssrsdj.sfzt" type="text" size="30" value="${xxxgModel.kssrsdj.sfzt}" />
        	</p>
        	<p>
				<label>送押单位：</label>
				<input name="xxxgModel.kssrsdj.sydw" type="text" size="30" value="${xxxgModel.kssrsdj.sydw}" />
			</p>
			<p>
				<label>送押民警：</label>
				<input name="xxxgModel.kssrsdj.symj" type="text" size="30" value="${xxxgModel.kssrsdj.symj}" />
			</p>
			<p>
				<label>送押日期：</label>
				<input name="xxxgModel.kssrsdj.syrq" type="text" size="30" value="${xxxgModel.kssrsdj.syrq}" />
			</p>
			<p>
				<label>送押说明：</label>
				<input name="xxxgModel.kssrsdj.sysm" type="text" size="30" value="${xxxgModel.kssrsdj.sysm}" />
			</p>
			<p>
				<label>收押单位：</label>
				<input name="xxxgModel.kssrsdj.sybm" type="text" size="30" value="${xxxgModel.kssrsdj.sybm}" />
			</p>
			<p>
				<label>收押人：</label>
				<input name="xxxgModel.kssrsdj.syr" type="text" size="30" value="${xxxgModel.kssrsdj.syr}" />
			</p>
			<p>
				<label>收押日期：</label>
				<input name="xxxgModel.kssrsdj.sysj" type="text" size="30" value="${xxxgModel.kssrsdj.sysj}"/>
			</p>
			<p>
				<label>收押说明：</label>
				<input name="xxxgModel.kssrsdj.sysmsfzt" type="text" size="30" value="${xxxgModel.kssrsdj.sysmsfzt}"/>
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
    
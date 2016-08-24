<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<object id="MyActiveX" name="MyActiveX" classid="clsid:7F1FE93E-F4E2-400C-B645-A1EEC67A9C4C"></object>
    <script type="text/javascript">
        function Demo() {
            try {
                var x = document.getElementById("MyActiveX");
                var v = x.GetPersonInfo(); //读取身份证其他信息

                var arrys = v.split(',');
                document.getElementById('sfzhid').value = arrys[5];
                document.getElementById('xmid').value = arrys[0];
                document.getElementById('xbid').value = arrys[1];
                document.getElementById('csrqid').value = arrys[3];
                document.getElementById('hjdid').value = arrys[4];
		
            }
            catch (e) {
            }
        }
		function Demo1(){
			alert("该人员为在逃人员。")
		}
    
    </script>
<div class="pageContent">
    <form method="post" action="${webUrl}/ywdj/rsdj" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
        <input id="Button1" type="button" value="获取身份证信息" onclick=Demo(); />
        <input id="Button2" type="button" value="检查是否在逃" onclick=Demo1(); />
        <div class="pageFormContent" layoutH="56">
        	<p>
        		<label>身份证号：</label>
        		<input name="rsdjModel.kssrsdj.sfzh" id="sfzhid" readonly="readonly"  type="text" size="30" value="${rsdjModel.kssrsdj.sfzh}" />
        	</p>
        	<p>
        		<label>姓名：</label>
        		<input name="rsdjModel.kssrsdj.xm" id="xmid" readonly="readonly" type="text" size="30" value="${rsdjModel.kssrsdj.xm}" />
        	</p>
        	<p>
        		<label>性别：</label>
        		<input name="rsdjModel.kssrsdj.xb" id="xbid" readonly="readonly" type="text" size="30" value="${rsdjModel.kssrsdj.xb}" />
        	</p>
        	<p>
        		<label>出生日期：</label>
        		<input name="rsdjModel.kssrsdj.csrq" id="csrqid" readonly="readonly" type="text" size="30" value="${rsdjModel.kssrsdj.csrq}" />
        	</p>
        	<p>
        		<label>户籍地：</label>
        		<input name="rsdjModel.kssrsdj.hjd" id="hjdid" readonly="readonly" type="text" size="30" value="${rsdjModel.kssrsdj.hjd}" />
        	</p>
        	<p>
        		<label>是否在逃：</label>
        		<input name="rsdjModel.kssrsdj.sfzt" id="sfztid" readonly="readonly" type="text" size="30" value="${rsdjModel.kssrsdj.sfzt}" />
        	</p>
        	<div class="divider"></div>
        	<p>
				<label>送押单位：</label>
				<input name="rsdjModel.kssrsdj.sydw" class="required"  type="text" size="30" value="${rsdjModel.kssrsdj.sydw}" />
			</p>
			<p>
				<label>送押民警：</label>
				<input name="rsdjModel.kssrsdj.symj" class="required"  type="text" size="30" value="${rsdjModel.kssrsdj.symj}" />
			</p>
			<p>
				<label>送押日期：</label>
				<input name="rsdjModel.kssrsdj.syrq" class="required"  type="text" size="30" value="${rsdjModel.kssrsdj.syrq}" />
			</p>
			<p>
				<label>送押说明：</label>
				<input name="rsdjModel.kssrsdj.sysm" class="required"  type="text" size="30" value="${rsdjModel.kssrsdj.sysm}" />
			</p>
			<p>
				<label>收押单位：</label>
				<input name="rsdjModel.kssrsdj.sybm" class="required"  type="text" size="30" value="${rsdjModel.kssrsdj.sybm}" />
			</p>
			<p>
				<label>收押人：</label>
				<input name="rsdjModel.kssrsdj.syr" class="required" type="text" size="30" value="${rsdjModel.kssrsdj.syr}" />
			</p>
			<p>
				<label>收押日期：</label>
				<input name="rsdjModel.kssrsdj.sysj" type="text" size="30" value="${rsdjModel.kssrsdj.sysj}"/>
			</p>
			<p>
				<label>收押说明及是否在逃：</label>
				<input name="rsdjModel.kssrsdj.sysmsfzt" type="text" size="30" value="${rsdjModel.kssrsdj.sysmsfzt}"/>
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
    
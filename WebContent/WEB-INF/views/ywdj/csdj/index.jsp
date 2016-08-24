<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="csdjModel.pageNum" numPerPage="csdjModel.numPerPage" 
orderField="csdjModel.orderField" orderDirection="csdjModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="csdjModel.pageNum" value="${csdjModel.pageNum}" />
	<input type="hidden" name="csdjModel.numPerPage" value="${csdjModel.numPerPage}" />
	<input type="hidden" name="csdjModel.orderField" value="${csdjModel.orderField}" />
	<input type="hidden" name="csdjModel.orderDirection" value="${csdjModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/ywdj/csdj!index1" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>身份证号：</label>
				<input type="text" name="csdjModel.searchParams.sfzh_eq_string" value="${csdjModel.searchParams.sfzh_eq_string[0]}"/>
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			<!-- 	<li><a class="button fullTextSearch"><span>模糊搜索</span></a></li> -->
			</ul>
		</div>
	</div>
	</form>
	
</div>

<div class="pageContent" style="overflow:auto; width:100%;height:100px">
	<table class="table" width="1200" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="csdjModel.ids" class="checkboxCtrl"></th>
				<th width="120" orderField="sfzh"   class="asc">身份证号</th>
				<th width="80" orderField="xm"   class="asc">姓名</th>
				<th width="60" orderField="xb"   class="asc">性别</th>
				<th width="120" orderField="csrq"   class="asc">出生日期</th>
				<th width="120" orderField="hjd"   class="asc">户籍地</th>
				<th width="80" orderField="bm"   class="asc">别名</th>
				<th width="50" orderField="mz"   class="asc">民族</th>
				<th width="80" orderField="sg"   class="asc">身高</th>
				<th width="80" orderField="zc"   class="asc">足长</th>
				<th width="80" orderField="tc"   class="asc">专长</th>
				<th width="120" orderField="tbbj"   class="asc">体表标记</th>
				<th width="80" orderField="rybh"   class="asc">人员编号</th>
				<th width="80" orderField="jycd"   class="asc">教育程度</th>
				<th width="80" orderField="sf"   class="asc">身份</th>
				<th width="120" orderField="hjdxz"   class="asc">户籍地详址</th>
				<th width="120" orderField="jzd"   class="asc">居住地</th>
				<th width="120" orderField="jzdxz"   class="asc">居住地详址</th>
				<th width="80" orderField="rsrq"   class="asc">入所日期</th>
				<th width="80" orderField="ajlb"   class="asc">案件类别</th>
				<th width="120" orderField="rsyy"   class="asc">入所原因</th>
				<th width="80" orderField="badw"   class="asc">办案单位</th>
				<th width="80" orderField="xq"   class="asc">刑期</th>
				<th width="120" orderField="sfcljg"   class="asc">司法处理结果</th>
				<th width="80" orderField="flwsh"   class="asc">法律文书号</th>
				<th width="120" orderField="csyy"   class="asc">出所原因</th>
				<th width="80" orderField="cssj"   class="asc">出所日期</th>
				<th width="120" orderField="csqx"   class="asc">出所去向</th>
				<th width="120" orderField="jyaq"   class="asc">简要案情</th>
				<th width="120" orderField="bz"   class="asc">备注</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${csdjModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td><input name="csdjModel.ids" value="${bm.id}" type="checkbox"></td>
				<td>${bm.sfzh}</td>			   
				<td>${bm.xm}</td>			   
				<td>${bm.xb}</td>			   
				<td>${bm.csrq}</td>
				<td>${bm.hjd}</td>
				<td>${bm.bm}</td>
				<td>${bm.mz}</td>
				<td>${bm.sg}</td>
				<td>${bm.zc}</td>
				<td>${bm.tc}</td>
				<td>${bm.tbbj}</td>
				<td>${bm.rybh}</td>
				<td>${bm.jycd}</td>
				<td>${bm.sf}</td>
				<td>${bm.hjdxz}</td>
				<td>${bm.jzd}</td>
				<td>${bm.jzdxz}</td>
				<td>${bm.rsrq}</td>
				<td>${bm.ajlb}</td>
				<td>${bm.rsyy}</td>
				<td>${bm.badw}</td>
				<td>${bm.xq}</td>
				<td>${bm.sfcljg}</td>
				<td>${bm.flwsh}</td>
				<td>${bm.csyy}</td>
				<td>${bm.cssj}</td>
				<td>${bm.csqx}</td>
				<td>${bm.jyaq}</td>
				<td>${bm.bz}</td>
				<td>
					<a title="出所" target="dialog" width="800" height="480" href="${webUrl}/ywdj/csdj/${bm.id}/edit" rel="roles_edit" class="btnEdit">出所</a>
				</td>
			</tr>
			</c:forEach>		
		</tbody>
	</table>
	<form method="post" action="${webUrl}/ywdj/csdj/${bm.id}/edit" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">出所</button></div></div></li>
			</ul>
		</div>
	</form>
</div>
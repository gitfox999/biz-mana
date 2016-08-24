<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="xxxgModel.pageNum" numPerPage="xxxgModel.numPerPage" 
orderField="xxxgModel.orderField" orderDirection="xxxgModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="xxxgModel.pageNum" value="${xxxgModel.pageNum}" />
	<input type="hidden" name="xxxgModel.numPerPage" value="${xxxgModel.numPerPage}" />
	<input type="hidden" name="xxxgModel.orderField" value="${xxxgModel.orderField}" />
	<input type="hidden" name="xxxgModel.orderDirection" value="${xxxgModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/ywdj/xxxg!index" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>身份证号：</label>
				<input type="text" name="xxxgModel.searchParams。sfzh_eq_string" value="${xxxgModel.searchParams.sfzh_eq_string[0]}"/>
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
	
<form class="fullTextSearchForm" style="display: none;" rel="pagerForm_hidden" onsubmit="return navTabSearch(this);" action="${webUrl}/ywdj/xxxg/0/search" method="POST">
	<div class="searchBar" style="text-align: center;">
	<ul class="searchContent">
	搜索内容：<input type="text" size="30" name="xxxgModel.search" value="${xxxgModel.search}"/>
	</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				<li><a class="button advancedSearch"><span>高级检索</span></a></li>
			</ul>
		</div>
	</div>
	</form>	
</div>

<div class="pageContent">
	<table class="table" width="1200" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="xxxgModel.ids" class="checkboxCtrl"></th>
				<th width="120" orderField="sfzh"   class="asc">身份证号</th>
				<th width="60" orderField="xm"   class="asc">姓名</th>
				<th width="40" orderField="xb"   class="asc">性别</th>
				<th width="60" orderField="csrq"   class="asc">出生日期</th>
				<th width="120" orderField="hjd"   class="asc">户籍地</th>
				<th width="60" orderField="sfzt"   class="asc">是否在逃</th>
				<th width="80" orderField="sydw"   class="asc">送押单位</th>
				<th width="60" orderField="symj"   class="asc">送押民警</th>
				<th width="80" orderField="syrq"   class="asc">送押日期</th>
				<th width="120" orderField="sysm"   class="asc">送押说明</th>
				<th width="80" orderField="sybm"   class="asc">收押单位</th>
				<th width="60" orderField="syr"   class="asc">收押人</th>
				<th width="80" orderField="sysj"   class="asc">收押日期</th>
				<th width="120" orderField="sysmsfzt"   class="asc">收押说明</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${xxxgModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td><input name="xxxgModel.ids" value="${bm.id}" type="checkbox"></td>
				<td>${bm.sfzh}</td>
				<td>${bm.xm}</td>
				<td>${bm.xb}</td>
				<td>${bm.csrq}</td>
				<td>${bm.hjd}</td>
				<td>${bm.sfzt}</td>
				<td>${bm.sydw}</td>			   
				<td>${bm.symj}</td>
				<td>${bm.syrq}</td>
				<td>${bm.sysm}</td>
				<td>${bm.sybm}</td>
				<td>${bm.syr}</td>
				<td>${bm.sysj}</td>
				<td>${bm.sysmsfzt}</td>
				<td>
					<a title="编辑" target="dialog" width="800" height="480" href="${webUrl}/ywdj/xxxg/${bm.id}/edit" rel="roles_edit" class="btnEdit">编辑</a>
				</td>
			</tr>
				<c:set var="num" value="${num+1 }" scope="page"></c:set>
			</c:forEach>
			<c:if test="${num==1 }">
				<tr>
					<td align="center" colspan="20"><font color="red" size="30">未找到符合条件的信息！</font>
					</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="${xxxgModel.numPerPage}">${xxxgModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${xxxgModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${xxxgModel.totalCount}" numPerPage="${xxxgModel.numPerPage}" pageNumShown="10" currentPage="${xxxgModel.pageNum}"></div>

	</div>
</div>
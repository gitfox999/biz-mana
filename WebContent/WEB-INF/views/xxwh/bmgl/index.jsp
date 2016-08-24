<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="bmglModel.pageNum" numPerPage="bmglModel.numPerPage" 
orderField="bmglModel.orderField" orderDirection="bmglModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="bmglModel.pageNum" value="${bmglModel.pageNum}" />
	<input type="hidden" name="bmglModel.numPerPage" value="${bmglModel.numPerPage}" />
	<input type="hidden" name="bmglModel.orderField" value="${bmglModel.orderField}" />
	<input type="hidden" name="bmglModel.orderDirection" value="${bmglModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/xxwh/bmgl!index" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>部门名称：</label>
				<input type="text" name="bmglModel.searchParams.bmmc_eq_string" value="${bmglModel.searchParams.bmmc_eq_string[0]}"/>
			</li>
			<li>
				<label>部门代码：</label>
				<input type="text" name="bmglModel.searchParams.and_bmdm_eq_string" value="${bmglModel.searchParams.and_bmdm_eq_string[0]}"/>
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
	
<form class="fullTextSearchForm" style="display: none;" rel="pagerForm_hidden" onsubmit="return navTabSearch(this);" action="${webUrl}/xxwh/bmgl/0/search" method="POST">
	<div class="searchBar" style="text-align: center;">
	<ul class="searchContent">
	搜索内容：<input type="text" size="30" name="bmglModel.search" value="${bmglModel.search}"/>
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
				<th width="22"><input type="checkbox" group="bmglModel.ids" class="checkboxCtrl"></th>
				<th width="120" orderField="bmmc"   class="asc">部门名称</th>
				<th width="120" orderField="bmdm"   class="asc">部门代码</th>
				<th width="120" orderField="bmzy"   class="asc">部门说明</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${bmglModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td><input name="bmglModel.ids" value="${bm.id}" type="checkbox"></td>
				<td>${bm.bmmc}</td>			   
				<td>${bm.bmdm}</td>			   
				<td>${bm.bmzy}</td>			   
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/xxwh/bmgl/${bm.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑" target="dialog" width="800" height="480" href="${webUrl}/xxwh/bmgl/${bm.id}/edit" rel="roles_edit" class="btnEdit">编辑</a>
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
				<option value="${bmglModel.numPerPage}">${bmglModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${bmglModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${bmglModel.totalCount}" numPerPage="${bmglModel.numPerPage}" pageNumShown="10" currentPage="${bmglModel.pageNum}"></div>

	</div>
</div>
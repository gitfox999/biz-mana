<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="sydwModel.pageNum" numPerPage="sydwModel.numPerPage" 
orderField="sydwModel.orderField" orderDirection="sydwModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="sydwModel.pageNum" value="${sydwModel.pageNum}" />
	<input type="hidden" name="sydwModel.numPerPage" value="${sydwModel.numPerPage}" />
	<input type="hidden" name="sydwModel.orderField" value="${sydwModel.orderField}" />
	<input type="hidden" name="sydwModel.orderDirection" value="${sydwModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/xxwh/sydw!index" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>送押单位名称：</label>
				<input type="text" name="sydwModel.searchParams.sydwmc_eq_string" value="${sydwModel.searchParams.sydwmc_eq_string[0]}"/>
			</li>
			<li>
				<label>送押单位代码：</label>
				<input type="text" name="sydwModel.searchParams.and_sydwdm_eq_string" value="${sydwModel.searchParams.and_sydwdm_eq_string[0]}"/>
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
	搜索内容：<input type="text" size="30" name="sydwModel.search" value="${sydwModel.search}"/>
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
				<th width="22"><input type="checkbox" group="sydwModel.ids" class="checkboxCtrl"></th>
				<th width="120" orderField="sydwmc"   class="asc">送押单位名称</th>
				<th width="120" orderField="sydwdm"   class="asc">送押单位代码</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${sydwModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td><input name="sydwModel.ids" value="${bm.id}" type="checkbox"></td>
				<td>${bm.sydwmc}</td>			   
				<td>${bm.sydwdm}</td>			   
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/xxwh/sydw/${bm.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑" target="dialog" width="800" height="480" href="${webUrl}/xxwh/sydw/${bm.id}/edit" rel="roles_edit" class="btnEdit">编辑</a>
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
				<option value="${sydwModel.numPerPage}">${sydwModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${sydwModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${sydwModel.totalCount}" numPerPage="${sydwModel.numPerPage}" pageNumShown="10" currentPage="${sydwModel.pageNum}"></div>

	</div>
</div>
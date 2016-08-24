<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="jyModel.pageNum" numPerPage="jyModel.numPerPage" 
orderField="jyModel.orderField" orderDirection="jyModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="jyModel.pageNum" value="${jyModel.pageNum}" />
	<input type="hidden" name="jyModel.numPerPage" value="${jyModel.numPerPage}" />
	<input type="hidden" name="jyModel.orderField" value="${jyModel.orderField}" />
	<input type="hidden" name="jyModel.orderDirection" value="${jyModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/xxwh/jy!index" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li>
				<label>警员名称：</label>
				<input type="text" name="jyModel.searchParams.jymc_eq_string" value="${jyModel.searchParams.jymc_eq_string[0]}"/>
			</li>
			<li>
				<label>警员警号：</label>
				<input type="text" name="jyModel.searchParams.and_jyjh_eq_string" value="${jyModel.searchParams.and_jyjh_eq_string[0]}"/>
			</li>
			<li>
				<label>身份证号：</label>
				<input type="text" name="jyModel.searchParams.and_sfzh_eq_string" value="${jyModel.searchParams.and_sfzh_eq_string[0]}"/>
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
	
<form class="fullTextSearchForm" style="display: none;" rel="pagerForm_hidden" onsubmit="return navTabSearch(this);" action="${webUrl}/xxwh/jy/0/search" method="POST">
	<div class="searchBar" style="text-align: center;">
	<ul class="searchContent">
	搜索内容：<input type="text" size="30" name="jyModel.search" value="${jyModel.search}"/>
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
				<th width="22"><input type="checkbox" group="jyModel.ids" class="checkboxCtrl"></th>
				<th width="120" orderField="jymc"   class="asc">警员名称</th>
				<th width="120" orderField="jyjh"   class="asc">警员警号</th>
				<th width="120" orderField="kssSydw。sydwmc"   class="asc">所属单位</th>
				<th width="120" orderField="kssBmxx。bmmc"   class="asc">所属部门</th>
				<th width="120" orderField="jynl"   class="asc">警员年龄</th>
				<th width="120" orderField="jyxb"   class="asc">警员性别</th>
				<th width="120" orderField="jysjh"   class="asc">警员手机号</th>
				<th width="120" orderField="sfzh"   class="asc">警员身份证号</th>
				<th width="120" orderField="csrq"   class="asc">警员出生日期</th>
				<th width="120" orderField="hjd"   class="asc">警员户籍地</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${jyModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td><input name="jyModel.ids" value="${bm.id}" type="checkbox"></td>
				<td>${bm.jymc}</td>			   
				<td>${bm.jyjh}</td>
				<td>${bm.kssSydw。sydwmc}</td>
				<td>${bm.kssBmxx。bmmc}</td>
				<td>${bm.jynl}</td>
				<td>${bm.jyxb}</td>
				<td>${bm.jysjh}</td>
				<td>${bm.sfzh}</td>
				<td>${bm.csrq}</td>
				<td>${bm.hjd}</td>			   
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/xxwh/jy/${bm.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑" target="dialog" width="800" height="480" href="${webUrl}/xxwh/jy/${bm.id}/edit" rel="roles_edit" class="btnEdit">编辑</a>
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
				<option value="${jyModel.numPerPage}">${jyModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${jyModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${jyModel.totalCount}" numPerPage="${jyModel.numPerPage}" pageNumShown="10" currentPage="${jyModel.pageNum}"></div>

	</div>
</div>
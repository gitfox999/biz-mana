<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="pagerForm" pageNum="zyryModel.pageNum" numPerPage="zyryModel.numPerPage" 
orderField="zyryModel.orderField" orderDirection="zyryModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="zyryModel.pageNum" value="${zyryModel.pageNum}" />
	<input type="hidden" name="zyryModel.numPerPage" value="${zyryModel.numPerPage}" />
	<input type="hidden" name="zyryModel.orderField" value="${zyryModel.orderField}" />
	<input type="hidden" name="zyryModel.orderDirection" value="${zyryModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/kss/zyry!index" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li><label>身份证号：</label>
				<input type="text" name="zyryModel.searchParams.and_sfzh_eq_string" 
					value="${zyryModel.searchParams.and_sfzh_eq_string[0]}"/>
			</li>
			<li><label>姓名：</label>
				<input type="text" name="zyryModel.searchParams.and_xm_eq_string" 
					value="${zyryModel.searchParams.and_xm_eq_string[0]}"/>
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
				<!-- <li><a class="button fullTextSearch"><span>模糊搜索</span></a></li> -->
			</ul>
		</div>
	</div>
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${webUrl}/kss/zyry/new" target="dialog" width="850" height="480" rel="gg_new"><span>增加在押人员信息</span></a></li>
			<li><a class="edit" href="${webUrl}/kss/zyry/0/toimp" target="dialog" width="850" height="480" rel="gg_imp"><span>在押人员导入</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="zyryModel.ids" href="${webUrl}/ytdz/gg/0?_method=delete" class="delete"><span>批量删除</span></a></li>
		</ul>
	</div>
	<table class="table"  width="1000" layoutH="138">
		<thead>
			<tr>
				<th width="22"><input type="checkbox" group="zyryModel.ids" class="checkboxCtrl"></th>
				<th width="40">姓名</th>
				<th width="20">性别</th>
				<th width="40">监室名称</th>
				<th width="40">入所时间</th>
				<th width="50">身份证号</th>
				<th width="70">案件类别</th>
				<th width="70">办案单位</th>
				<th width="70">诉讼环节</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="kssZyry" items="${zyryModel.dataList}" varStatus="name">
			<tr target="gg_id" rel="${gg.id}">
				<td><input name="zyryModel.ids" value="${kssZyry.id}" type="checkbox"></td>
				<td>${kssZyry.xm}</td>
			    <td>${kssZyry.xb}</td>
				<td>${kssZyry.syjs}</td>
				<td>${kssZyry.rsrq}</td>
				<td>${kssZyry.sfzh}</td>
				<td>${kssZyry.ajlb}</td>
				<td>${kssZyry.badw}</td>
				<td>${kssZyry.sshj}</td>
				<td>
					<a title="删除" target="ajaxTodo" href="${webUrl}/kss/zyry/${kssZyry.id}?_method=DELETE" class="btnDel">删除</a>
					<a title="编辑"  target="dialog" width="850" height="480" href="${webUrl}/kss/zyry/${kssZyry.id}/edit" rel="gg_edit" class="btnEdit">编辑</a>
					<a title="详情"  target="dialog" width="850" height="480" href="${webUrl}/kss/zyry/${kssZyry.id}/edit?isShow=1" rel="gg_edit" class="btnView">详情</a>
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
				<option value="${zyryModel.numPerPage}">${zyryModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${zyryModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${zyryModel.totalCount}" numPerPage="${zyryModel.numPerPage}" pageNumShown="10" currentPage="${zyryModel.pageNum}"></div>

	</div>
</div>
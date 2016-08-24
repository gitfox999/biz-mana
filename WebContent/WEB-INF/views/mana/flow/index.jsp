<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="flowModel.pageNum" numPerPage="flowModel.numPerPage" 
orderField="flowModel.orderField" orderDirection="flowModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="flowModel.pageNum" value="${flowModel.pageNum}" />
	<input type="hidden" name="flowModel.numPerPage" value="${flowModel.numPerPage}" />
	<input type="hidden" name="flowModel.orderField" value="${flowModel.orderField}" />
	<input type="hidden" name="flowModel.orderDirection" value="${flowModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/mana/member!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent" style="height: 80px">
			<li>
				<label>用户名：</label>
				<input type="text" name="flowModel.searchParams.name_like" value="${flowModel.searchParams.name_like[0]}"/>
			</li>
			<li>
				<label>实名：</label>
				<input type="text" name="flowModel.searchParams.and_trueName_like" value="${flowModel.searchParams.and_trueName_like[0]}"/>
			</li>
			<li>
				<label>电话：</label>
				<input type="text" name="flowModel.searchParams.and_tel_like" value="${flowModel.searchParams.and_tel_like[0]}"/>
			</li>
			<li>
				<label>卡号：</label>
				<input type="text" name="flowModel.searchParams.and_card_like" value="${flowModel.searchParams.and_card_like[0]}"/>
			</li>
			<li style="width: 500px;">
				<label>注册时间：</label>
				<input name="flowModel.searchParams.and_addTs_ge_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${flowModel.searchParams._and_addTs_ge_date[0] }" placeholder="开始时间"/>
				<input name="flowModel.searchParams.and_addTs_le_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${flowModel.searchParams._and_addTs_le_date[0] }" placeholder="结束时间"/>
			</li>
			<li style="width: 500px;">
				<label>余额：</label>
				<input name="flowModel.searchParams.and_money_ge" type="text" value="<c:if test="${flowModel.searchParams.and_money_ge[0] != null && flowModel.searchParams.and_money_ge[0] != ''}">${flowModel.searchParams.and_money_ge[0]/100 }</c:if>" placeholder="大于"/>
				<input name="flowModel.searchParams.and_money_le" type="text" value="<c:if test="${flowModel.searchParams.and_money_le[0] != null && flowModel.searchParams.and_money_le[0] != ''}">${flowModel.searchParams.and_money_le[0]/100 }</c:if>" placeholder="小于"/>
			</li>
		</ul>
<%-- ===================修改搜索条件===================== --%>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			<!-- 	<li><a class="button fullTextSearch"><span>模糊搜索</span></a></li> -->
			</ul>
		</div>
	</div>
	</form>
	
<form class="fullTextSearchForm" style="display: none;" rel="pagerForm_hidden" onsubmit="return navTabSearch(this);" action="${webUrl}/notices!search" method="POST">
<%-- 	<div class="searchBar" style="text-align: center;">
	<ul class="searchContent">
	搜索内容：<input type="text" size="30" name="flowModel.search" value="${flowModel.search}"/>
	<input type="hidden"  name="flowModel.searchField" value="title,description,author,content,files"/>
	</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">搜索</button></div></div></li>
				<li><a class="button advancedSearch"><span>高级检索</span></a></li>
			</ul>
		</div>
	</div> --%>
	</form>	
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="${webUrl}/notices/new" target="dialog" width="860" height="460" rel="notices_new"><span>添加公告</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="flowModel.ids" href="${webUrl}/notices/0?_method=delete" class="delete"><span>批量删除</span></a></li>
			<li><a class="edit" href="${webUrl}/notices/{data_id}/edit" rel="notices_edit"  target="dialog" width="800" height="480" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
		<%-- 	<li><a class="icon" href="${webUrl}/notices.xls" target="dwzExport" targetType="navTab" title="是要导出这些记录吗?"><span>导出EXCEL</span></a></li> --%>
		</ul>
	</div>
<%-- ===================修改table显示内容===================== --%>
	<table class="table" layoutH="190">
		<thead>
			<tr>
				<th width="100">会员名称</th> 
				<th width="40">流水类别</th>
				<th width="160">时间</th>
				<th width="50">金额</th>
				<th width="70">流水方向</th>
				<th width="300">备注</th>
				<th width="60">转出卡号</th>
				<th width="60">转出银行</th>
				<th width="60">转入卡号</th>
				<th width="60">转入银行</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${flowModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td>${bm.member.name}</td>			 
				<td><c:if test="${bm.type == 0}">充值</c:if>
				<c:if test="${bm.type == 1}">提现</c:if>
				<c:if test="${bm.type == 2}">下注</c:if>
				<c:if test="${bm.type == 3}">赢返</c:if></td>	
				<td><fmt:formatDate value="${bm.ts }" pattern="yyyy-MM-dd HH:mm:ss"/></td>			   
				<td><fmt:formatNumber value="${bm.money/100}" pattern="0.00"/></td>
				<td><c:if test="${bm.dirction == 0}">收</c:if>
				<c:if test="${bm.dirction == 1}">支</c:if></td>
				<td>${bm.remark}</td>
				<td>${bm.tocard}</td>
				<td>${bm.tobank}</td>
				<td>${bm.fromcard}</td>
				<td>${bm.frombank}</td>
				<td>
					<a title="出所" target="dialog" width="800" height="480" href="${webUrl}/ywdj/csdj/${bm.id}/edit" rel="roles_edit" class="btnEdit">出所</a>
				</td>
			</tr>
			</c:forEach>		
		</tbody>
	</table>
<%-- ===================修改table显示内容===================== --%>
	<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="${flowModel.numPerPage}">${flowModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${flowModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${flowModel.totalCount}" numPerPage="${flowModel.numPerPage}" pageNumShown="10" currentPage="${flowModel.pageNum}"></div>

	</div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="orderModel.pageNum" numPerPage="orderModel.numPerPage" 
orderField="orderModel.orderField" orderDirection="orderModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="orderModel.pageNum" value="${orderModel.pageNum}" />
	<input type="hidden" name="orderModel.numPerPage" value="${orderModel.numPerPage}" />
	<input type="hidden" name="orderModel.orderField" value="${orderModel.orderField}" />
	<input type="hidden" name="orderModel.orderDirection" value="${orderModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/mana/member!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent" style="height: 80px">
			<li>
				<label>用户名：</label>
				<input type="text" name="orderModel.searchParams.name_like" value="${orderModel.searchParams.name_like[0]}"/>
			</li>
			<li>
				<label>实名：</label>
				<input type="text" name="orderModel.searchParams.and_trueName_like" value="${orderModel.searchParams.and_trueName_like[0]}"/>
			</li>
			<li>
				<label>电话：</label>
				<input type="text" name="orderModel.searchParams.and_tel_like" value="${orderModel.searchParams.and_tel_like[0]}"/>
			</li>
			<li>
				<label>卡号：</label>
				<input type="text" name="orderModel.searchParams.and_card_like" value="${orderModel.searchParams.and_card_like[0]}"/>
			</li>
			<li style="width: 500px;">
				<label>注册时间：</label>
				<input name="orderModel.searchParams.and_addTs_ge_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${orderModel.searchParams._and_addTs_ge_date[0] }" placeholder="开始时间"/>
				<input name="orderModel.searchParams.and_addTs_le_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${orderModel.searchParams._and_addTs_le_date[0] }" placeholder="结束时间"/>
			</li>
			<li style="width: 500px;">
				<label>余额：</label>
				<input name="orderModel.searchParams.and_money_ge" type="text" value="<c:if test="${orderModel.searchParams.and_money_ge[0] != null && orderModel.searchParams.and_money_ge[0] != ''}">${orderModel.searchParams.and_money_ge[0]/100 }</c:if>" placeholder="大于"/>
				<input name="orderModel.searchParams.and_money_le" type="text" value="<c:if test="${orderModel.searchParams.and_money_le[0] != null && orderModel.searchParams.and_money_le[0] != ''}">${orderModel.searchParams.and_money_le[0]/100 }</c:if>" placeholder="小于"/>
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
	搜索内容：<input type="text" size="30" name="orderModel.search" value="${orderModel.search}"/>
	<input type="hidden"  name="orderModel.searchField" value="title,description,author,content,files"/>
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
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="orderModel.ids" href="${webUrl}/notices/0?_method=delete" class="delete"><span>批量删除</span></a></li>
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
				<th width="100">下注详情</th>
				<th width="160">下注时间</th>
				<th width="100">下注金额</th>
				<th width="100">下注期数</th>
				<th width="60">输赢情况</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${orderModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td>${bm.member.name}</td>			 
				<td>${bm.detail}</td>	
				<td><fmt:formatDate value="${bm.otime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>			   
				<td><fmt:formatNumber value="${bm.money/100}" pattern="0.00"/></td>
				<td>${bm.qihao}</td>
				<td><c:if test="${bm.iswin == -1}">未开奖</c:if>
				<c:if test="${bm.iswin == 0}">输</c:if>
				<c:if test="${bm.iswin == 1}">赢</c:if>
				<c:if test="${bm.iswin == 2}">作废</c:if></td>
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
				<option value="${orderModel.numPerPage}">${orderModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${orderModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${orderModel.totalCount}" numPerPage="${orderModel.numPerPage}" pageNumShown="10" currentPage="${orderModel.pageNum}"></div>

	</div>
</div>
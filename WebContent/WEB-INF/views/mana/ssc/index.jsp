<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form id="pagerForm" pageNum="sscModel.pageNum" numPerPage="sscModel.numPerPage" 
orderField="sscModel.orderField" orderDirection="sscModel.orderDirection" method="GET" action="#rel#">
    <input type="hidden" name="sscModel.pageNum" value="${sscModel.pageNum}" />
	<input type="hidden" name="sscModel.numPerPage" value="${sscModel.numPerPage}" />
	<input type="hidden" name="sscModel.orderField" value="${sscModel.orderField}" />
	<input type="hidden" name="sscModel.orderDirection" value="${sscModel.orderDirection}" />
</form>
<div class="pageHeader">
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/mana/member!index" method="POST">
	<div class="searchBar">
<%-- ===================修改搜索条件===================== --%>
		<ul class="searchContent" style="height: 80px">
			<li>
				<label>用户名：</label>
				<input type="text" name="sscModel.searchParams.name_like" value="${sscModel.searchParams.name_like[0]}"/>
			</li>
			<li>
				<label>实名：</label>
				<input type="text" name="sscModel.searchParams.and_trueName_like" value="${sscModel.searchParams.and_trueName_like[0]}"/>
			</li>
			<li>
				<label>电话：</label>
				<input type="text" name="sscModel.searchParams.and_tel_like" value="${sscModel.searchParams.and_tel_like[0]}"/>
			</li>
			<li>
				<label>卡号：</label>
				<input type="text" name="sscModel.searchParams.and_card_like" value="${sscModel.searchParams.and_card_like[0]}"/>
			</li>
			<li style="width: 500px;">
				<label>注册时间：</label>
				<input name="sscModel.searchParams.and_addTs_ge_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${sscModel.searchParams._and_addTs_ge_date[0] }" placeholder="开始时间"/>
				<input name="sscModel.searchParams.and_addTs_le_date" type="text" class="date" dateFmt="yyyy-MM-dd HH:mm:ss" size="20" value="${sscModel.searchParams._and_addTs_le_date[0] }" placeholder="结束时间"/>
			</li>
			<li style="width: 500px;">
				<label>余额：</label>
				<input name="sscModel.searchParams.and_money_ge" type="text" value="<c:if test="${sscModel.searchParams.and_money_ge[0] != null && sscModel.searchParams.and_money_ge[0] != ''}">${sscModel.searchParams.and_money_ge[0]/100 }</c:if>" placeholder="大于"/>
				<input name="sscModel.searchParams.and_money_le" type="text" value="<c:if test="${sscModel.searchParams.and_money_le[0] != null && sscModel.searchParams.and_money_le[0] != ''}">${sscModel.searchParams.and_money_le[0]/100 }</c:if>" placeholder="小于"/>
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
	搜索内容：<input type="text" size="30" name="sscModel.search" value="${sscModel.search}"/>
	<input type="hidden"  name="sscModel.searchField" value="title,description,author,content,files"/>
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
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="sscModel.ids" href="${webUrl}/notices/0?_method=delete" class="delete"><span>批量删除</span></a></li>
			<li><a class="edit" href="${webUrl}/notices/{data_id}/edit" rel="notices_edit"  target="dialog" width="800" height="480" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
		<%-- 	<li><a class="icon" href="${webUrl}/notices.xls" target="dwzExport" targetType="navTab" title="是要导出这些记录吗?"><span>导出EXCEL</span></a></li> --%>
		</ul>
	</div>
<%-- ===================修改table显示内容===================== --%>
	<table class="table" layoutH="190">
		<thead>
			<tr>
				<th width="100">开奖期号</th>
				<th width="100">开奖号码</th>
				<th width="100">总投注额</th>
				<th width="100">盈利</th>
				<th width="80">盈利百分比</th>
				<th width="150">开奖时间</th>
				<th width="350" >投注时间</th>
				<th width="50">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="bm" items="${sscModel.dataList}" varStatus="name">
			<tr target="bm_id" rel="${bm.id}">
				<td>${bm.qihao}</td>			   
				<td>${bm.no}</td>			   
				<td><fmt:formatNumber value="${bm.income/100}" pattern="0.00"/></td>			   
				<td><fmt:formatNumber value="${bm.allwin/100}" pattern="0.00"/></td>
				<td>${bm.rate}</td>
				<td><fmt:formatDate value="${bm.time }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td><fmt:formatDate value="${bm.stime }" pattern="yyyy-MM-dd HH:mm:ss"/>至<fmt:formatDate value="${bm.etime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
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
				<option value="${sscModel.numPerPage}">${sscModel.numPerPage}</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共${sscModel.totalCount}条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="${sscModel.totalCount}" numPerPage="${sscModel.numPerPage}" pageNumShown="10" currentPage="${sscModel.pageNum}"></div>

	</div>
</div>
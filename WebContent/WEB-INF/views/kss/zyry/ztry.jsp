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
	<form class="advancedSearchForm" rel="pagerForm"  onsubmit="return navTabSearch(this);" action="${webUrl}/kss/zyry/0/ztry" method="POST">
	<div class="searchBar">
		<ul class="searchContent">
			<li style="width: 450px;"><label>身份证号码：</label>
				<input style="float: left" type="text" name="zyryModel.searchParams.and_sfzh_eq_string" class="text" 
				 value="${zyryModel.searchParams.and_sfzh_eq_string[0]}"/>
			</li>
			<li style="width: 450px;"><label>姓名：</label>
				<input style="float: left" type="text" name="zyryModel.searchParams.and_xm_eq_string" class="text" 
				 value="${zyryModel.searchParams.and_xm_eq_string[0]}"/>
			</li>
		</ul>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>

<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		</ul>
	</div>
	<table class="table"  width="1200" layoutH="138">
		<thead>
			<tr>
				<th width="60">人员编号</th>
				<th width="40">姓名</th>
				<th width="70">性别</th>
				<th width="70">出生日期</th>
				<th width="70">身份证号</th>
				<th width="70">民族</th>
				<th width="70">户籍地址</th>
				<th width="70">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:set scope="page" var="num" value="1"></c:set>
			<c:forEach var="kssZtry" items="${zyryModel.dataList}" varStatus="name">
			<tr target="kssZtry_id" rel="${kssZtry.rybh}">
				<td>${kssZtry.rybh}</td>
				<td>${kssZtry.xm}</td>
			   <td><c:if test="${kssZtry.xbDm == 1 }">男</c:if><c:if test="${kssZtry.xbDm == 0 }">女</c:if></td>
				<td>${kssZtry.csrqSx}</td>
				<td>${kssZtry.sfzh}</td>
				<td>${kssZtry.mzDm}</td>
				<td>${kssZtry.hjdXz}</td>
				<td>
					<a title="详情"  target="dialog" width="900" height="480" href="${webUrl}/kss/zyry/0/ztrydetail?ryid=${kssZtry.ryid}" rel="gg_edit" class="btnView">详情</a>
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
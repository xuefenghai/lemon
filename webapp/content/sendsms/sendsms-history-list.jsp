<%@page contentType="text/html;charset=UTF-8"%>
<%@include file="/taglibs.jsp"%>
<%pageContext.setAttribute("currentHeader", "sendsms");%>
<%pageContext.setAttribute("currentMenu", "sendsms");%>
<!doctype html>
<html lang="en">

  <head>
    <%@include file="/common/meta.jsp"%>
    <title>列表</title>
    <%@include file="/common/s3.jsp"%>
    <script type="text/javascript">
var config = {
    id: 'smsHistoryGrid',
    pageNo: ${page.pageNo},
    pageSize: ${page.pageSize},
    totalCount: ${page.totalCount},
    resultSize: ${page.resultSize},
    pageCount: ${page.pageCount},
    orderBy: '${page.orderBy == null ? "" : page.orderBy}',
    asc: ${page.asc},
    params: {
        'filter_LIKES_mobile': '${param.filter_LIKES_mobile}'
    },
	selectedItemClass: 'selectedItem',
	gridFormId: 'smsHistoryGridForm',
	exportUrl: 'sendsms-history-export.do'
};

var table;

$(function() {
	table = new Table(config);
    table.configPagination('.m-pagination');
    table.configPageInfo('.m-page-info');
    table.configPageSize('.m-page-size');
});
    </script>
  </head>

  <body>
    <%@include file="/header/sendsms.jsp"%>

    <div class="row-fluid">
	  <%@include file="/menu/sendsms.jsp"%>

	  <!-- start of main -->
      <section id="m-main" class="col-md-10" style="padding-top:65px;">

<div class="panel panel-default">
  <div class="panel-heading">
	<i class="glyphicon glyphicon-list"></i>
    查询
	<div class="pull-right ctrl">
	  <a class="btn btn-default btn-xs"><i id="sendsms-configSearchIcon" class="glyphicon glyphicon-chevron-up"></i></a>
    </div>
  </div>
  <div class="panel-body">

		  <form name="sendsms-configForm" method="post" action="sendsms-history-list.do" class="form-inline">
		    <label for="sendsms-config_mobile">手机:</label>
		    <input type="text" id="sendsms-config_mobile" name="filter_LIKES_mobile" value="${param.filter_LIKES_mobile}" class="form-control">
			<button class="btn btn-default a-search" onclick="document.sendsms-configForm.submit()">查询</button>&nbsp;
		  </form>

		</div>
	  </div>

      <div style="margin-bottom: 20px;">
	    <div class="pull-left btn-group" role="group">
		  <!--
		  <button class="btn btn-default a-insert" onclick="location.href='sendsms-history-input.do'">新建</button>
		  <button class="btn btn-default a-remove" onclick="table.removeAll()">删除</button>
		  <button class="btn btn-default a-export" onclick="table.exportExcel()">导出</button>
		  -->
		</div>

		<div class="pull-right">
		  每页显示
		  <select class="m-page-size form-control" style="display:inline;width:auto;">
		    <option value="10">10</option>
		    <option value="20">20</option>
		    <option value="50">50</option>
		  </select>
		  条
        </div>

	    <div class="clearfix"></div>
	  </div>

<form id="sendsms-configGridForm" name="sendsms-configGridForm" method='post' action="sendsms-history-remove.do" class="m-form-blank">
      <div class="panel panel-default">
        <div class="panel-heading">
		  <i class="glyphicon glyphicon-list"></i>
		  <spring:message code="scope-info.scope-info.list.title" text="列表"/>
		</div>

<form id="smsHistoryGridForm" name="smsHistoryGridForm" method='post' action="sendsms-history-remove.do" class="m-form-blank">
  <table id="smsHistoryGrid" class="table table-hover">
    <thead>
      <tr>
        <th width="10" class="m-table-check"><input type="checkbox" name="checkAll" onchange="toggleSelectedItems(this.checked)"></th>
        <th>创建时间</th>
        <th>手机</th>
        <th>信息</th>
        <th>状态</th>
        <th width="90">&nbsp;</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${page.result}" var="item">
      <tr>
        <td><input type="checkbox" class="selectedItem a-check" name="selectedItem" value="${item.id}"></td>
        <td><fmt:formatDate value="${item.createTime}" type="both"/></td>
        <td>${item.mobile}</td>
        <td>${item.message}</td>
        <td>${item.status}</td>
        <td>
		  <a href="sendsms-history-view.do?id=${item.id}">查看</a>
		  &nbsp;
          <a href="sendsms-history-send.do?id=${item.id}">重发</a>
        </td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</form>

      </div>
	  <div>
	    <div class="m-page-info pull-left">
		  共100条记录 显示1到10条记录
		</div>

		<div class="btn-group m-pagination pull-right">
		  <button class="btn btn-default">&lt;</button>
		  <button class="btn btn-default">1</button>
		  <button class="btn btn-default">&gt;</button>
		</div>

	    <div class="clearfix"></div>
      </div>

      <div class="m-spacer"></div>

      </section>
	  <!-- end of main -->
	</div>

  </body>

</html>


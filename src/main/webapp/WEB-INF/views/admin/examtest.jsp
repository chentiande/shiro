<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#sysLogDataGrid').datagrid({
            url: '${path }/exam/dataGrid',
            striped: true,
            pagination: true,
            singleSelect: true,
            idField: 'id',
            pageSize: 20,
            pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
            columns: [[{
                width: '80',
                title: '问题',
                field: 'question',
                sortable: true
            }, {
                width: '130',
                title: '答案',
                field: 'answer'
            }]]
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false">
        <table id="sysLogDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
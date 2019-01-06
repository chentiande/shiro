<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var examDataGrid;

    $(function() {
    	examDataGrid = $('#examDataGrid').datagrid({
            url : '${path }/exam/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'question',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
                width : '200',
                title : '问题',
                field : 'question',
                sortable : true
            }, {
                width : '200',
                title : '答案',
                field : 'answer',
                sortable : true
            },{
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';
                        <shiro:hasPermission name="/exam/edit">
                            str += $.formatString('<a href="javascript:void(0)" class="exam-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'glyphicon-pencil icon-blue\'" onclick="editExamFun(\'{0}\');" >编辑</a>', row.id);
                        </shiro:hasPermission>
                        <shiro:hasPermission name="/exam/delete">
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="exam-easyui-linkbutton-del" data-options="plain:true,iconCls:\'glyphicon-trash icon-red\'" onclick="deleteExamFun(\'{0}\');" >删除</a>', row.id);
                        </shiro:hasPermission>
                    return str;
                }
            }] ],
            onLoadSuccess:function(data){
                $('.exam-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.exam-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#examToolbar'
        });
    });
    
    function addExamFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/exam/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = examDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#examAddForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function deleteExamFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = examDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
        	examDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前试题？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/exam/delete', {
                    id : id
                }, function(result) {
                    result = $.parseJSON(result);
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        examDataGrid.datagrid('reload');
                    } else {
                        parent.$.messager.alert('错误', result.msg, 'error');
                    }
                    progressClose();
                }, 'text');
            }
        });
    }
    
    function editExamFun(id) {
        if (id == undefined) {
            var rows = examDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
        	examDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title : '编辑',
            width : 500,
            height : 300,
            href : '${path }/exam/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = examDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#examEditForm');
                    f.submit();
                }
            } ]
        });
    }
    
    
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    
    <div data-options="region:'center',border:true,title:'试题列表'" >
        <table id="examDataGrid" data-options="fit:true,border:false"></table>
    </div>

</div>
<div id="examToolbar" style="display: none;">
    <shiro:hasPermission name="/exam/add">
        <a onclick="addExamFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'glyphicon-plus icon-green'">添加</a>
    </shiro:hasPermission>
</div>
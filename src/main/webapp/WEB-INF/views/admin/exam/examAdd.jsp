<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
       

      

        $('#examAddForm').form({
            url : '${path }/exam/add',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#examAddForm');
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="examAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>问题</td>
                    <td><input name="question" type="text" placeholder="请输入试题" class="easyui-validatebox" data-options="required:true" value=""></td>
                    <td>答案</td>
                    <td><input name="answer" type="text" placeholder="请输入答案" class="easyui-validatebox" data-options="required:true" value=""></td>
                               
                </tr>
            </table>
        </form>
    </div>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#examEditForm').form({
            url : '${path }/exam/edit',
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
                    var form = $('#examEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="examEditForm" method="post">
            <table class="grid">
                 <tr>
                  <td><input name="id" type="hidden"  value="${exam.id}">
                    <td>问题</td>
                    <td><input name="question" type="text" placeholder="请输入试题" class="easyui-validatebox" data-options="required:true" value="${exam.question}"></td>
                    <td>答案</td>
                    <td><input name="answer" type="text" placeholder="请输入答案" class="easyui-validatebox" data-options="required:true" value="${exam.answer}"></td>
                               
                </tr>
            </table>
        </form>
    </div>
</div>
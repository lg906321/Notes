<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sg" uri="http://www.sungness.com/tags" %>
<%@ taglib prefix="sform" uri="http://www.sungness.com/tags/form" %>
<s:url value="/manage/system/log/action/edit" var="addURL"/>
<s:url value="/manage/system/log/action/edit?id=${commandLog.id}" var="editURL"/>
<s:url value="/manage/system/log/action/delete?id=${commandLog.id}" var="delURL"/>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-cn" lang="zh-cn" dir="ltr" >
<head>
    <%@ include file="/WEB-INF/jsp/manage/includes/meta.jsp" %>
    <title><s:message code="system.name"/> - ${commandInfo.module.value} - ${commandInfo.value}</title>
    <%@ include file="/WEB-INF/jsp/manage/includes/linksOfListHead.jsp" %>
    <%@ include file="/WEB-INF/jsp/manage/includes/scriptsOfHead.jsp" %>
    <script src="<s:url value="/media/jui/js/jquery.searchtools.min.js" />" type="text/javascript"></script>
    <script src="<s:url value="/media/system/js/multiselect.js" />" type="text/javascript"></script>
</head>
<body class="admin com_admin view-sysinfo layout- task- itemid-">
<!-- Top Navigation -->
<%@ include file="/WEB-INF/jsp/manage/includes/topNavigation.jsp" %>
<!-- Header -->
<%@ include file="/WEB-INF/jsp/manage/includes/header.jsp" %>
<!-- Subheader -->
<c:set var="showNew" value="true"/>
<c:set var="showEdit" value="true"/>
<c:set var="showDelete" value="true"/>
<c:set var="showCancel" value="true"/>
<%@ include file="/WEB-INF/jsp/manage/includes/detailSubHeader.jsp" %>
<!-- container-fluid -->
<div class="container-fluid container-main">
    <section id="content">
        <!-- Begin Content -->
        <div class="row-fluid">
            <div class="span12">
                <%@ include file="/WEB-INF/jsp/manage/includes/systemMessage.jsp" %>
                <div class="row-fluid">
                    <!-- Begin Content -->
                    <div class="span12">
                        <fieldset class="adminform">
                            <legend>用户操作日志 详细信息</legend>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th width="25%">条目</th>
                                        <th>内容</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <td colspan="2">&#160;</td>
                                    </tr>
                                </tfoot>
                                <tbody>

                                    <tr>
                                        <td><strong><s:message code="commandLog.name"/></strong></td>
                                        <td>
                                            ${commandLog.name}
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><strong><s:message code="commandLog.commandName"/></strong></td>
                                        <td>
                                            ${commandLog.commandName}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.moduleName"/></strong></td>
                                        <td>
                                            ${commandLog.moduleName}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.requestPath"/></strong></td>
                                        <td>
                                            ${commandLog.requestPath}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.parameters"/></strong></td>
                                        <td>
                                            ${commandLog.parameters}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.userIp"/></strong></td>
                                        <td>
                                            ${commandLog.userIp}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.resultSuccesss"/></strong></td>
                                        <td>
                                            <c:if test="${commandLog.resultSuccesss == 0}">
                                                <span class="icon-unpublish"></span>
                                            </c:if>
                                            <c:if test="${commandLog.resultSuccesss == 1}">
                                                <span class="icon-publish"></span>
                                            </c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.resultMessage"/></strong></td>
                                        <td>
                                            ${commandLog.resultMessage}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.actionTime"/></strong></td>
                                        <td>
                                            ${commandLog.getActionTimeFullFormat()}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.userId"/></strong></td>
                                        <td>
                                            ${commandLog.userId}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong><s:message code="commandLog.commandId"/></strong></td>
                                        <td>
                                            ${commandLog.commandId}
                                        </td>
                                    </tr>
                                <tr>
                                    <td><strong><s:message code="commandLog.id"/></strong></td>
                                    <td>
                                        ${commandLog.id}
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </fieldset>
                    </div>
                    <!-- End Content -->
                </div>
            </div>
        </div>
        <!-- End Content -->
    </section>
</div>
<!-- Begin Status Module -->
<%@ include file="/WEB-INF/jsp/manage/includes/footer.jsp" %>
<!-- End Status Module -->
<script src="<s:url value="/js/require.js" />"></script>
<script type="text/javascript">
    var __ctx='<%= request.getContextPath() %>';
    require(['<s:url value="/js/config.js" />'], function() {
        require(['app/module'], function(module) {
            var config = {
                url: {
                    add: "${addURL}",
                    edit: "${editURL}",
                    del: "${delURL}",
                    back: "${backURL}"
                },
                message: {
                    confirm_delete: "<s:message code="JGLOBAL_CONFIRM_DELETE"/>"
                }
            };
            module.initDetail(config);
        });
    });
</script>
</body>
</html>
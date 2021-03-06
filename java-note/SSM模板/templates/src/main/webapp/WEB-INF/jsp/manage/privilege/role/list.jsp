<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sg" uri="http://www.sungness.com/tags" %>
<%@ taglib prefix="sform" uri="http://www.sungness.com/tags/form" %>
<s:url value="/manage/privilege/role/list" var="listURL"/>
<s:url value="/manage/privilege/role/companyAuthorize?backURL=${pagination.encodedCurrentPageURL}" var="companyAuthorizeURL"/>
<s:url value="/manage/privilege/role/businessAuthorize?backURL=${pagination.encodedCurrentPageURL}" var="businessAuthorizeURL"/>
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
<body class="admin com_users view-users layout- task- itemid-">
<!-- Top Navigation -->
<%@ include file="/WEB-INF/jsp/manage/includes/topNavigation.jsp" %>
<!-- Header -->
<%@ include file="/WEB-INF/jsp/manage/includes/header.jsp" %>
<!-- Subheader -->
<%@ include file="/WEB-INF/jsp/manage/includes/listSubHeader.jsp" %>
<!-- container-fluid -->
<div class="container-fluid container-main">
    <section id="content">
        <!-- Begin Content -->
        <div class="row-fluid">
            <div class="span12">
                <%@ include file="/WEB-INF/jsp/manage/includes/systemMessage.jsp" %>
                <form:form commandName="queryFilter" id="adminForm" name="adminForm" action="${listURL}">
                    <%@ include file="/WEB-INF/jsp/manage/includes/sidebarContainer.jsp" %>
                    <div id="j-main-container" class="span10">
                        <div class="js-stools clearfix">
                            <c:set var="searchPath" value="filter[name]"/>
                            <%@ include file="/WEB-INF/jsp/manage/includes/filter/searchTools.jsp" %>
                            <!-- Filters div -->
                            <div class="js-stools-container-filters clearfix">
                                <div class="js-stools-field-filter">
                                    <s:message code="manageRole.status" var="status_option"/>
                                    <s:message code="JGLOBAL_STATUS_0" var="status_0"/>
                                    <s:message code="JGLOBAL_STATUS_1" var="status_1"/>
                                    <form:select path="filter[status]" id="filter_status" onchange="this.form.submit();">
                                        <form:option value="" label="- ${status_option} -"/>
                                        <form:option value="0" label="${status_0}"/>
                                        <form:option value="1" label="${status_1}"/>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped" id="userList">
                            <thead>
                            <tr>
                                <c:set var="fullordering" value="${queryFilter.filter.fullordering}"/>
                                <c:set var="columnCount" value="5"/>
                                <th width="1%" class="center">
                                    <sform:checkall id="checkall-toggle"/>
                                </th>
                                <th class="nowrap left">
                                    <sg:thlink name="manageRole.name" order="a.name" fullOrdering="${fullordering}"/>
                                </th>
                                <th class="nowrap">
                                    <s:message code="manageRole.manager"/>
                                </th>
                                <sec:authorize access="hasPermission(#commandInfo.module, 'companyAuthorize')">
                                <th width="10%" class="nowrap center">公司授权</th>
                                <c:set var="columnCount" value="${columnCount=columnCount+1}"/>
                                </sec:authorize>
                                <sec:authorize access="hasPermission(#commandInfo.module, 'businessAuthorize')">
                                    <th width="10%" class="nowrap center">业务授权</th>
                                    <c:set var="columnCount" value="${columnCount=columnCount+1}"/>
                                </sec:authorize>
                                <th width="5%" class="nowrap center">
                                    <sg:thlink name="manageRole.status" order="a.status" fullOrdering="${fullordering}"/>
                                </th>
                                <th width="10%" class="nowrap center hidden-phone"><s:message code="manageRole.userCount"/></th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <td colspan="${columnCount}">
                                    <%@ include file="/WEB-INF/jsp/manage/includes/pagination.jsp" %>
                                </td>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach items="${manageRoleList}" varStatus="status">
                                <c:set var="role" value="${status.current}"/>
                            <tr class="row${status.index % 2}">
                                <td class="center">
                                    <input type="checkbox" id="cb0" name="id" value="${role.id}" onclick="Joomla.isChecked(this.checked);" /></td>
                                <td>
                                    <div class="name">${role.name}</div>
                                </td>
                                <td>
                                    <div class="name">${role.managerDescription}</div>
                                </td>
                                <sec:authorize access="hasPermission(#commandInfo.module, 'companyAuthorize')">
                                <td class="center">
                                    <a class="btn btn-micro active hasTooltip" href="${companyAuthorizeURL}&id=${role.id}"
                                       title="为 角色 ${role.name} 授权可用公司">
                                        <span class="icon-briefcase"></span></a>
                                </td>
                                </sec:authorize>
                                <sec:authorize access="hasPermission(#commandInfo.module, 'businessAuthorize')">
                                    <td class="center">
                                        <a class="btn btn-micro active hasTooltip" href="${businessAuthorizeURL}&id=${role.id}"
                                           title="为 角色 ${role.name} 授权可用业务">
                                            <span class="icon-cube"></span></a>
                                    </td>
                                </sec:authorize>
                                <td class="center">
                                    <%--<a class="btn btn-micro active hasTooltip" href="javascript:void(0);"
                                       onclick="return listItemTask('cb2','block')" title="<s:message code="manageRole.status.tip"/>">
                                        <span class="icon-publish"></span></a>--%>
                                    <c:if test="${role.status == 0}">
                                        <span class="icon-unpublish"></span>
                                    </c:if>
                                    <c:if test="${role.status == 1}">
                                        <span class="icon-publish"></span>
                                    </c:if>
                                </td>
                                <td class="center hidden-phone"><span class="badge">0</span></td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <input type="hidden" name="task" value="" />
                        <input type="hidden" name="boxchecked" value="0" />
                    </div>
                </form:form>
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
                    list: "${listURL}",
                    back: "${pagination.getCurrentPageURL()}"
                },
                message: {
                    hide_sidebar: "<s:message code="JTOGGLE_HIDE_SIDEBAR" />",
                    show_sidebar: "<s:message code="JTOGGLE_SHOW_SIDEBAR" />",
                    multiple_tip: "<s:message code="JSELECT_MULTIPLE" />",
                    single_tip:"<s:message code="JSELECT_SINGLE" />",
                    no_results_tip: "<s:message code="JSELECT_NO_RESULTS" />",
                    filter_search_tip: "<sg:message code="JSEARCH_TITLE" ref="manageRole.name" />",
                    no_item_selected: "<s:message code="JGLOBAL_NO_ITEM_SELECTED"/>",
                    confirm_delete: "<s:message code="JGLOBAL_CONFIRM_DELETE"/>"
                },
                joomla: {
                    filtersHidden: ${!queryFilter.hasFilter()}
                }
            };
            module.initList(config);
        });
    });
</script>
</body>
</html>
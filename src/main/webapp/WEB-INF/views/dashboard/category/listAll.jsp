<%--
   后台菜单管理管理
  User: Deng Xiaolan (824688439@qq.com)
  Date: 12-3-24
  Time: 上午10:39
--%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>菜单管理 - 后台管理</title>
</head>
<body>
<div id="main_container" class="main_container container_16 clearfix">
    <div class="flat_area grid_16">
        <h2>菜单管理</h2>
        <p>这里可以管理 <strong>顶级菜单</strong> 和相应的 <strong>二级菜单</strong> .</p>
    </div>
</div>
<div class="main_container container_16 clearfix">
    <form:form id="categoryForm">
    <div class="box grid_16">
        <h2 class="box_head grad_colour">顶级菜单</h2>
        <a href="#" class="grabber">&nbsp;</a>
        <a href="#" class="toggle">&nbsp;</a>
        <div class="toggle_container">
            <ul class="block content_accordion">
                <c:forEach items="${categories}" var="category" begin="0" step="1">
                    <li>

                        <h3 class="bar" id="1" title="点击展开">${category.categoryName} [${fn:length(category.subCategories)}]&nbsp;顺序：${category.displayOrder}&nbsp;<a class="amodify" href="${ctx}/category/edit/${category.id}"><span>【修改】</span></a>
                            <a class="amodify" id="deleteFir" href="${ctx}/category/delete/${category.id}"><span>【删除】</span></a></h3>
                        <c:if test="${fn:length(category.subCategories) > 0}">
                            <div class="content">
                                    <table class="display menu_sec">
                                        <thead>
                                        <tr class="box-head grad_colour">
                                            <th>名称</th>
                                            <th>显示顺序</th>
                                            <th>Url</th>
                                            <th>允许评论</th>
                                            <th>允许发表</th>
                                            <th>显示类型</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${category.subCategories}" var="subCategory" begin="0" step="1">
                                            <tr>
                                                <td><input type="text" name="categoryName" value="${subCategory.categoryName}" class="menu"></td>
                                                <td><input type="text" name="displayOrder" value="${subCategory.displayOrder}" class="menu"></td>
                                                <td><input type="text" name="url" size="20px" class="menu" value="${subCategory.url}"></td>
                                                <td><input type="checkbox" name="allowComment" class="menu" <c:if test="${subCategory.allowComment}">checked="checked"</c:if>></td>
                                                <td><input type="checkbox" class="menu" name="allowPublish" <c:if test="${subCategory.allowPublish}">checked="checked"</c:if>></td>
                                                <td><select name="showType"><c:forEach items="${showTypes}" var="showType" begin="0" step="1">
                                                    <option value="${showType.value}"
                                                            <c:if test="${showType.value==subCategory.showType.value}">selected="selected"</c:if>>${showType.displayName}</option>
                                                </c:forEach></select></td>
                                                <td><a href="${ctx}/category/edit/${subCategory.id}" type="submit">【修改】</a> <a href="${ctx}/category/delete/${subCategory.id}" type="submit" class="deleteSec">【删除】</a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                            </div>
                        </c:if>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    </form:form>
</div>
<script type="text/javascript">
    $('#deleteFir').click(function(){
        if(confirm("删除一级菜单将连带删除其下属二级菜单，请您慎重！确定要删除吗？")){
            return true;
        } else{
            return false;
        }
    });
    $('.deleteSec').click(function(){
        if(confirm("确定要删除吗？")){
            return true;
        } else{
            return false;
        }
    });
</script>
</body>
</html>
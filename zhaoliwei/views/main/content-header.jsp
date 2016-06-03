<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: mac
  Date: 16/2/16
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Content header -->
<section class="content-header">
    <h4>
        <c:choose>
            <c:when test="${empty sessionScope.reqURI}">
                首页
            </c:when>
            <c:otherwise>
                ${fn:split(sessionScope.reqURI, '/')[0]}
                <small>${fn:split(sessionScope.reqURI, '/')[1]}</small>
            </c:otherwise>
        </c:choose>
    </h4>
    <%--<ol class="breadcrumb">--%>
        <%--<c:choose>--%>
            <%--<c:when test="${empty sessionScope.reqURI}">--%>
                <%--<li><i class="fa fa-dashboard"></i>首页</li>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
                <%--<li><i class="fa fa-dashboard"></i>${fn:split(sessionScope.reqURI, '/')[0]}</li>--%>
                <%--<li class="active">${fn:split(sessionScope.reqURI, '/')[1]}</li>--%>
            <%--</c:otherwise>--%>
        <%--</c:choose>--%>
    <%--</ol>--%>
</section>


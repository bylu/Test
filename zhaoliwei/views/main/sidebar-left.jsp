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
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="resource/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.loginFlag.username}</p>
                <!-- Status -->
                <a><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- search form (Optional) -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="Search...">
                  <span class="input-group-btn">
                    <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
                  </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <c:forEach var="menu" items="${sessionScope.userMenu}" varStatus="status">
                <c:choose>
                    <c:when test="${status.first}">
                        <li class="topNav">
                            <!-- 兼容老后台程序,数据库中必须带.jsp后缀;新后台无需带后缀,所以在此替换掉 -->
                            <a href="${fn:replace(menu.link, ".jsp", "")}">
                                <i class="fa fa-link"></i>
                                <span>${menu.title}</span>
                            </a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${fn:length(menu.children) > 0}">
                            <li class="treeview" id="${menu.moduleId}">
                                <a href="#">
                                    <i class="fa fa-link"></i>
                                    <span>${menu.title}</span>
                                    <i class="fa fa-angle-left pull-right"></i>
                                </a>
                                <ul class="treeview-menu">
                                    <c:forEach var="childMenu" items="${menu.children}">
                                        <li id="${childMenu.moduleId}">
                                            <!-- 兼容老后台程序,数据库中必须带.jsp后缀;新后台无需带后缀,所以在此替换掉 -->
                                            <a href='javascript:show("${fn:replace(childMenu.link, ".jsp", "")}","${menu.moduleId}","${childMenu.moduleId}")' style="font-size:13px;">${childMenu.title}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>

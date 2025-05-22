<%@page import="onlinefruitshop.controller.CategoryListCtl"%>
<%@page import="onlinefruitshop.controller.CategoryCtl"%>
<%@page import="onlinefruitshop.bean.ProductBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="onlinefruitshop.bean.CategoryBean"%>
<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Categories</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; background-color: #f9f9f9;">

<%@ include file="Header.jsp" %>

<form action="<%=SOTGView.CATEGORY_LIST_CTL%>" method="post">

<!-- Header Section -->
<div style="background-color: #4CAF50; padding: 40px 0; color: white; text-align: center;">
    <h1>Category</h1>
</div>

<!-- Breadcrumb -->
<div style="padding: 10px 20px;">
    <div>
        <span><a href="<%=SOTGView.HOME_CTL%>" style="text-decoration: none; color: #4CAF50;">Home</a> / </span>
        <span style="color: #333;">Categories</span>
    </div>
</div>

<!-- Category Cards -->
<div style="padding: 20px;">
    <div style="display: flex; flex-wrap: wrap; gap: 20px;">
        <%
            int pageNo = ServletUtility.getPageNo(request);
            int pageSize = ServletUtility.getPageSize(request);
            int size = (int) request.getAttribute("size");
            int index = ((pageNo - 1) * pageSize) + 1;
            CategoryBean bean = null;
            List list = ServletUtility.getList(request);
            Iterator<CategoryBean> it = list.iterator();

            while (it.hasNext()) {
                bean = it.next();
        %>
        <div style="flex: 1 1 calc(33% - 20px); background-color: white; border: 1px solid #ddd; border-radius: 5px; overflow: hidden; box-shadow: 0 2px 5px rgba(0,0,0,0.1);">
            <a href="<%=SOTGView.PRODUCT_LIST_CTL%>?product=<%=bean.getName()%>&proId=<%=bean.getId()%>">
                <img src="<%=SOTGView.APP_CONTEXT%>/images/<%=bean.getImage()%>" alt="Category Image" style="width: 100%; height: 200px; object-fit: cover;">
            </a>
            <div style="padding: 15px;">
                <h3 style="margin-top: 0;"><a href="<%=SOTGView.PRODUCT_DETAIL_CTL%>?product=<%=bean.getName()%>&proId=<%=bean.getId()%>" style="color: #333; text-decoration: none;"><%=bean.getName()%></a></h3>
                <div style="display: flex; gap: 10px;">
                    <!-- Updated Delete Button with Confirmation Alert -->
                    <a href="<%=SOTGView.CATEGORY_LIST_CTL%>?dId=<%=bean.getId()%>"
                       onclick="return confirm('Are you sure you want to delete this category?');"
                       style="flex: 1; padding: 10px; background-color: #e74c3c; color: white; text-align: center; text-decoration: none; border-radius: 4px;">
                       Delete
                    </a>
                    <a href="<%=SOTGView.CATEGORY_CTL%>?id=<%=bean.getId()%>" style="flex: 1; padding: 10px; background-color: #2ecc71; color: white; text-align: center; text-decoration: none; border-radius: 4px;">Edit</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <!-- Pagination and Add Button -->
    <div style="margin-top: 30px; display: flex; align-items: center; justify-content: space-between;">
        <div>
            <input type="submit" name="operation" value="<%=CategoryListCtl.OP_PREVIOUS%>"
                   <%= (pageNo == 1) ? "disabled" : "" %>
                   style="padding: 10px 20px; background-color: #ccc; border: none; border-radius: 4px; cursor: pointer;">
            <input type="submit" name="operation" value="<%=CategoryListCtl.OP_NEXT%>"
                   <%= ((list.size() < pageSize) || size == pageNo * pageSize) ? "disabled" : "" %>
                   style="padding: 10px 20px; background-color: #ccc; border: none; border-radius: 4px; cursor: pointer;">
        </div>
        <div>
            <a href="<%=SOTGView.CATEGORY_CTL%>" style="padding: 10px 20px; background-color: #3498db; color: white; text-decoration: none; border-radius: 4px;">Add New Categories</a>
        </div>
    </div>
</div>

</form>

<%@ include file="Footer.jsp" %>
</body>
</html>
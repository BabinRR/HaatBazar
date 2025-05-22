<%@page import="onlinefruitshop.controller.AdminCtl"%>
<%@page import="onlinefruitshop.util.DataUtility"%>
<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f6fa;
        margin: 0;
        padding: 0;
    }
    .jumbotron {
        background-color: #2c3e50;
        color: white;
        padding: 40px 0;
        text-align: center;
    }
    .container {
        width: 80%;
        margin: auto;
        padding-top: 20px;
    }
    .breadcrumb {
        list-style: none;
        display: flex;
        background-color: transparent;
        padding: 0;
        margin: 0 0 20px 0;
    }
    .breadcrumb li {
        margin-right: 10px;
    }
    .breadcrumb li a {
        text-decoration: none;
        color: #3498db;
    }
    .breadcrumb li.active a {
        font-weight: bold;
    }
    .card {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    }
    .card-header {
        font-size: 20px;
        background-color: #2980b9;
        color: white;
        padding: 10px;
        border-radius: 8px 8px 0 0;
        margin: -20px -20px 20px -20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        font-weight: bold;
    }
    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .btn {
        padding: 10px 20px;
        border: none;
        background-color: #27ae60;
        color: white;
        border-radius: 5px;
        margin: 5px;
        cursor: pointer;
        font-weight: bold;
    }
    .btn:hover {
        background-color: #219150;
    }
    .text-red {
        color: red;
        font-size: 13px;
    }
    .text-green {
        color: green;
        font-size: 13px;
    }
    .mx-auto {
        text-align: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
<%@ include file="Header.jsp" %>
<section class="jumbotron">
    <div class="container">
        <h1 class="jumbotron-heading">Add New Admin</h1>
    </div>
</section>

<div class="container">
    <ul class="breadcrumb">
        <li><a href="<%=SOTGView.HOME_CTL%>">Home</a></li>
        <li class="active"><a href="<%=SOTGView.ADMIN_CTL%>">Add Admin</a></li>
    </ul>

    <form action="<%=SOTGView.ADMIN_CTL%>" method="post">
        <jsp:useBean id="bean" class="onlinefruitshop.bean.UserBean" scope="request" />

        <div class="card">
            <% if(bean.getId() > 0){ %>
            <div class="card-header">Update Admin</div>
            <% } else { %>
            <div class="card-header">Add Admin</div>
            <% } %>

            <div class="text-red"><%=ServletUtility.getErrorMessage(request)%></div>
            <div class="text-green"><%=ServletUtility.getSuccessMessage(request)%></div>

            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <div class="form-group">
                <label>First Name</label>
                <input type="text" class="form-control" name="firstName" placeholder="Enter First Name..." 
                    value="<%=DataUtility.getStringData(bean.getFirstName())%>">
                <div class="text-red"><%=ServletUtility.getErrorMessage("firstName", request)%></div>
            </div>

            <div class="form-group">
                <label>Last Name</label>
                <input type="text" class="form-control" name="lastName" placeholder="Enter Last Name..." 
                    value="<%=DataUtility.getStringData(bean.getLastName())%>">
                <div class="text-red"><%=ServletUtility.getErrorMessage("lastName", request)%></div>
            </div>

            <div class="form-group">
                <label>Login Id</label>
                <input type="text" class="form-control" name="login" placeholder="Enter Login Id..." 
                    value="<%=DataUtility.getStringData(bean.getLogin())%>">
                <div class="text-red"><%=ServletUtility.getErrorMessage("login", request)%></div>
            </div>

            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter Password Here..." 
                    value="<%=DataUtility.getStringData(bean.getPassword())%>">
                <div class="text-red"><%=ServletUtility.getErrorMessage("password", request)%></div>
            </div>

            <div class="form-group">
                <label>Confirm Password</label>
                <input type="password" class="form-control" name="confirmPassword" placeholder="ReEnter Password Here..." 
                    value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>">
                <div class="text-red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></div>
            </div>

            <div class="form-group">
                <label>Email Address</label>
                <input type="text" class="form-control" name="email" placeholder="Enter Email Address..." 
                    value="<%=DataUtility.getStringData(bean.getLogin())%>">
                <div class="text-red"><%=ServletUtility.getErrorMessage("email", request)%></div>
            </div>

            <div class="form-group">
                <label>Mobile No.</label>
                <input type="text" class="form-control" name="mobile" placeholder="Enter 10 Digits Mobile No." 
                    value="<%=DataUtility.getStringData(bean.getMobileNo())%>">
                <div class="text-red"><%=ServletUtility.getErrorMessage("mobile", request)%></div>
            </div>

            <div class="mx-auto">
                <input type="submit" name="operation" class="btn" value="<%=AdminCtl.OP_SAVE%>">
                <% if(bean.getId() > 0){ %>
                <input type="submit" name="operation" class="btn" value="<%=AdminCtl.OP_CANCEL%>">
                <% } else { %>
                <input type="submit" name="operation" class="btn" value="<%=AdminCtl.OP_RESET%>">
                <% } %>
            </div>
        </div>
    </form>
</div>

<%@ include file="Footer.jsp" %>
</body>
</html>

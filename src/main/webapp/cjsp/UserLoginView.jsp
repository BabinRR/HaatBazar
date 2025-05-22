<%@page import="onlinefruitshop.controller.UserLoginCtl"%>
<%@page import="onlinefruitshop.util.DataUtility"%>
<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@page import="onlinefruitshop.controller.SOTGView"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login - Online Fruit Shop</title>
</head>
<body style="margin: 0; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f7f7f7;">

<%@ include file="Header.jsp" %>

<!-- Jumbotron/Header -->
<div style="background-color: #2ecc71; padding: 40px 0; text-align: center; color: white;">
    <h1 style="margin: 0; font-size: 36px;">LOGIN</h1>
</div>

<!-- Breadcrumb -->
<div style="width: 90%; max-width: 1000px; margin: 20px auto;">
    <div style="background: white; padding: 10px 20px; border-radius: 5px; font-size: 14px;">
        <a href="<%=SOTGView.WELCOME_CTL%>" style="color: #2ecc71; text-decoration: none;">Home</a> &gt; 
        <span style="color: #555;">Login</span>
    </div>
</div>

<!-- Main Container -->
<div style="display: flex; justify-content: center; margin-top: 20px;">
    <div style="width: 100%; max-width: 500px; background: white; padding: 25px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">

        <!-- Header -->
        <div style="background-color: #2ecc71; padding: 15px; border-radius: 8px 8px 0 0; color: white; text-align: center; font-size: 20px;">
            Login
            <div style="margin-top: 5px; font-size: 14px;">
                <span style="color: #ffcccc;"><%=ServletUtility.getErrorMessage(request)%></span><br>
                <span style="color: #d4ffd4;"><%=ServletUtility.getSuccessMessage(request)%></span>
            </div>
        </div>

        <!-- Form -->
        <form action="<%=SOTGView.LOGIN_CTL%>" method="post" style="padding-top: 20px;">

            <jsp:useBean id="bean" class="onlinefruitshop.bean.UserBean" scope="request" />
            <% String uri = (String) request.getAttribute("uri"); %>

            <input type="hidden" name="uri" value="<%=uri%>">
            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <!-- Login ID -->
            <div style="margin-bottom: 15px;">
                <label for="email" style="font-weight: bold; display: block;">Login ID</label>
                <input type="text" name="login" placeholder="Enter your login ID"
                       value="<%=DataUtility.getStringData(bean.getLogin())%>"
                       style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <div style="color: red; font-size: 13px;"><%=ServletUtility.getErrorMessage("login", request)%></div>
            </div>

            <!-- Password -->
            <div style="margin-bottom: 15px;">
                <label for="password" style="font-weight: bold; display: block;">Password</label>
                <input type="password" name="password" placeholder="Enter your password"
                       value="<%=DataUtility.getStringData(bean.getPassword())%>"
                       style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <div style="color: red; font-size: 13px;"><%=ServletUtility.getErrorMessage("password", request)%></div>
            </div>

            <!-- Buttons -->
            <div style="text-align: center; margin-top: 20px;">
                <input type="submit" name="operation" value="<%=UserLoginCtl.OP_SIGN_IN%>"
                       style="background-color: #2ecc71; color: white; border: none; padding: 10px 20px; border-radius: 5px; margin-right: 10px; cursor: pointer;">
                <input type="submit" name="operation" value="<%=UserLoginCtl.OP_SIGN_UP%>"
                       style="background-color: #3498db; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer;">
            </div>

            <!-- Forgot Password Link -->
            <div style="text-align: center; margin-top: 15px;">
                <a href="<%=SOTGView.FORGET_PASSWORD_CTL%>" style="text-decoration: none; color: #888;">Forgot your password?</a>
            </div>

        </form>
    </div>
</div>

<%@ include file="Footer.jsp" %>

</body>
</html>

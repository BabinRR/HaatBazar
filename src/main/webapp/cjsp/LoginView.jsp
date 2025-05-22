<%@page import="onlinefruitshop.util.DataUtility"%>
<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f9f9f9;">

<%@ include file="Header.jsp" %>

<!-- Jumbotron Section -->
<section style="text-align: center; padding: 40px 20px; background-color: #e9ecef;">
    <div style="max-width: 800px; margin: 0 auto;">
        <h1 style="margin: 0;">Login</h1>
    </div>
</section>

<!-- Breadcrumb -->
<div style="max-width: 1200px; margin: 20px auto;">
    <div style="margin-bottom: 10px;">
        <nav>
            <ol style="list-style: none; display: flex; gap: 10px; padding: 0; margin: 0;">
                <li><a href="<%=SOTGView.WELCOME_CTL%>" style="text-decoration: none; color: #007bff;">Home</a></li>
                <li><a href="<%=SOTGView.LOGIN_CTL%>" style="text-decoration: none; color: #000;">Login</a></li>
            </ol>
        </nav>
    </div>
</div>

<!-- Login Form Container -->
<div style="max-width: 600px; margin: 0 auto;">
    <div style="background-color: #fff; border: 1px solid #ccc; padding: 20px;">
        <div style="background-color: #007bff; color: white; padding: 10px; font-weight: bold;">
            Login
        </div>

        <div style="padding: 10px 0;">
            <font color="red"><%=ServletUtility.getErrorMessage(request)%></font><br>
            <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
        </div>

        <div>
            <form action="<%=SOTGView.LOGIN_CTL%>" method="post">

                <jsp:useBean id="bean" class="onlinefruitshop.bean.UserBean" scope="request" />

                <% String uri = (String) request.getAttribute("uri"); %>
                <input type="hidden" name="uri" value="<%=uri%>">
                <input type="hidden" name="id" value="<%=bean.getId()%>">
                <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
                <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
                <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
                <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

                <!-- Login ID Field -->
                <div style="margin-bottom: 15px;">
                    <label for="email">Login Id</label><br>
                    <input type="text" name="login" placeholder="Enter Login Id..." 
                        value="<%=DataUtility.getStringData(bean.getLogin())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <font color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
                </div>

                <!-- Password Field -->
                <div style="margin-bottom: 15px;">
                    <label for="password">Password</label><br>
                    <input type="password" name="password" placeholder="Enter Password Here..." 
                        value="<%=DataUtility.getStringData(bean.getPassword())%>" 
                        style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                    <font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>
                </div>

                <!-- Submit Buttons -->
                <div style="text-align: right; margin-top: 20px;">
                    <input type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_IN%>" 
                        style="background-color: #007bff; color: white; padding: 8px 16px; border: none; border-radius: 4px; margin-right: 10px; cursor: pointer;">
                    <input type="submit" name="operation" value="<%=LoginCtl.OP_SIGN_UP%>" 
                        style="background-color: #007bff; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer;">
                </div>
            </form>
        </div>
    </div>
</div>

<br>
<%@ include file="Footer.jsp" %>

</body>
</html>

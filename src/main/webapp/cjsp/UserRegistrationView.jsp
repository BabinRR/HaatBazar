<%@page import="onlinefruitshop.controller.UserRegistrationCtl"%>
<%@page import="onlinefruitshop.util.DataUtility"%>
<%@page import="onlinefruitshop.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
</head>
<body style="font-family: Arial, sans-serif; margin: 0; padding: 0; background-color: #f9f9f9;">

<%@ include file="Header.jsp" %>

<!-- Header Section -->
<section style="text-align: center; padding: 40px 20px; background-color: #e9ecef;">
    <div style="max-width: 800px; margin: 0 auto;">
        <h1 style="margin: 0;">Registration</h1>
    </div>
</section>

<!-- Breadcrumb -->
<div style="max-width: 1200px; margin: 20px auto;">
    <nav>
        <ol style="list-style: none; display: flex; gap: 10px; padding: 0; margin: 0;">
            <li><a href="<%=SOTGView.WELCOME_CTL%>" style="text-decoration: none; color: #007bff;">Home</a></li>
            <li><a href="<%=SOTGView.LOGIN_CTL%>" style="text-decoration: none; color: #007bff;">Login</a></li>
            <li><a href="<%=SOTGView.USER_REGISTRATION_CTL%>" style="text-decoration: none; color: #000;">Registration</a></li>
        </ol>
    </nav>
</div>

<!-- Registration Form -->
<div style="max-width: 700px; margin: 0 auto; background-color: #fff; border: 1px solid #ccc; padding: 20px;">
    <div style="background-color: #007bff; color: white; padding: 10px; font-weight: bold;">
        Registration
    </div>

    <div style="padding: 10px 0;">
        <font color="red"><%=ServletUtility.getErrorMessage(request)%></font><br>
        <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>
    </div>

    <form action="<%=SOTGView.USER_REGISTRATION_CTL%>" method="post">
        <jsp:useBean id="bean" class="onlinefruitshop.bean.UserBean" scope="request" />

        <!-- Hidden Fields -->
        <input type="hidden" name="id" value="<%=bean.getId()%>">
        <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
        <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
        <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
        <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

        <!-- Input Group -->
        <div style="margin-bottom: 15px;">
            <label>First Name</label><br>
            <input type="text" name="firstName" placeholder="Enter First Name..." 
                value="<%=DataUtility.getStringData(bean.getFirstName())%>"
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            <font color="red"><%=ServletUtility.getErrorMessage("firstName", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Last Name</label><br>
            <input type="text" name="lastName" placeholder="Enter Last Name..." 
                value="<%=DataUtility.getStringData(bean.getLastName())%>"
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            <font color="red"><%=ServletUtility.getErrorMessage("lastName", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Login Id</label><br>
            <input type="text" name="login" placeholder="Enter Login Id..." 
                value="<%=DataUtility.getStringData(bean.getLogin())%>"
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            <font color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Password</label><br>
            <input type="password" name="password" placeholder="Enter Password Here..." 
                value="<%=DataUtility.getStringData(bean.getPassword())%>"
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            <font color="red"><%=ServletUtility.getErrorMessage("password", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Confirm Password</label><br>
            <input type="password" name="confirmPassword" placeholder="ReEnter Password Here..." 
                value="<%=DataUtility.getStringData(bean.getConfirmPassword())%>"
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            <font color="red"><%=ServletUtility.getErrorMessage("confirmPassword", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Email Address</label><br>
            <input type="text" name="email" placeholder="Enter Email Address..." 
                value="<%=DataUtility.getStringData(bean.getLogin())%>"
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            <font color="red"><%=ServletUtility.getErrorMessage("email", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Mobile No.</label><br>
            <input type="text" name="mobile" placeholder="Enter 10 Digits mobile No." 
                value="<%=DataUtility.getStringData(bean.getMobileNo())%>"
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
            <font color="red"><%=ServletUtility.getErrorMessage("mobile", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Shipping Address</label><br>
            <textarea rows="5" name="shippingAdd" placeholder="Enter Shipping Address Here..." 
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;"><%=DataUtility.getStringData(bean.getShippingAddress())%></textarea>
            <font color="red"><%=ServletUtility.getErrorMessage("shippingAdd", request)%></font>
        </div>

        <div style="margin-bottom: 15px;">
            <label>Billing Address</label><br>
            <textarea rows="5" name="billingAdd" placeholder="Enter Billing Address Here..." 
                style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;"><%=DataUtility.getStringData(bean.getBillingAddress())%></textarea>
            <font color="red"><%=ServletUtility.getErrorMessage("billingAdd", request)%></font>
        </div>

        <!-- Buttons -->
        <div style="text-align: right;">
            <input type="submit" name="operation" value="<%=UserRegistrationCtl.OP_SIGN_UP%>"
                style="background-color: #007bff; color: white; padding: 8px 16px; border: none; border-radius: 4px; margin-right: 10px; cursor: pointer;">
            <input type="submit" name="operation" value="<%=UserRegistrationCtl.OP_RESET%>"
                style="background-color: #6c757d; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer;">
        </div>
    </form>
</div>

<br>
<%@ include file="Footer.jsp" %>
</body>
</html>

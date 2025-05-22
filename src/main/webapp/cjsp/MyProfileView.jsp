<%@page import="onlinefruitshop.controller.MyProfileCtl"%>
<%@page import="onlinefruitshop.util.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 0; padding: 0;">

<%@ include file="Header.jsp" %>

<section style="text-align: center; padding: 40px 0; background-color: #4CAF50; color: white;">
    <h1 style="margin: 0;">My Profile</h1>
</section>

<div style="padding: 10px 40px;">
    <div style="margin-bottom: 15px;">
        <div>
            <ol style="list-style: none; padding: 0; margin: 0;">
                <li style="display: inline;"><a href="<%=SOTGView.WELCOME_CTL%>" style="color: #4CAF50; text-decoration: none;">Home</a> &gt; </li>
                <li style="display: inline;"><a href="<%=SOTGView.MY_PROFILE_CTL%>" style="color: #777;">My Profile</a></li>
            </ol>
        </div>
    </div>
</div>

<div style="margin: 0 auto; width: 60%; background: white; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); padding: 20px;">
    <div style="background-color: #4CAF50; color: white; padding: 15px; border-radius: 8px 8px 0 0;">
        <strong>My Profile</strong>
    </div>

    <div style="padding: 10px;">
        <font color="red"><%=ServletUtility.getErrorMessage(request)%></font><br>
        <font color="green"><%=ServletUtility.getSuccessMessage(request)%></font>

        <form action="<%=SOTGView.MY_PROFILE_CTL%>" method="post" style="margin-top: 20px;">
            <jsp:useBean id="bean" class="onlinefruitshop.bean.UserBean" scope="request" />

            <input type="hidden" name="id" value="<%=bean.getId()%>">
            <input type="hidden" name="createdBy" value="<%=bean.getCreatedBy()%>">
            <input type="hidden" name="modifiedBy" value="<%=bean.getModifiedBy()%>">
            <input type="hidden" name="createdDatetime" value="<%=DataUtility.getTimestamp(bean.getCreatedDatetime())%>">
            <input type="hidden" name="modifiedDatetime" value="<%=DataUtility.getTimestamp(bean.getModifiedDatetime())%>">

            <div style="margin-bottom: 15px;">
                <label>First Name</label><br>
                <input type="text" name="firstName" placeholder="Enter First Name..." 
                    value="<%=DataUtility.getStringData(bean.getFirstName())%>"
                    style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <font color="red"><%=ServletUtility.getErrorMessage("firstName", request)%></font>
            </div>

            <div style="margin-bottom: 15px;">
                <label>Last Name</label><br>
                <input type="text" name="lastName" placeholder="Enter Last Name..." 
                    value="<%=DataUtility.getStringData(bean.getLastName())%>"
                    style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <font color="red"><%=ServletUtility.getErrorMessage("lastName", request)%></font>
            </div>

            <div style="margin-bottom: 15px;">
                <label>Login Id</label><br>
                <input type="text" name="login" placeholder="Enter Login Id..." 
                    value="<%=DataUtility.getStringData(bean.getLogin())%>"
                    style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <font color="red"><%=ServletUtility.getErrorMessage("login", request)%></font>
            </div>

            <div style="margin-bottom: 15px;">
                <label>Email Address</label><br>
                <input type="text" name="email" placeholder="Enter Email Address..." 
                    value="<%=DataUtility.getStringData(bean.getLogin())%>"
                    style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <font color="red"><%=ServletUtility.getErrorMessage("email", request)%></font>
            </div>

            <div style="margin-bottom: 15px;">
                <label>Mobile No.</label><br>
                <input type="text" name="mobile" placeholder="Enter 10 Digits mobile No." 
                    value="<%=DataUtility.getStringData(bean.getMobileNo())%>"
                    style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;">
                <font color="red"><%=ServletUtility.getErrorMessage("mobile", request)%></font>
            </div>

            <% if(userBean.getRoleId() == 2) { %>
                <div style="margin-bottom: 15px;">
                    <label>Shipping Address</label><br>
                    <textarea name="shippingAdd" placeholder="Enter Shipping Address Here..." rows="4"
                        style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;"><%=DataUtility.getStringData(bean.getShippingAddress())%></textarea>
                    <font color="red"><%=ServletUtility.getErrorMessage("shippingAdd", request)%></font>
                </div>

                <div style="margin-bottom: 15px;">
                    <label>Billing Address</label><br>
                    <textarea name="billingAdd" placeholder="Enter Billing Address Here..." rows="4"
                        style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px;"><%=DataUtility.getStringData(bean.getBillingAddress())%></textarea>
                    <font color="red"><%=ServletUtility.getErrorMessage("billingAdd", request)%></font>
                </div>
            <% } %>

            <div style="text-align: center; margin-top: 20px;">
                <input type="submit" name="operation" value="<%=MyProfileCtl.OP_SAVE%>"
                    style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; margin-right: 10px;">
                <input type="submit" name="operation" value="<%=MyProfileCtl.OP_CHANGE_MY_PASSWORD%>"
                    style="background-color: #2196F3; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer;">
            </div>
        </form>
    </div>
</div>

<br><br>

<%@ include file="Footer.jsp" %>

</body>
</html>
